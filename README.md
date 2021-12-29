# octave-pdf-plots
PDF Output for the figures generated by GNU Octave.

## Prerequisites

* A LaTeX distribution (such as MikTeX or TeXLive) is required to compile eps+LaTeX output.
* [*geometry.sty*](https://ctan.org/pkg/geometry) package is also needed for successful compilation.

## Usage
```
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
```


## LICENSE

See LICENSE file for terms of usage and distribution.
