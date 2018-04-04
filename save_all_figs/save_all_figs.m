function save_all_figs(varargin)
%A function to save all the currently open figures - Adapts on code found on
%stack exchange
% You have the option of passing a path to the function, and the files will
% be passed to that directory. Otherwise, the figures are saved in the
% current directory with their name as the file name - Make sure to name
% figures distinctly, otherwise, they will be overwritten.

%Adding in functionality to specify the folder and file type.
%If you specify the file type i.e. -djpeg, -dpng, -dtiff, -deps

%Save the current path so that it can be reset after saving the figures.
curpath = pwd;
% Change to the path if a path is sent to the function 
if nargin ~= 0
    if ~isempty(find(strcmp(varargin,'Folder'),1))
        FolderName = varargin{find(strcmp(varargin,'Folder'),1)+1};
        mkdir(FolderName);
        cd(FolderName);   
    end
end
%Some code from online help forums to save all open figures
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
    FigHandle = FigList(iFig);
    FigName   = get(FigHandle, 'Name');
    savefig(FigHandle, [FigName '.fig']);
    if nargin ~= 0
        if ~isempty(find(strcmp(varargin,'FileType'),1))
            type1 = varargin{find(strcmp(varargin,'FileType'),1)+1};
            print(FigHandle,FigName,type1)
        end
    end
end
%Set the path back to where it was when the function was called
cd(curpath);

   