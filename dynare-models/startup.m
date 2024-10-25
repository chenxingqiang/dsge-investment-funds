function startup()
    % Get the root directory
    root_dir = fileparts(mfilename('fullpath'));
    fprintf('Root directory: %s\n', root_dir);
    
    % Add model paths
    addpath(genpath(fullfile(root_dir, 'steady_state')));
    addpath(genpath(fullfile(root_dir, 'simulations')));
    addpath(genpath(fullfile(root_dir, 'results')));
    
    % Add Dynare path for macOS (Homebrew installation)
    dynare_path = '/opt/homebrew/opt/dynare/lib/dynare/matlab';
    
    % Check if Dynare path exists
    if ~exist(dynare_path, 'dir')
        error(['Dynare not found in ' dynare_path '. Please check installation.']);
    end
    
    % Add Dynare to path
    addpath(dynare_path);
    
    % Try to initialize Dynare
    try
        dynare_config();
        fprintf('Dynare initialized successfully.\n');
    catch ME
        fprintf('Error initializing Dynare: %s\n', ME.message);
        rethrow(ME);
    end
    
    % Print configuration information
    fprintf('Project paths initialized.\n');
    fprintf('Dynare path: %s\n', dynare_path);
    
    % Verify Dynare is properly added to path
    if exist('dynare', 'file')
        fprintf('Dynare found in MATLAB path.\n');
    else
        warning('Dynare not found in MATLAB path after initialization.');
    end
end