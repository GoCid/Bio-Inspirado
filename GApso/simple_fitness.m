rng default;

%fun = log(@rastriginsfcn);
%fun = @rosenbrock;

nvar = 10;

options = optimoptions('ga','PlotFcn','gaplotbestf');
options.SelectionFcn = @selectiontournament;
options.PopulationSize =50;

lb= [-3,-3];
ub= [3,3];

[x,fval] = ga(rastriginsfcn,nvar,[],[],[],[],lb,ub,[],options);
disp(x);
disp(fval);