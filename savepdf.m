function savepdf(path, paperSize, fontSize)
% SAVEPDF  Save current figure as pdf by using pdfLaTeX
%
% savepdf(paperSize, path, fontSize)
%
%   in:  paperSize                size L of the square figure in centimeters
%                                   or [Lx, Ly] for rectangular figure
%        path                     path of the .pdf file without extension
%        fontSize (optional)      if used, default font size is ignored
%
%
%   Examples:
%        savepdf('plots/figure', 9); % use 9cm x 9cm figure
%        savepdf('plots/figure', [9,7]); % use 9cm x 7cm figure
%        savepdf(['plots/figure', 18, 16); % 18cm x 18cm figure, 16pt fonts
%
%   Notes:
%     * a LaTeX distribution is required to run this script.
%
%
% Copyright (C) 2019-2021, M. Neset Cinar
% See LICENSE file for terms of usage and distribution.

  set(gcf, 'PaperUnits', 'centimeters');
  set(gcf, 'PaperPositionMode', 'auto');
  
  if length(paperSize) == 1
    paperSize = repmat(paperSize,[1 2]);
  end
  set(gcf, 'PaperSize', paperSize);
  set(gcf, 'PaperPosition', [0 0 paperSize]);
  
  fontName = get(0,'DefaultAxesFontName');
  if nargin == 3
    fontSetting = ['-F' fontName ':' num2str(fontSize)];
  else
    fontSetting = ['-F' fontName ':' num2str(get(0,'DefaultAxesFontSize'))];
  end
  
  [dir, name, ext] = fileparts(path);
  
  curdir = pwd;
  chdir(dir);
  
  print('-depslatexstandalone', fontSetting, name);
  system(['pdflatex ' name '.tex']);
  
  if ispc()
    cmdClean = ['del /f /q ' name '.aux ' name '.log ' name '-inc-eps-converted-to.pdf'];
  else
    cmdClean = ['rm -rf ' name '.aux ' name '.log ' name '-inc-eps-converted-to.pdf'];
  end
  system(cmdClean);
  chdir(curdir);
endfunction
