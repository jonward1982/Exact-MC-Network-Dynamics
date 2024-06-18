function s=dec2binvec(d,n)
%DEC2BINVEC Convert decimal integer to a binary string.
% 
%   Adapted from matlab code 17/10/14
% 
%   DEC2BIN(D) returns the binary representation of D as a string.
%   D must be a non-negative integer smaller than 2^52.
%
%   DEC2BIN(D,N) produces a binary representation with at least
%   N bits.
%
%   Example
%      dec2bin(23) returns '10111'
%
%   See also BIN2DEC, DEC2HEX, DEC2BASE.

%   Copyright 1984-2008 The MathWorks, Inc.
%   $Revision: 1.13.4.8 $  $Date: 2008/06/24 17:14:49 $

%
% Input checking
%
if nargin<1
    error(nargchk(1,2,nargin,'struct'));
end
if isempty(d)
    s = '';
    return;
end

if ~(isnumeric(d) || islogical(d) || ischar(d))
    error('MATLAB:dec2bin:InvalidDecimalArg','D must be numeric.');
end
if any(d < 0) || any(~isfinite(d)) 
    error('MATLAB:dec2bin:MustBeNonNegativeFinite',...
        'D must be a non-negative integer smaller than 2^52.');
end

if ~isreal(d)
    error('MATLAB:dec2bin:MustBeReal',...
        'D must be real.');
end
    
d = d(:); % Make sure d is a column vector.
d = double(d);

if nargin<2
    n=1; % Need at least one digit even for 0.
else
    if ~(isnumeric(n) || ischar(n)) || ~isscalar(n) || n<0
        error('MATLAB:dec2bin:InvalidBitArg','N must be a positive scalar numeric.');
    end
    n = double(n);
    n = round(n); % Make sure n is an integer.
end;

%
% Actual algorithm
%
[f,e]=log2(max(d)); % How many digits do we need to represent the numbers?
s=rem(floor(d*pow2(1-max(n,e):0)),2);
