function model = UK12()
    x = [0.190032E-03
        383.458
        -27.020
        335.751
        69.4331
        168.521
        320.350
        179.933
        492.671
        112.198
        306.320
        217.343
        ];
    y=[-0.285946E-03
       -0.608756E-03
       -282.758
       -269.577
       -246.780
       31.4012
       -160.900
       -318.031
       -131.563
       -110.561
       -108.090
       -447.089
        ];
    n=numel(x);
    
    D=zeros(n,n);
    
    for i=1:n-1
        for j=i+1:n
            
            D(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
            
            D(j,i)=D(i,j);
            
        end
    end
    
    model.n=n;
    model.x=x;
    model.y=y;
    model.D=D;
end