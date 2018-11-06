function hBuildMenu = openBuildMenu(devObj)
% opens build menu using class' current properties
% If newCheck == 0, user is editing a preexisting device and object
% parameters are not empty/ don't need to set defaults
% If newCheck == 1, user is creating a new device and therefore the
% defaults need to be set.

global CONST
CONST = A_const;

% create and then hide the UI as it is being constructed ------
hBuildMenu = figure('Visible', 'off', ...
    'Position', [20, 150, 570, 365], ...
    'Name', 'Build Menu', ...
    'NumberTitle', 'off', ...
    'MenuBar', 'none', ...
    'Units', 'normalized', ...
    'ToolBar', 'none');
% construct build menu components ----------------------------

hBuildTitleText = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', 'ADEPT-m: Build Device', ...
    'Position', [15, 310, 350, 40], ...
    'Units', 'normalized', ...
    'FontSize', 24);


hDevNameText = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', 'Device Name:', ...
    'Position', [20, 100, 350, 20], ...
    'FontSize', 12, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

hDevNameText_fromBuildWindow = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', devObj.input_file , ...
    'Position', [130, 100, 350, 20], ...
    'FontSize', 12, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

hTypeText = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', 'Device Type:', ...
    'Position', [15, 240, 100, 20], ...
    'FontSize', 12, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

hDescText = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', 'Description:', ...
    'Position', [15, 205, 90, 20], ...
    'FontSize', 12, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

hTempText = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', 'Temperature:', ...
    'Position', [15, 135, 100, 20], ...
    'FontSize', 12, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

hDevStructText = uicontrol(hBuildMenu, ...
    'Style', 'text', ...
    'String', 'Device Structure', ...
    'Position', [405, 280, 150, 20], ...
    'FontSize', 12, ...
    'Units', 'normalized');

hDevBulkButton = uicontrol(hBuildMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Device Bulk', ...
    'Position', [405, 125, 150, 100], ...
    'Callback', @DevBulkPress, ...
    'Units', 'normalized', ...
    'FontSize', 12);

hTopDevButton = uicontrol(hBuildMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Top of Device', ...
    'Position', [405, 220, 150, 25], ...
    'Callback', @TopDevPress, ...
    'FontSize', 12, ...
    'Units', 'normalized', ...
    'TooltipString', 'This is a test');

hBottomDevButton = uicontrol(hBuildMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Bottom of Device', ...
    'FontSize', 12, ...
    'Position', [405, 105, 150, 25], ...
    'Units', 'normalized', ...
    'Callback', @BottomDevPress);

hAdvancedButton = uicontrol(hBuildMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Advanced', ...
    'Position', [15, 15, 125, 40], ...
    'Callback', @AdvancedPress, ...
    'Units', 'normalized', ...
    'FontSize', 16);

hSaveButton = uicontrol(hBuildMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Save', ...
    'Position', [480, 15, 75, 40], ...
    'Callback', @SavePress, ...
    'Units', 'normalized', ...
    'FontSize', 16);

hTypeDropdown = uicontrol(hBuildMenu, ...
    'Style', 'popupmenu', ...
    'String', {'Solar Cell', 'Diode', 'Generic'}, ...
    'Position', [130, 240, 100, 20], ...
    'Value', 1, ...
    'Units', 'normalized', ...
    'Callback', @UpdateTypeSelected);

hTempUnitDropdown = uicontrol(hBuildMenu, ...
    'Style', 'popupmenu', ...
    'String', {'K', 'C'}, ...
    'Position', [195, 135, 35, 20], ...
    'Value', 1, ...
    'Units', 'normalized');

hDescField = uicontrol(hBuildMenu, ...
    'Style', 'edit', ...
    'Position', [15, 170, 350, 20], ...
    'Callback', @UpdateDesc, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

hTempField = uicontrol(hBuildMenu, ...
    'Style', 'edit', ...
    'String', '300', ...
    'Position', [130, 135, 50, 20], ...
    'Callback', @UpdateTemp, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'left');

% DevNameText = uicontrol(hBuildMenu, ...
%     'Style', 'text', ...
%     'String', 'Enter device name', ...
%     'Position', [15, 100, 150, 20], ...
%     'FontSize', 12, ...
%     'Units', 'normalized', ...
%     'HorizontalAlignment', 'left');

% DevNameBox = uicontrol(hBuildMenu, ...
%     'Style', 'edit', ...
%     'String', 'Enter name here', ...
%     'Position', [15, 70, 180, 20], ...
%     'Callback', @UpdateName, ...
%     'Units', 'normalized', ...
%     'HorizontalAlignment', 'left');
% Initialize the UI. ------------------------------------------
% make UI visible
hBuildMenu.Visible = 'on';

% Build Menu Callbacks ----------------------------------------

    function TopDevPress(hObject, callbackdata)
        % Brings up new menu for selecting properties for the top
        % of device
        
    end

    function DevBulkPress(~, ~)
        % Brings up new menu for selecting properties for the bulk
        % of the device
        
        hBulkMenu = openBulkMenu(devObj, 1);
        
    end

    function BottomDevPress(hObject, callbackdata)
        % Brings up new menu for selecting properties for the
        % bottom of device
        
    end

    function AdvancedPress(hObject, callbackdata)
        % Brings up new menu for selecting advanced properties for
        % the device
        
    end

    function SavePress(~, ~)
        % Brings up new menu for saving the device properties
        disp(['Device Type Selected: ' devObj.type]);
        temp = sprintf('%.2f', devObj.T);
        disp(['Temp of Device: ' temp]);
        disp(['Desc of Device: ' devObj.description]);
        
        data_list = strings([4,4]);%initiate a data list string that gather the data
        data_list(1) = devObj.type;%save type of the device into the first data
        data_list(2) = devObj.T;%save the temperature into the data_list 2
        data_list(3) = devObj.description;%save the description into the data_list 3
        save('Myfunction.mat','data_list');%save the data into myfunction mat
        x = devObj.input_file;
        movefile('Myfunction.mat', [x '.GUI']);%rename the current file 
        
        
    end

    function UpdateTypeSelected(hObject, ~)
        typeVal = hObject.Value;
        typeStr = hObject.String;
        devObj.type = typeStr{typeVal};
        disp(['Device Type Selected: ' devObj.type]);
    end

    function UpdateDesc(hObject, ~)
        % Sets Adept object's desc to new user entered string
        devObj.description = hObject.String;
        disp(['Device Description: ' devObj.description]);
    end
    function UpdateName(hObject, ~)
        % Sets Adept object's name to new user entered string
        devObj.input_file = hObject.String;
        disp(['Device Name: ' devObj.input_file]);
    end
    function UpdateTemp(hObject, ~)
        % Brings up new menu for selecting properties for the
        % bottom of device
        if (hTempUnitDropdown.String{hTempUnitDropdown.Value} == 'C')
            % subtract abs_zero from user input value then assigned
            % to devObj.T
            devObj.T = str2double(hObject.String) - CONST.abs_zero;
            temp_K = sprintf('%.2f', devObj.T);
            disp(['Temperature in C: ',  hObject.String]);
            disp(['Temperature in K: ', temp_K]);
        else % user selected K
            devObj.T = str2double(hObject.String);
            temp = sprintf('%.2f', devObj.T);
            disp(['Temperature in K: ' temp]);
        end
    end
end

        