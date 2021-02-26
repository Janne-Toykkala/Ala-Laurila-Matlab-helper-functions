% fitNakaRushton.m
%
%        $Id:$ 
%      usage: fit = fitNakaRushton(c, r, fixed)
%         by: justin gardner
%       date: 12/24/13
%    purpose: fit a naka-rushton to data (taken from selectionModel)
%
function fit = fitNakaRushton(c, r, m)

% check arguments
if nargin < 3
  help fitNakaRushton
  return
end

% find contrast that evokes closest to half-maximal response
rMid = ((max(r)-min(r))/2) + min(r);
[~, rMidIndex] = min(abs(r-rMid));
initC50 = c(rMidIndex(1));

% parameters, offset fixed at 0.5
             %Rmax          c50       n       offset
initParams = [max(r)        initC50   2];
minParams =  [1/6           1e-10     0];
maxParams =  [1             100       5];

% optimization parameters
maxiter = inf;
optimParams = optimset('MaxIter', maxiter, 'Display', 'off');

% now go fit
[params resnorm residual exitflag output lambda jacobian] = ...
  lsqnonlin(@nakaRushtonResidual, ...
  initParams, minParams, maxParams, optimParams, c, r, m);

% parse params and return
fit = parseParams(params, m);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    nakaRushtonResidual    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function residual = nakaRushtonResidual(params, c, r, m)

% decode parameters
p = parseParams(params, m);
% calculate naka-rushton
fitR = nakaRushton(c, p); 

residual = r(:) - fitR(:);
residual = residual(:);

%%%%%%%%%%%%%%%%%%%%%
%    nakaRushton    %
%%%%%%%%%%%%%%%%%%%%%
function response = nakaRushton(c, p)

response = (p.Rmax-p.offset) * ((c.^p.n) ./ ((c.^p.n) + p.c50.^p.n)) + p.offset;

%%%%%%%%%%%%%%%%%%%%%
%    parseParams    %
%%%%%%%%%%%%%%%%%%%%%
function p = parseParams(params, m)

if isfield(m, 'Rmax')
  p.Rmax = m.Rmax;
else
  p.Rmax = params(1);
end

if isfield(m, 'c50')
  p.c50 = m.c50;
else
  p.c50 = params(2);
end

if isfield(m, 'n')
  p.n = m.n;
else
  p.n = params(3);
end

if isfield(m, 'offset')
  p.offset = m.offset;
else
  p.offset = 1/6;
end  