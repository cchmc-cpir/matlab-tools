# uigetmult

Slight re-work of [`uigetdir2`](https://www.mathworks.com/matlabcentral/fileexchange/9521-uigetdir2) by Chris Cannell.

Opens a UI window that allows the user to select one or multiple folders/files and returns the paths in a vector. The normal `uigetdir` that ships with MATLAB does not allow multiple selection. `uigetfile` does allow multiple selection, but only allows the user to select files, not directories.

## Usage

`[pathname] = uigetmult(start_path, dialog_title)`
