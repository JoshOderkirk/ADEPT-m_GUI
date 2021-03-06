function [hBulkMenu, layer] = openBulkMenu(devObj, newCheck, layerNum)

% open bulk device menu using class's current properties
layer.num = layerNum;

% create and then hide the UI as it is being constructed ------------------
hBulkMenu = figure('Visible', 'off', ...
    'Position', [775, 50, 750, 775], ...
    'Name', 'Set Parameters for Bulk of Device', ...
    'NumberTitle', 'off', ...
    'MenuBar', 'none', ...
    'Units', 'normalized', ...
    'ToolBar', 'none');


hBulkTabs = uitabgroup(hBulkMenu);

hBasicTab = uitab(hBulkTabs, 'Title', 'Basic Parameters');
hTrapTab = uitab(hBulkTabs, 'Title', 'Trap Parameters');
hOptTab = uitab(hBulkTabs, 'Title', 'Optical Parameters');

% Set object parameters if device is new or being edited ------------------
if newCheck == 1
    setParams(0, 0, 0); %first zero means nothing but is necessary
else
    setParams(0, 0, 2);
end 

% Construct the UI --------------------------------------------------------
% All Tabs
hResetButton = uicontrol(hBulkMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Reset', ...
    'Position', [380, 15, 75, 40], ...
    'Callback', @ResetPress, ...
    'Units', 'normalized', ...
    'FontSize', 16);

hDeleteButton = uicontrol(hBulkMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Delete', ...
    'Position', [480, 15, 75, 40], ...
    'Callback', @DeletePress, ...
    'Units', 'normalized', ...
    'FontSize', 16);

