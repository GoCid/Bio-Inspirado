function [v,b]=mainiris

fprintf('virginica');
p=resetparams;

p=setoperators(p,'crossover',2,2,'mutation',1,1);
p.operatorprobstype='variable';
p.minprob=0;
%functions, no log10 pq el resultado se vuelve muy inexacto
p.addfunctions={p, 'mydivide', 2, 'mysqrt','mylog2',1};
p.calcfitness='regfitnessperso';
%modif
p.datafilex='versicolorXtrain.txt';
p.datafiley='versicolorYtrain.txt';

p.usetestdata=1;
p.testdatafilex='versicolorXprueba.txt';
p.testdatafiley='versicolorYprueba.txt';
%modif
p.calcdiversity={'uniquegen'};
p.calccomplexity=1;
p.graphics={'plotfitness'};
p.depthnodes='2';

[v,b]=gplab(25,50,p);

drawtree(b.tree);
