function [] = makeVolumeForward(projectInfo)


matlabScriptDir =  which('makeVolumeForward.m');
[matlabScriptDir] = fileparts(matlabScriptDir);

SUBJECT = [projectInfo.subjId '_fs4'];

regFile = fullfile(projectInfo.currentDir,'_MNE_','elp2mri.tran');
elecFile = fullfile(projectInfo.currentDir,'_MNE_','Axx_c001.fif');
fwdOutFile = fullfile(projectInfo.currentDir,'_MNE_',[projectInfo.subjId '-volgrid-fwd.fif']);

shellCmdString = ['!' matlabScriptDir filesep 'skeriVolFwd ' SUBJECT ' ' ...
	regFile ' ' elecFile ' ' fwdOutFile  ];
    
disp(['Executing shell command:'])
disp(shellCmdString);
eval(shellCmdString);

