
f = @(x)(2*x+3/x);
fd = @(x)(2-3/x^2);
fdd = @(x)(6/x^3);

x = fminbnd(f, 0, 10)
f(x)
