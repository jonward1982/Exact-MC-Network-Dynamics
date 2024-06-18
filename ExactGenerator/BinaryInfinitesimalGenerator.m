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

function [Q,qlist]=BinaryInfinitesimalGenerator(S,tolist,mu,N,p)
% function [Q,qlist]=BinaryInfinitesimalGenerator(S,tolist,mu,N,p)
%
% Creates a sparse matrix of infinitesimal generator

% Vertex state of the transition vertex
Sbin=dec2binvec(S,N);

% Transition rates
qab=str2func(p.qname);
qlist=qab(Sbin,mu,p);

% Total rate out
qtot=sum(qlist,2);

% Reshape q
q=reshape(qlist,N*2^N,1);

% Create edges of Markov graph from tolist
from=repmat([1:2^N]',N,1);
to=reshape(tolist,N*2^N,1);

% Append diagonal elements
from=[from; [1:2^N]'];
to=[to; [1:2^N]'];
q=[q; -qtot];

Q=sparse(from,to,q,2^N,2^N);