# save_all_figs

Saves every figure currently open in Matlab as a .fig and optionally as an additional image format (jpg, png, etc). It uses the name of the figure as the file name when saving, so it is a good idea to initialize all figures with 
figure('Name','Descriptive Figure Name')

## Usage

* save_all_figs() saves every figure open in Matlab as a .fig in the current path
* save_all_figs('Folder',path) saves every figure as a .fig in the path specified (it will create folders if need be)
* save_all_figs('FileType','-djpeg') saves every figure as both a .fig and the specified image type, in this case .jpeg.