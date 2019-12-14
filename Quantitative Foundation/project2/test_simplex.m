

alpha = 1;
yita = 2;
rho = 0.5;
sigma = 0.5;
delta = 1e-6;
n = 100;
X0 = (rand(n, n+1)*2-1)*1e-2;
[x] = run_simplex(@func1, X0, alpha, yita, rho, sigma, delta);