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

import org.junit.Test;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.AfterClass;

import static org.junit.Assert.*;
import static org.junit.matchers.JUnitMatchers.*;
import static org.hamcrest.CoreMatchers.*;

import org.codehaus.groovy.tools.shell.IO;

class ClasspathTest 
{
    def out;

    @BeforeClass
    static void redirectOutput() {
        ExpandoMetaClass.enableGlobally();
        
        Object.metaClass.println = Utils.&println; 
        Object.metaClass.print = Utils.&print;
    }
    
    @Before
    void setIO() {
        out = new ByteArrayOutputStream();
        Utils.setIO(new IO(System.in, out, out));
    }
    
    @AfterClass
    static void setExceptionHandler() {
        def threads = new Thread[Thread.activeCount() * 2];
        Thread.enumerate(threads);
        threads.each {
            if (it) {
                it.setUncaughtExceptionHandler(GroovyServerTest.exceptionHandler);
            }
        }
    }

    @Test
    void objectHasNoSuper() {
        def result = classInfo("java.lang.Object");
        assertThat(result, containsString('("java.lang.Object" type'));
        assertThat(result, not(containsString(":superclasses")));
    }

    @Test
    void superOfIntegerIsNumber() {
        def result = classInfo("java.lang.Integer");
        assertThat(result, containsString('("java.lang.Integer" type'));
        assertThat(result, containsString(':superclasses "java.lang.Number"'));
    }

    @Test
    void inputStreamImplementsCloseable() {
        def result = interfaces(classInfo("java.io.InputStream"));
        assertThat(result, hasItems("java.io.Closeable"));
    }

    @Test
    void outputStreamImplementsCloseableAndFlushable() {
        def result = interfaces(classInfo("java.io.OutputStream"));
        assertThat(result, hasItems("java.io.Closeable", "java.io.Flushable"));
    }

    @Test
    void collectionImplementsIterableE() {
        def result = interfaces(classInfo("java.util.Collection"));
        assertThat(result, hasItems("java.lang.Iterable<E>"));
    }

    @Test
    void scannerImplementsIteratorString() {
        def result = interfaces(classInfo("java.util.Scanner"));
        assertThat(result, hasItems("java.util.Iterator<java.lang.String>"));
    }

    @Test
    void classInfoOfEnumDoesntInfLoop() {
        def result = classInfo("java.lang.Enum");
        assertThat(result, containsString('valueOf'));
    }

    def classInfo(name) {
        new Classpath().getClassInfo(name);
        return out.toString();
    }

    def interfaces(classInfo) {
        def m = classInfo =~ /:interfaces \((.+?)\)/
        return m[0][1].replace('"', "").split(" ").toList();
    }
}
