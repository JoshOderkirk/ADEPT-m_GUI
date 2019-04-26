function [hTopMenu,top] = openTopMenu(devObj,newCheck)

% open bulk device menu using class's current properties
%top.num = topnum;

% create and then hide the UI as it is being constructed ------------------
hTopMenu = figure('Visible', 'off', ...
    'Position', [775, 50, 750, 775], ...
    'Name', 'Set Parameters for Top of Device', ...
    'NumberTitle', 'off', ...
    'MenuBar', 'none', ...
    'Units', 'normalized', ...
    'ToolBar', 'none');


hTopTabs = uitabgroup(hTopMenu);

hElecTab = uitab(hTopTabs, 'Title', 'Electrical Properties');
hOptTab = uitab(hTopTabs, 'Title', 'Optical Properties');

% Set object parameters if device is new or being edited ------------------
if newCheck == 1
    setParams(0, 0, 0); %first zero means nothing but is necessary
else
    setParams(0, 0, 2);
end 

% Construct the UI --------------------------------------------------------
% All Tabs

% Basic Section of Basic Parameters Tab

hSurRecoText = uicontrol(hElecTab, ...
    'Style', 'text', ...
    'String', 'Surface recombination velocity for holes', ...
    'Position', [15, 735, 210, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hSurRecoEdit = uicontrol(hElecTab, ...
    'Style', 'edit', ...
    'String', 'infinite', ...
    'Position', [15, 700, 210 , 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateSurRecoEdit);

hSurRecoElecText = uicontrol(hElecTab, ...
    'Style', 'text', ...
    'String', 'Surface recombination velocity for electron', ...
    'Position', [15, 650, 210, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hSurRecoElecEdit = uicontrol(hElecTab, ...
    'Style', 'edit', ...
    'String', 'infinite', ...
    'Position', [15, 600, 155 , 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateSurRecoElecEdit);

hModelNameText = uicontrol(hElecTab, ...
    'Style', 'text', ...
    'String', 'Contact Type:', ...
    'Position', [15, 550, 210, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hModelNameDropdown = uicontrol(hElecTab, ...
    'Style', 'popupmenu', ...
    'String', {'Ideal', 'Blocking', 'Schottky'}, ...
    'Position', [15, 500, 140, 20], ...
    'HorizontalAlignment', 'left', ...
    'Value', 1, ...
    'Units', 'normalized', ...
    'Callback', @UpdateModelName);

hResistanceText = uicontrol(hElecTab, ...
    'Style', 'text', ...
    'String', 'Resistance Type:', ...
    'Position', [15, 450, 140, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hResistanceDropdown = uicontrol(hElecTab, ...
    'Style', 'popupmenu', ...
    'String', {'Contact', 'Grid'}, ...
    'Position', [15, 400, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Value', 1, ...
    'Units', 'normalized', ...
    'Callback', @UpdateResistanceName);

hResistanceValText = uicontrol(hElecTab, ...
    'Style', 'text', ...
    'String', 'Resistance Value:', ...
    'Position', [15, 350, 140, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hResistanceEdit = uicontrol(hElecTab, ...
    'Style', 'edit', ...
    'String', '0', ...
    'Position', [15, 300, 155 , 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateResistanceEdit);


hMetWorkText = uicontrol(hElecTab, ...
    'Style', 'text', ...
    'String', 'Metal Work Function (eV):', ...
    'Position', [15, 250, 150, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hMetWorkEdit = uicontrol(hElecTab, ...
    'Style', 'edit', ...
    'String', '0', ...
    'Position',[15, 200, 150, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateMetWork);


% Optical properties

hShadowText = uicontrol(hOptTab, ...
    'Style', 'text', ...
    'String', 'Shadow Surfacing', ...
    'Position', [15, 735 ,210, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hShadowDropdown = uicontrol(hOptTab, ...
    'Style', 'popupmenu', ...
    'String', {'0', '1'}, ...
    'Position', [15, 710, 150, 20], ...
    'HorizontalAlignment', 'left', ...
    'Value', 1, ...
    'Units', 'normalized', ...
    'Callback', @UpdateShadowName);

hExternalRefText = uicontrol(hOptTab, ...
    'Style', 'text', ...
    'String', 'External Reflectance:', ...
    'Position', [15, 660, 125, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hExternalRefEdit = uicontrol(hOptTab, ...
    'Style', 'edit', ...
    'String', '0', ...
    'Position', [15, 635, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateExternalRef);

hInternalRefText = uicontrol(hOptTab, ...
    'Style', 'text', ...
    'String', 'Internal Reflectance:', ...
    'Position', [15, 585, 155, 20], ...
    'FontSize', 12, ...
    'BackgroundColor', 'c', ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized');

hInternalRefEdit = uicontrol(hOptTab, ...
    'Style', 'edit', ...
    'String', '0', ...
    'Position', [15, 560, 50, 20], ...
    'HorizontalAlignment', 'left', ...
    'Units', 'normalized', ...
    'Callback', @UpdateInternalRef);

hSaveAsButton = uicontrol(hTopMenu, ...
    'Style', 'pushbutton', ...
    'String', 'Save As', ...
    'Position', [480, 15, 75, 40], ...
    'Callback', @SaveAsPress, ...
    'Units', 'normalized', ...
    'FontSize', 16);

device = Adept ;
hTopMenu.Visible = 'on';
end

%Callbacks 

    %global data_list2 
%     data_list2 = [0 0 0 0 0 0 0 0 0 0];

 function UpdateModelName(hObject, ~)

        % Sets the adept device model name to the entered string
        %devObj.model = hObject.String;
      
      
        % Sets the adept device model name to the selected string
        top.model = hObject.String{hObject.Value};
        disp(['Model of Layer: ' top.model]);
%          data_list2(1) = top.model;

 end

function UpdateResistanceName(hObject, ~)
end

function UpdateResistanceEdit(hObject, ~)
   data_list2(2) = str2double( hObject.String)
   
end


function UpdateSurRecoEdit(hObject, ~)
   top.sp = str2double( hObject.String)
   devObj.a_init_bc.ip(1).values = {top.sp};
end

function UpdateSurRecoElecEdit(hObject, ~)
    top.sn = str2double( hObject.String)
   devObj.a_init_bc.ip(2).values = {top.sn};

end

function UpdateMetWork(hObject,~)
   top.chi = str2double( hObject.String)
   devObj.a_init_bc.ip(9).values = {top.chi};

end
    


function UpdateShadowName(hObject,~)
   top.shadow = str2double( hObject.String)
   devObj.a_init_bc.ip(5).values = {top.sp};

    
end 
    function UpdateExternalRef(hObject,~)
    top.Rext = str2double( hObject.String)
   devObj.a_init_bc.ip(6).values = {top.ext};

    end


    function UpdateInternalRef(hObject,~)
    top.Rint = str2double( hObject.String)
   devObj.a_init_bc.ip(7).values = {top.sp};

    end


function setParams(~,~,mode_1)
     if mode_1 < 2
            bc.chi = 4;
            bc.sp = 1;
            bc.sn = 10;
            bc.shadow = 10;
            bc.Rext = 1e19;
            bc.Rint = 1e19;
        else %mode = 2
            % How does adept obj store multiple layers??
            % layer.chi = devObj.semi(layer.num).chi;
            top.chi = devObj.bc.top.chi;
            top.eg = devObj.bc.top.sp;
            top.ks = devObj.bc.top.sn;
            top.shadow = devObj.bc.top.shadow;
            top.nc = devObj.bc.top.Rext;
            top.nv = devObj.bc.top.Rint;
     end
        
        
        if mode_1 > 0
            % update visuals
            hGridResistanceEdit.String = sprintf('%.2f', layer.chi);
            hMetWorkEdit.String = sprintf('%.2f', layer.sp);
            hBlockingSchottkyEdit.String = sprintf('%.2f', layer.sn);
            hShadowFactorEdit.String = sprintf('%.2f', layer.shadow);
            hExternalRefEdit.String = sprintf('%.2E', layer.Rext);
            hInternalRefEdit.String = sprintf('%.2E', layer.Rint);
      
        end
        end


