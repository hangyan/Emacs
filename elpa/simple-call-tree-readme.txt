This code analyses a buffer and uses text properties to find
function names (these have the face font-lock-function-name-face).
Therefore, it should work for any source language, as long as it is
fontified correctly.
