clc

NG = 4;
myfunc = @(x)(x^3-14*x^2+35*x+10*NG)

xl = -1.;
xu = 0.4;
es = 0.1;
imax = 15;

n_iter = 0;
xr = 0;

fl = myfunc(xl);

t0 = tic;

while(1)
  xl
  xu
  xr_ant = xr
  xr = (xl+xu)/2

  fr = myfunc(xr)

  n_iter = n_iter+1
  if xr ~= 0
    ea = abs((xr-xr_ant)/xr)*100
  endif
  test = fl*fr
  if test < 0
    xu = xr;
  elseif test > 0
    xl = xr;
    fl = fr;
  else
    ea = 0;
  endif
  disp('')

  if abs(myfunc(xr)) < 0.1 || n_iter >= imax
    fx = myfunc(xr);
    raiz = xr;
    iter = n_iter;
    toc(t0);
    break;
  endif

endwhile

printf("xr = %f\n", raiz)
printf("f(xr) = %f\n", myfunc(raiz))