% Basic Section of Basic Parameters Tab
hModelNameText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Semiconductor Model Name:', ...
    'Position', [15, 735, 210, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hModelNameDropdown = uicontrol(hBasicTab, ...
    'Style', 'popupmenu', ...
    'String', {'Custom', 'Simple', 'Silicon', 'Gallium Arsenide', 'Germanium'}, ...
    'Position', [15, 710, 150, 20], ...
    'HorizontalAlignment', 'left', ...
    'Value', 1, ...
    'Units', 'normalized', ...
    'Callback', @UpdateModelName);

hThicknessText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Layer Thickness:', ...
    'Position', [15, 660, 125, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hThicknessEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '-999', ...
    'Position', [15, 635, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateThickness);

hThicknessUnitDropdown = uicontrol(hBasicTab, ...
    'Style', 'popupmenu', ...
    'String', {'cm', 'um', 'nm', 'A'}, ...
    'Position', [70, 635, 50, 20], ...
    'Value', 1, ...
    'Units', 'normalized');
    

<<<<<<< HEAD
=======
hEleAffinEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '4.00', ...
    'Position', [15, 560, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateEleAffin);
>>>>>>> 5a779391b49835271467c439c7e7d79a58f3ba45

% Doping Section of Trap Parameters Tab

<<<<<<< HEAD
% Optical Generation Section of Optical Parameters Tab

% Parasitic Absorption Section of Optical Parameters  Tab

=======
hBandgapEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '1.00', ...
    'Position', [15, 485, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateBandgap);

hDieleConstText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Dielectric Constant:', ...
    'Position', [15, 435, 150, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hDieleConstEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '10.00', ...
    'Position', [15, 410, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateDieleConst);

hConductBandText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Conduction Band Effective Density of States (#/cm^3):', ...
    'Position', [15, 360, 390, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hConductBandEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '1.00E+19', ...
    'Position', [15, 335, 100, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateConductBand);

hValenceBandText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Valence Band Effective Density of States (#/cm^3):', ...
    'Position', [15, 285, 365, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hValenceBandEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '1.00E+19', ...
    'Position', [15, 255, 100, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateValenceBand);

hElecThermVelocityText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Electron Thermal Velocity (cm/s):', ...
    'Position', [15, 210, 240, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hElecThermVelocityEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '1.00E+07', ...
    'Position', [15, 180, 100, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateElecThermVelocity);

hHoleThermVelocityText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Hole Thermal Velocity (cm/s):', ...
    'Position', [15, 135, 215, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hHoleThermVelocityEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '1.00E+07', ...
    'Position', [15, 105, 100, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateHoleThermVelocity);

% Mobility Section of Basic Parameters Tab
hHoleMobilityText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Hole Mobility (cm^2/V-s):', ...
    'Position', [15, 60, 180, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hHoleMobilityEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '100.00', ...
    'Position', [415, 670, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateHoleMobility);

hElecMobilityText = uicontrol(hBasicTab, ...
    'Style', 'text', ...
    'String', 'Electron Mobility (cm^2/V-s):', ...
    'Position', [415, 700, 205, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hElecMobilityEdit = uicontrol(hBasicTab, ...
    'Style', 'edit', ...
    'String', '100.00', ...
    'Position', [15, 30, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateElecMobility);

% Doping Section of Trap Parameters Tab

% Optical Generation Section of Optical Parameters Tab

% Parasitic Absorption Section of Optical Parameters  Tab

>>>>>>> 5a779391b49835271467c439c7e7d79a58f3ba45
hSaveAsButton = uicontrol(hBulkMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Save As', ...
    'Position', [480, 15, 75, 40], ...
    'Callback', @SaveAsPress, ...
    'Units', 'normalized', ...
    'FontSize', 16);

% Initialize the UI. ------------------------------------------------------
    device = Adept;
% make UI visible
hBulkMenu.Visible = 'on';

% Bulk Menu Callbacks -----------------------------------------------------
    function UpdateModelName(hObject, ~)

        % Sets the adept device model name to the entered string
        %devObj.model = hObject.String;
      
      
    global data_list
        % Sets the adept device model name to the selected string
        layer.model = hObject.String{hObject.Value};
        disp(['Model of Layer: ' layer.model]);
          data_list(5) = layer.model;

    end

    function UpdateThickness(hObject, ~)
        % Converts entered value into cenimeters then sets the layer 
        % thickess to the converted value. Grab the units from
        % hThicknessUnitDropdown. adept object variable is any of the
        % following: t_A, t_nm, t_um, t_cm
        %data_list(5) = hObject.String;
    end

    function UpdateEleAffin(hObject, ~)
        % Sets the electron affinity to the new value. adept object
        % variable is chi

    
        layer.chi = str2double(hObject.String);
        disp(['Electron Affinity of layer: ' sprintf('%.2f', layer.chi)]);
     data_list(6) = layer.chi;

    end

    function UpdateBandgap(hObject, ~)
        % Sets the bandgap to the new value. adept object
        % variable is Eg or eg

         

        layer.eg = str2double(hObject.String);
        disp(['Bandgap of Layer: ' sprintf('%.2f', layer.eg)]);
        data_list(7) = hObject.String;
    end

    function UpdateDieleConst(hObject, ~)
        % Sets the dielectric constant to the new value. adept object
        % variable is ks

         

        layer.ks = str2double(hObject.String);
        disp(['Dielectric Constant of Layer: ' sprintf('%.2f', layer.ks)]);
        data_list(8) = layer.ks;
    end

    function UpdateConductBand(hObject, ~)
        % Sets the conduction band effective density of states to the new 

        % value. adept object variable is Nc
      
                 % value. adept object variable is nc
        layer.nc = str2double(hObject.String);
        disp(['conduction band effective density of states of Layer: ', ...
            sprintf('%.2E', layer.nc)]);
            data_list(9) = layer.nc;
<<<<<<< HEAD
    end
    function SaveAsPress(hObject, ~)
          % Sanna's Save function
    end

    function UpdateValenceBand(hObject, ~)
        % Sets the valence band effective density of states to the new 
        % value. adept object variable is nv
        layer.nv = str2double(hObject.String);
        disp(['Valence band effective density of states of Layer: ', ...
            sprintf('%.2E', layer.nv)]);
    end
=======
    end
    function SaveAsPress(hObject, ~)
          % Sanna's Save function
    end

    function UpdateValenceBand(hObject, ~)
        % Sets the valence band effective density of states to the new 
        % value. adept object variable is nv
        layer.nv = str2double(hObject.String);
        disp(['Valence band effective density of states of Layer: ', ...
            sprintf('%.2E', layer.nv)]);
    end
>>>>>>> 5a779391b49835271467c439c7e7d79a58f3ba45

    function UpdateElecThermVelocity(hObject, ~)
        % Sets the electron thermal velocity to the new 
        % value. adept object variable is vthn
        layer.vthn = str2double(hObject.String);
        disp(['electron thermal velocity of Layer: ', ...
            sprintf('%.2E', layer.vthn)]);
    end

    function UpdateHoleThermVelocity(hObject, ~)
        % Sets the electron thermal velocity to the new 
        % value. adept object variable is vthn
        layer.vthp = str2double(hObject.String);
        disp(['Hole thermal velocity of Layer: ', ...
            sprintf('%.2E', layer.vthp)]);
    end

    function ResetPress(hObject, ~)       
        answer = questdlg('Are you sure you want to reset all parameters?', ...
            'Reset Parameters?', 'Yes', 'Cancel', 'Yes');
        
        % Handle response
        switch answer
            case 'Yes'
                setParams(0,0,1);
            case 'Cancel'
                % Do nothing
        end
    end

    % Create Utility functions
    function setParams(~,~,mode)
        % INPUTS: ~ means that an input is passed that is unnecessary.
        % These are automatic inputs cause by using the function in a
        % callback. Mode having the following inputs means the following: 
        % 0: The layer is completely new and is being generated with defaults.
        % 1: The layer is being reset to the default parameters by the user.
        % 2: The layer is loading the paramters of a previously defined
        % layer (Assuming only one exists).
        
        % update adept obj params
        if mode < 2
            layer.chi = 4;
            layer.eg = 1;
            layer.ks = 10;
            layer.nc = 1e19;
            layer.nv = 1e19;
            layer.vthn = 1e7;
            layer.vthp = 1e7;
            layer.un = 100;
            layer.up = 100;

        else %mode = 2
            % How does adept obj store multiple layers??
            % layer.chi = devObj.semi(layer.num).chi;
            layer.chi = devObj.semi.chi;
            layer.eg = devObj.semi.eg;
            layer.ks = devObj.semi.ks;
            layer.nc = devObj.semi.nc;
            layer.nv = devObj.semi.nv;
            layer.vthn = devObj.semi.vthn;
            layer.vthp = devObj.semi.vthp;
            layer.un = devObj.semi.un;
            layer.up = devObj.semi.up;
            
        end
        
        if mode > 0
            % update visuals
            hEleAffinEdit.String = sprintf('%.2f', layer.chi);
            hBandgapEdit.String = sprintf('%.2f', layer.eg);
            hDieleConstEdit.String = sprintf('%.2f', layer.ks);
            hConductBandEdit.String = sprintf('%.2E', layer.nc);
            hValenceBandEdit.String = sprintf('%.2E', layer.nv);
            hElecThermVelocityEdit.String = sprintf('%.2E', layer.vthn);
            hHoleThermVelocityEdit.String = sprintf('%.2E', layer.vthp);
            hElecMobilityEdit.String = sprintf('%.2f', layer.un);
            hHoleMobilityEdit.String = sprintf('%.2f', layer.up);
        end
    end
end

