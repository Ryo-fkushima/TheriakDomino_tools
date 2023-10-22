%
%
%   TDpmcolor for pixelmap colorization
%   by R. Fukushima (ver. Oct 22, 2023)
%
%
% 
clear,close all
[FileName, PathName, FilterIndex] = uigetfile({'*.txt'},'File Selector');
data = readtable(strcat(PathName,FileName));

prompt1 = "Length of the x/y axis (in px):";
xandypix = input(prompt1);

prompt2 = "Do you want to plot contours? [Y/N]:";
contourplottypej = input(prompt2,"s");
if strcmpi(contourplottypej,"Y")
    contourplottype = 1;
else
    contourplottype = 0;
end

intensities = NaN(xandypix*xandypix,1);

intensities(data.Var1,1) = data.Var2;

mat = reshape(intensities,[xandypix,xandypix]);
mat = mat';

if contourplottype == 1
prompt3 = "Manual setting of contour properties? [Y/N]:";
judgevalue = input(prompt3,"s");
if strcmpi(judgevalue,"N")
    
contourf(mat,"LevelStep",0.005,"Fill","on", ...
    "ShowText","on","LabelSpacing",400,"TextStep",0.01, ...
    "LineWidth",0.5) 
colorbar

else

prompt4 = {'Levelstep:','LabelSpacing:','Textstep:','Color fill [Y/N]:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'0.005','400','0.01','Y'};
p4answer = inputdlg(prompt4,dlgtitle,dims,definput);

if strcmpi(p4answer(4),"Y")

contourf(mat,"LevelStep",str2double(p4answer(1)),"Fill","on", ...
    "ShowText","on","LabelSpacing",str2double(p4answer(2)),"TextStep",str2double(p4answer(3)), ...
    "LineWidth",0.5) 
colorbar

else
    contourf(mat,"LevelStep",str2double(p4answer(1)),"Fill","off", ...
    "ShowText","on","LabelSpacing",str2double(p4answer(2)),"TextStep",str2double(p4answer(3)), ...
    "LineWidth",0.5) 
end

end

colormap(jet(32));
xlabel("X")
ylabel("Y")
shading interp;
grid off
daspect([1 1 1])



else

surface(mat)
colormap(jet(256));
shading interp;
xlabel("X")
ylabel("Y")
colorbar
grid off
daspect([1 1 1])


end



