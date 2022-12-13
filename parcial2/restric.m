function [r1,r2,r3, r4, r5] = restric(pop)
    P=6000;
    L = 14;

    r1 = pop(1)-pop(4);

    t1 = 1/sqrt(2*pop(1)*pop(2));
    R= sqrt(power(pop(2),2)+ power((pop(1)+pop(3)),2));
    t2 = ((L+pop(2)/2)*R)/ (sqrt(2)*pop(1)*pop(3)*(pop(2)^2/3+(pop(1)+pop(3))^2));
    t= P * sqrt(power(t1,2)+power(t2,2)+((2*t1*t2*pop(2))/R));
    r2 = t-13600;

    r3 = (P*6*L)/(pop(4)*pop(3)^2);

    r4 = -(64746.022*(1 - 0.028236*pop(3))*pop(3)*pop(4)^3)+6000;

    r5 = -0.25+(2.1952/(power(pop(3),3)*pop(4)));
end