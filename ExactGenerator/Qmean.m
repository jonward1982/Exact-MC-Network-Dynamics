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

function [l,qm,qstd,varargout]=Qmean(q,levels,N)
% function [l,qm,qstd,varargout]=Qmean(q,levels,N)
%
% For binary states with transition rates q (produced by qinf), 
% computes the mean rate per level, 
% as well as standard deviation, minimum and maximum

l=[0:N]';
qm=zeros(N+1,1);
qstd=zeros(N+1,1);
qmin=zeros(N+1,1);
qmax=zeros(N+1,1);

for i=0:N
    qm(i+1)=mean(q(levels==i));
    qstd(i+1)=std(q(levels==i));
    qmin(i+1)=min(q(levels==i));
    qmax(i+1)=max(q(levels==i));
end

varargout{1}=qmin;
varargout{2}=qmax;
