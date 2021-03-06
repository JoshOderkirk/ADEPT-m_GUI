function textHandle = makeText(parent, text, position, HA, fontSize) 
% To make code more readable use this funciton when setting up text
% parent is the tab or figure that the text is located on
% text is the content to be shown
% position is a 1x4 array [x y w h] where x is the distance from
% the left side of the figure, y is the distance from the bottom of
% the figure, w is the width of the textbox, and h is the height of
% the object box.
% HA is the horizontal alignment of the text, can be left, right or center
% fontSize is the size of the text

textHandle = uicontrol(parent, ...
    'Style', 'text', ...
    'String', text, ...
    'Position', position, ...
    'Units', 'normalized', ...
    'HorizontalAlignment', HA, ...
    'BackgroundColor', 'c', ...
    'FontSize', fontSize);
end