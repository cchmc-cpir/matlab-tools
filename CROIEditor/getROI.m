function [mask, labels, n] = getROI(imageData)
    roiWindow = CROIEditor(imageData);
    
    % Wait for ROI to be assigned
    waitfor(roiWindow, 'roi');
    if ~isvalid(roiWindow)
        disp('Window closed without applying an ROI. Aborting...');
        return
    end
    
    % Get ROI information
    [mask, labels, n] = roiWindow.getROIData;
    delete(roiWindow)
    
    
%     addlistener(roiWindow, 'MaskDefined', @roi_defined_callback)
%     whos
%     function roi_defined_callback(h, e)
%         [mask, labels, n] = roiWindow.getROIData;
%         delete(roiWindow)
%     end
end

