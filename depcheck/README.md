# depcheck
A simple function that returns a list of the depdencies, or function files required by the specified `*.m` file.

This is meant to be a handy little tool if you're staring at something for the first time and aren't sure what you'll need to run it/just want to know what's going on.

## Usage
Add this function in your project directory somewhere/add its path in your script. 

To use: `depList = depcheck('scriptName.m')`. This returns a list of the functions/files required to run `scriptName.m`.
