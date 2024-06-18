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

function [qrec,qinf]=Qrates(S,qlist)
% function [qrec,qinf]=Qrates(S,qlist)
% 
% Compute total recovery and infection rate from each state
% Elements in binary representation of S corresponds to the vertices 
% that change in transition rate given by corresponding element in qlist.

% M states, N vertices
[M,N]=size(qlist);

% Binary 
Sbin=dec2binvec(S,N);

% Convert binary to logical - true if infected
infected=logical(Sbin);

% Count those rates where the vertex is infected to get recoveries
qrec=zeros(M,N);
qrec(infected)=qlist(infected);
qrec=sum(qrec,2);

% Count those rates where the vertex is not infected to get infections
qinf=zeros(M,N);
qinf(~infected)=qlist(~infected);
qinf=sum(qinf,2);