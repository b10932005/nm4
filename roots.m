format long

f = @(x) - 2 * x^6 - 1.5 * x^4 + 10 * x + 2;

bisect(f, 0, 2)
secant(f, 0, 1)

function [root, fx, ea, iter] = bisect(func, xl, xu, es, maxit)
    if nargin < 3, error('at least 3 input arguments required'), end
    test = func(xl) * func(xu);
    if test > 0, error('no sign change'), end
    if nargin < 4 || isempty(es), es = 0.0001; end
    if nargin < 5 || isempty(maxit), maxit = 50; end
    iter = 0; xr = xl; ea = 100;
    while (1)
        xrold = xr;
        xr = (xl + xu) / 2;
        iter = iter + 1;
        if xr ~= 0, ea = abs((xr - xrold) / xr) * 100; end
        test = func(xl) * func(xr);
        if test < 0
            xu = xr;
        elseif test > 0
            xl = xr;
        else
            ea = 0;
        end
        if ea <= es || iter >= maxit, break, end
    end
    root = xr; fx = func(xr);
end

function [root, ea, iter] = secant(func, xc, xp, es, maxit)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001; end
    if nargin < 5 || isempty(maxit), maxit = 50; end
    iter = 0;
    xn = xc - func(xc) * (xp - xc) / (func(xp) - func(xc)); % next

    while (1)
        %   xrold = xr;
        %   if iter == 0, xrold=xr-1e-5; end
        xp = xc;
        xc = xn;
        xn = xc - func(xc) * (xp - xc) / (func(xp) - func(xc)); % next

        iter = iter + 1;
        if xn ~= 0, ea = abs((xn - xc) / xn) * 100; end
        if ea <= es || iter >= maxit, break, end
    end
    root = xn;
end
