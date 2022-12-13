lb = [0.125,0.1,0.1,0.125];
ub = [5,10,10,5];
%options = optimoptions('ga','PlotFcn','gaplotbestf');
%options.SelectionFcn = @selectiontournament;
[x,res]=ga(@vigas,4,[],[],[],[],lb,ub,@restric);
