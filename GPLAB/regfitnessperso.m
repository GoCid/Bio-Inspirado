function ind=regfitnessperso(ind,params,data,~,~)

X=data.example;
outstr=ind.str;
for i=params.numvars:-1:1
    %outstr=strrep(outstr,strcat('X',num2str(i)),strcat('X(:,',num2str(i),')'));
    outstr=strrep(outstr,['X',sprintf('%d',i)],['X(:,',sprintf('%d',i),')']);
end

try
    res=eval(outstr);
catch
    % because of the "nesting 32" error of matlab
    res=str2num(evaluate_tree(ind.tree,X));
end

%perso
positivo=0;
negativo=0;
falsopos=0;
falsoneg=0;
%res=resultado numerico del arbol
%reglas de interferencia
for i= 1:length(res)
     %Bien y Bien
     if data.result(i)==1 && res(i)>=0 
        positivo=positivo+1;
     end 
     %Mal y mal
     if data.result(i)==0 && res(i) >= 0 
        falsoneg=falsoneg+1;
     end
     %Bien y Mal
     if data.result(i)==1 && res(i)<0 
        falsopos=falsopos+1;
     end
     %Mal y Bien
     if data.result(i)==0 && res(i)<0 
        negativo=negativo+1;
     end
end

%Max{ F = numero de clasificaciones correctas / numero total de datos}
%Capacidad predictiva
if positivo ==0 && falsopos==0
  pa = 0;
else 
  pa= positivo/(positivo+falsopos);
end 
%s sensibilidad de la regla
if positivo==0 && falsoneg==0
    s=0;
else
    s= positivo/(positivo+falsoneg);
end
%Max { F = p1 PA + p2 CP + p3 S }
%buscamos que se acerque mas a 0
sumdif=1-((0.5*pa)+(0.5*s));
%Max {F = #Correctos – n * #Incorrectos}
%sumdif=(positivo+negativo)-10*(falsoneg+falsopos);
ind.result=res;

fprintf('Correctos: %d ',positivo);
fprintf(' Incorrectos: %d ', negativo);
fprintf(' Falsos: Positivos %d  Negativos %d\n', falsopos,falsoneg);
%fprintf('%d y %d', pa,s);

%perso

% raw fitness:
ind.fitness=sumdif; %lower fitness means better individual
% now limit fitness precision, to eliminate rounding error problem:
ind.fitness=fixdec(ind.fitness,params.precision);

