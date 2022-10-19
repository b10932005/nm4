f = @(x) 2 .* x + 3 ./ x;
a = 0.1;
b = 0.5;
c = 5;

iter = 10;
for k = 1:iter
    alpha = (f(b) - f(a)) / (b - a);
    beta = (f(c) - f(a) - alpha * (c - a)) / ((c - a) * (c - b));
    x = (a + b) / 2 - alpha / (2 * beta);
    a = b;
    b = c;
    c = x;
    fprintf("%e\t%e\n", c, f(c))
end
