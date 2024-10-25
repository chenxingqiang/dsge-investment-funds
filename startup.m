% startup.m
function startup()
    clc;
    % Get the directory containing this file
    root_dir = fileparts(mfilename('fullpath'));
    
    % Add all subdirectories to path
    addpath(genpath(fullfile(root_dir, 'src')));
    addpath(genpath(fullfile(root_dir, 'lib')));
    addpath(genpath(fullfile(root_dir, 'tests')));
    addpath(genpath(fullfile(root_dir, 'results')));
    
    fprintf('Project paths initialized.\n');
end