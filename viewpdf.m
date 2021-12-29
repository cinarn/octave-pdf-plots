function viewpdf(filename)
% VIEWPDF  View current figure as pdf by using the default .pdf viewer
%
% viewpdf(filename)
%
%   in:  filename                 path of the .pdf file without extension
%        fontSize (optional)      if used, default font size is ignored
%
%
% Copyright (C) 2019-2021, M. Neset Cinar
% See LICENSE file for terms of usage and distribution.

  if ispc()
    system(['start ' filename '.pdf']);
  elseif isunix()
    system(['xdg-open ' filename '.pdf']);
  else % mac
    system(['open ' filename '.pdf']);
  end
endfunction
