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

function r=q_SIS(vs,mu,p)
% function r=q_SIS(vs,mu,p)
%
% Vectorised transition function for SIS
%
% vs is vertex state - should be 0 or 1
% mu is measure - number of infected vertices m
% p is structure of parameters
%
% SIS: 0->1 rate beta*m, 1->0 rate gamma

r=p.beta*mu.*(1-vs)+p.gamma*vs;