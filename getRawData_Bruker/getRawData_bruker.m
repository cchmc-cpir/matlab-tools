% function getRawData_bruker(todaysDirectory,runNumber);

% DISABLE FUNCTION CALL FOR DEBUGGING %%%
% todaysDirectory='20161015_123332_FAC450_MF_XeRadial2_1_1';
% todaysDirectory='20161208_143141_FAC450_TA_Xenon_Ventilation_1_5';
% todaysDirectory='20180509_104746_FAC350_DWI_XuefengCao_1_11';
% todaysDirectory='20180514Monkeylung';
% todaysDirectory='20170811_152752_boltzmann_phant_1_1';
% todaysDirectory='20171221_142232_FAC450_IS_Mouse_1_4';
% todaysDirectory='20180405_183234_IRC332A_LungArc_1298_1_4';
%todaysDirectory='20180407_172755_FAC350_JG_test4_1_1';
% todaysDirectory = '20180710_160257_IRC332A_ArcLung_WaterPhantom_1_7';
% todaysDirectory='20180717_143927_FAC450_QA_38mm_1H_1_4';
% runNumber= 8;
% todaysDirectory='20180805_144019_FAC450_diffusionUTE_1_1';
todaysDirectory='20181029_172717_FAC450_diffusionUTE_1_2';
% todaysDirectory='20181116_094100_IS_IRC272A_LD_M3_16wks_1_2';
runNumber=234;
% FUNCTION TO TRANSFER RAW DATA FROM CCHMC BRUKER 7T TO CURRENT DIRECTORY

% SYNTAX getRawData_bruker('todaysDirectory',studyNumber);
% i.e. getRawData_bruker('20160718_154654_FAC450_TA_MF_MouseHandling_1_2',7)

user='CPIR2';pass='lesssignal';
remotePath=strcat(['/opt/PV6.0/data/CPIR2/',todaysDirectory,'/',num2str(runNumber),'/']);
% remotePath=strcat(['/opt/DICOM/FAC350XuefengMonkeylung/',todaysDirectory,'/',num2str(runNumber),'/']);
% localPath=strcat([char(pwd),'\importedData\']);
% remotePath='/opt/DICOM/FAC450/PeterPhantoms';
localPath='/home/cleveland/Desktop/getRawData_bruker/importedData/';

%% IP Address needs confirmed!!
source='10.8.1.207';

a=sprintf('Connecting to remote host %s',source);disp(a); % NOTIFY OF SEARCH
ssh2_conn = ssh2_config(source,user,pass);
% ssh2_conn = ssh2_command(ssh2_conn, 'ls -la');

% a=sprintf('searching %s',remotePath);disp(a); % NOTIFY OF SEARCH

tarCommandString=strcat(['tar -zcvf grabdata.tar.gz ',char(remotePath),'*']);
a=sprintf('Tarring and gZipping %s',remotePath);disp(a);
ssh2_conn = ssh2_command(ssh2_conn, tarCommandString);
tarBallName='grabdata.tar.gz';
tarPath='/home/CPIR2/';
a=sprintf('Getting %s',tarBallName);disp(a);
scp_simple_get(source,user,pass,tarBallName,localPath,tarPath);
a=sprintf('Removing %s from host.',tarBallName);disp(a);
ssh2_conn = ssh2_command(ssh2_conn, 'rm grabdata.tar.gz');
a=sprintf('UnGZipping %s locally.',tarBallName);disp(a);
cd(localPath);%added by Jinbang Guo, 07/20/2017
cd ../%added by Jinbang Guo, 07/20/2017
gunzip('importedData/grabdata.tar.gz','importedData/')
a=sprintf('Untarring %s locally.',tarBallName);disp(a);
untar('importedData/grabdata.tar.gz','importedData/');
a=sprintf('Removing local tarballs.');disp(a);
delete importedData/grabdata.tar.gz;
delete importedData/grabdata.tar;
%a=sprintf('All done, look for data in %s',localPath);disp(a);

dirToRemove=strcat('/home/cleveland/Desktop/getRawData_bruker/importedData/opt/PV6.0/data/CPIR2/',todaysDirectory);

copyfile('/home/cleveland/Desktop/getRawData_bruker/importedData/opt/PV6.0/data/CPIR2/',...
    '/home/cleveland/Desktop/','f');
delete(strcat(dirToRemove,'/',num2str(runNumber),'/pdata/1/*'));
rmdir(strcat(dirToRemove,'/',num2str(runNumber),'/pdata/1'));
rmdir(strcat(dirToRemove,'/',num2str(runNumber),'/pdata'));
delete(strcat(dirToRemove,'/',num2str(runNumber),'/*'));
rmdir(strcat(dirToRemove,'/',num2str(runNumber)));
rmdir(dirToRemove);
a=sprintf('File folder should be on desktop.');disp(a);

%clear all;
