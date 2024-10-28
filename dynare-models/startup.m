function startup()
    % Get root directory
    root_dir = fileparts(mfilename('fullpath'));
    fprintf('Root directory: %s\n', root_dir);

    % Add model paths
    addpath(genpath(fullfile(root_dir, 'steady_state')));
    addpath(genpath(fullfile(root_dir, 'simulations')));
    addpath(genpath(fullfile(root_dir, 'results')));

    % Add Dynare paths
    dynare_paths = {
        './dynare-6.0/matlab',
        './dynare-6.0/lib/dynare/mex/matlab',

    };

    % Add paths if they exist
    for i = 1:length(dynare_paths)
        if exist(dynare_paths{i}, 'dir')
            addpath(dynare_paths{i});
        end
    end

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
end