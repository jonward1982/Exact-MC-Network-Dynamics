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

function [S,tolist,mu,levels]=BinaryMarkovGraph(N,p)
% function [S,tolist,mu,levels]=binary_Markov_graph(N,p)
%
% For binary state-space, graph with N vertices
% and neighbours of ith vertex given by the ith cell 
% of p.neighbours returns:
% S - state space, ordered by level
% tolist - 2^NxN matrix of transition pairs
% mu - metric corresponding to number of infected vertices

S=[0:2^N-1]';
Sbin=dec2binvec(S,N);

% Sort by levels
ind=1:2^N;
levels=sum(Sbin,2);
[levels,sind]=sort(levels);
S=S(ind(sind));
Sbin=dec2binvec(S,N);
% Need to be able to map from states to indices
[~,iind]=sort(sind);

% States that form transition pair with.
tolist=zeros(2^N,N);

% Metric mu - number of infected neighbours of transition vertex
mu=zeros(2^N,N);

% Loop over vertices
for i=1:N 
   % State go to - flip vertex i
   Sbinto=Sbin;
   Sbinto(:,i)=1-Sbinto(:,i);
   % Change to decimal
   Sto=binvec2dec(Sbinto);
   % Convert state to index
   indto=iind(Sto+1);
   tolist(:,i)=indto;
   % tolist(:,i)=Sto;
   % Metric - number of infected neighbours of i
   mu(:,i)=sum(Sbin(:,p.neighbours{i}),2);   
end