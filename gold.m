format long

f = @(x)9 * exp(-x) * sin(2 * pi * x) - 3.5;
g = @(x) - 9 * exp(-x) * sin(2 * pi * x) + 3.5;

[x, fx] = gold_min(f, 0, 2);
[x, fx] = gold_min(g, 0, 2);
[x, fx] = brute_force(f, 0, 2);
[x, fx] = brute_force(g, 0, 2);

function [x, fx] = gold_min(f, xl, xu, es, maxit)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001; end
    if nargin < 5 || isempty(maxit), maxit = 50; end
    phi = (1 + sqrt(5)) / 2;
    iter = 0;
    while (1)
        d = (phi - 1) * (xu - xl);
        x1 = xl + d;
        x2 = xu - d;
        if f(x1) < f(x2)
            xopt = x1;
            xl = x2;
        else
            xopt = x2;
            xu = x1;
        end
        iter = iter + 1;
        if xopt ~= 0, ea = (2 - phi) * abs((xu - xl) / xopt) * 100; end
        if ea <= es || iter >= maxit, break, end
    end
    x = xopt; fx = f(xopt);
end

function [x, fx] = brute_force(func, xl, xu, es)
    if nargin < 3, error('at least 3 input arguments required'), end
    if nargin < 4 || isempty(es), es = 0.0001; end

    x = xl;
    min_v = func(xl);
    for i = linspace(xl, xu, (xu - xl) / es)
        if func(i) < min_v
            x = i;
            min_v = func(i);
        end
    end
    fx = func(x);
end
