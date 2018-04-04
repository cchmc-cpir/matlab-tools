# TiffDicomWrite

Function to save a matlab 3-D matrix of doubles as both a stack of Tiffs and a DICOM file. 

## Usage

TiffDicomWrite(FileName,Image,VS)

### Inputs
* FileName - String containing the desired filename - extension not necessary
* Image - 3D matrix of either complex or real doubles that you want to save as a stack of Tiffs and DICOM
* VS - voxel size in mm(if you want to have the correct resolution included the DICOM header). If not included, defaults to [1 1 1].
