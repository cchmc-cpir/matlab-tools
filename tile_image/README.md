# tile_image

Turns a 3D matrix of images into a tiled image with all of the figures. Defaults to approximately square tiled image, but can specify number of rows or columns. Uses name-value pairs to specify certain elements of image creation. Outputs a 2D matrix with tiled image and creates a figure.

## Usage

Tiled_Image = tile_image(Image,Dimension,Optional Name-Value Pairs)

* Image - The 3D matrix you want to display as a tiled image
* Dimension - The dimension from which Images are selected
* 'nRows',val - Specify the number of rows you want - Number of columns is calculated automatically
* 'nColumns',val - Specify the number of columns you want - Number of rows is calculated automatically. If neither nColumns nor nRows are supplied, nRows is calculated as floor(sqrt(NumSlices)) and nColumns is calculated accordingly
* 'Name', name - Give the figure window a name
* 'ColorMap',val - Suppy a colormap. Defaults to grayscale
* 'ZeroOffset',val - make the extra black tiles added in at the end to fill in the leftover boxes a different value than zero - Defaults to 0
* 'StartIndex',val - supply the slice where the tile figure should begin. Defaults to 1 if not supplied
* 'EndIndex',val - supply the slice where the tile figure should end