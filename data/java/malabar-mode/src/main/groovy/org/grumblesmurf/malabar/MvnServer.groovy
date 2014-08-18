/**
 * Copyright (c) 2009, 2010 Espen Wiborg <espenhw@grumblesmurf.org>
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 */ 
package org.grumblesmurf.malabar;

import org.apache.maven.Maven;
import org.apache.maven.RepositoryUtils;
import org.apache.maven.artifact.Artifact;
import org.apache.maven.artifact.factory.ArtifactFactory;
import org.apache.maven.artifact.resolver.ArtifactResolver
import org.apache.maven.cli.MavenCli;
import org.apache.maven.cli.MavenLoggerManager;
import org.apache.maven.execution.DefaultMavenExecutionRequest;
import org.apache.maven.execution.ExecutionListener;
import org.apache.maven.execution.MavenExecutionRequest;
import org.apache.maven.execution.MavenExecutionRequestPopulationException;
import org.apache.maven.execution.MavenExecutionRequestPopulator;
import org.apache.maven.execution.MavenExecutionResult;
import org.apache.maven.model.building.ModelProcessor;
import org.apache.maven.settings.building.DefaultSettingsBuildingRequest;
import org.apache.maven.settings.building.SettingsBuilder;

import org.codehaus.plexus.ContainerConfiguration;
import org.codehaus.plexus.DefaultContainerConfiguration;
import org.codehaus.plexus.DefaultPlexusContainer;
import org.codehaus.plexus.classworlds.ClassWorld;
import org.codehaus.plexus.logging.Logger;

import org.sonatype.aether.RepositorySystem;
import org.sonatype.aether.resolution.ArtifactRequest;
import org.sonatype.aether.transfer.TransferListener;

public class MvnServer
{
    final Logger logger;
    final TransferListener transferListener;
    final ExecutionListener executionListener;
    final Maven maven;
    final ModelProcessor modelProcessor;

    final def plexus

    def boolean showErrors = false;
    def int loggingLevel = Logger.LEVEL_INFO;

    def verbose(boolean flag) {
        showErrors = flag;
        loggingLevel = flag ? Logger.LEVEL_DEBUG : Logger.LEVEL_INFO;
        
        maven.logger.setThreshold(loggingLevel);
        logger.setThreshold(showErrors ? 0 : 1);

	return  "flag=" + flag;
    }


    MvnServer() {
        ClassWorld classWorld = new ClassWorld("plexus.core",
                                               Thread.currentThread().getContextClassLoader());
        ContainerConfiguration cc =
            new DefaultContainerConfiguration(classWorld:classWorld, name:"embedder");

        plexus = new DefaultPlexusContainer(cc);
        logger = new MvnServerLogger();
        plexus.loggerManager = new MavenLoggerManager(logger);
        plexus.loggerManager.thresholds = loggingLevel;
        maven = plexus.lookup(Maven.class);
        logger.debug("MAVEN=" + maven);
        modelProcessor = plexus.lookup(ModelProcessor.class);
        
        transferListener = new MvnServerTransferListener();
        executionListener = new ExecutionEventLogger(logger);
    }
    
    public MavenExecutionRequest newRequest(basedir, profiles) {
        def systemProperties = new Properties()
        systemProperties += System.properties

        return new DefaultMavenExecutionRequest(
            userSettingsFile:MavenCli.DEFAULT_USER_SETTINGS_FILE,
            globalSettingsFile:MavenCli.DEFAULT_GLOBAL_SETTINGS_FILE,
            systemProperties:systemProperties,
            baseDirectory:basedir,
            pom:modelProcessor.locatePom(basedir),
            transferListener:transferListener,
            showErrors:showErrors,
            loggingLevel:loggingLevel,
            executionListener:executionListener).with { req ->
            def settings = withComponent(SettingsBuilder.class) {
                def sbr = new DefaultSettingsBuildingRequest(globalSettingsFile:req.globalSettingsFile,
                                                             userSettingsFile:req.userSettingsFile);
                it.build(sbr).effectiveSettings;
            }

            profiles.each {
                req.addActiveProfile(it);
            }
            
            withComponent(MavenExecutionRequestPopulator.class) {
                it.populateFromSettings(req, settings);
                it.populateDefaults(req);
            }

            withComponent(Maven.class) {
                req.projectBuildingRequest.repositorySession = it.newRepositorySession(req);
            }
            
            req
        }
    }

    def withComponent(c, clos) {
        def comp = plexus.lookup(c);
        try {
            return clos(comp);
        } finally {
            plexus.release(comp);
        }
    }

    public boolean run(String pomFileName, String... goals) {
        return run(pomFileName, false, goals).run();
    }

    public RunDescriptor run(String pomFileName, boolean recursive, String... goals) {
        return new RunDescriptor(
            mvnServer:this,
            pom:pomFileName as File,
            recursive:recursive,
            goals:goals);
    }

    public Artifact classfiedArtifact(Artifact artifact, String classifier) {
        withComponent(org.apache.maven.artifact.factory.ArtifactFactory) { af ->
            return af.createArtifactWithClassifier(artifact.groupId,
                                                   artifact.artifactId,
                                                   artifact.version,
                                                   artifact.type,
                                                   classifier)
        }
    }

    public boolean resolveArtifact(Artifact artifact, MavenExecutionRequest request) {
        withComponent(RepositorySystem) { repoSystem ->
            def artifactRequest = new ArtifactRequest()
            artifactRequest.artifact = RepositoryUtils.toArtifact(artifact)
            artifactRequest.repositories = RepositoryUtils.toRepos(request.remoteRepositories)
            try {
                def result = repoSystem.resolveArtifact(request.projectBuildingRequest.repositorySession,
                                                        artifactRequest)
                return result.resolved
            } catch (e) {
                e.printStackTrace()
                // TODO log
                return false;
            }
        }
    }
}

class RunDescriptor 
{
    File pom;
    boolean recursive;
    String[] goals;
    String[] profiles = new String[0];
    Properties properties = new Properties();
    int loggingLevel = Logger.LEVEL_INFO;
    boolean showErrors = false;
    
    MvnServer mvnServer;

    public RunDescriptor addProperty(String key, String value) {
        properties.put(key, value);
        return this;
    }
    
    

    public boolean run() {
        PrintStream oldOut = System.out;
        PrintStream oldErr = System.err;
        try {
            if (Utils._io.get()) {
                System.setOut(new PrintStream(Utils._io.get().outputStream));
                System.setErr(new PrintStream(Utils._io.get().errorStream));
            }
                    
            mvnServer.newRequest(pom.parentFile, profiles).with {
                goals = Arrays.asList(owner.goals)
                recursive = owner.recursive
                userProperties = owner.properties

                setLoggingLevel(loggingLevel);
                setShowErrors(showErrors);
                mvnServer.logger.debug("loggingLevel=" + getLoggingLevel() +
                                       " showErrors=" + isShowErrors() + 
                                       " maven=" + mvnServer.maven);
                mvnServer.logger.debug("Delegate " + delegate);
                
                mvnServer.maven.execute(delegate).with {

                     if (hasExceptions()) {
                         exceptions.each {mvnServer.logger.error("Execution error", it)}
                     }
                    !hasExceptions();
                }
            }
        } finally {
            System.setOut(oldOut);
            System.setErr(oldErr);
        }
    }
}
