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

function neighbours=NeighboursAdjacency(A)
% function neighbours=neighbours_adjacency(A)
%
% Creates adjacency list from adjacency matrix A
% Outputs a cell array of lists of neighbours

N=size(A,1);

neighbours=cell(N,1);
ind=1:N;

for i=1:N
    neighbours{i}=ind(logical(A(i,:)));
end