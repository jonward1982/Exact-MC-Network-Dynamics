%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Programs for "Micro-scale foundation with error quantification f
% or the approximation of dynamics on networks" 
% 
% © 2022 by Jonathan Ward is licensed under Attribution 4.0 International. 
% To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/
%
% To attribute this code, please reference the paper:
% "Micro-scale foundation with error quantification for the approximation 
% of dynamics on networks"
% Communications Physics, 2022
% https://doi.org/10.1038/s42005-022-00834-1
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function d=binvec2dec(b)
% function d=binvec2dec(b)
%
% Turns binary rows to integers.

[m,n]=size(b);

% pows=repmat(n-1:-1:0,m,1);
% d=sum(b.*2.^pows,2);

pows=[n-1:-1:0]';
pows2=2.^pows;

% Multiply b by 2^power and sum
d=b*pows2;
