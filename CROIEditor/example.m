function mask = example 
       myimage = imread('eight.tif');
       roiwindow = CROIEditor(myimage);

       addlistener(roiwindow,'MaskDefined',@your_roi_defined_callback)
       whos
       function your_roi_defined_callback(h,e)
            [mask, labels, n] = roiwindow.getROIData;
            delete(roiwindow); 
       end
end