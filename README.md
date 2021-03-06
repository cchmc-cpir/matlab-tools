# matlab-tools
Any interesting one-off MATLAB functions/scripts that could be useful to others.

## Using this repository
Create a new folder for your function/script/other to keep things separated. Make sure you title the folder/files using descriptive names, and include a very short README.md file (like this one) with directions for using your contribution in the sub-folder. This will make it easy for people to know exactly what they're looking at.

Be sure to update the section below if you add something new.

## Packages
  * `depcheck` - check a file for any dependencies (functions/classes it needs to run)
  * `uigetmult` - reimplementation of `uigetdir` and `uigetfile` that returns the paths to multiple selected files or directories
  * `yaml-matlab` - functions to read/write YAML files, which are very useful for input files, etc. due to their readability
  * 'TiffDicomWrite' - function to write a 3D matrix of doubles to a stack of tiff images and a DICOM file
  * 'save_all_figs' - function to save every figure currently open in matlab
  * 'Optimum_Angle' - Calculates optimal flip angle for radial HP gas imaging given number of excitations
