function scores = vigas(pop)
    scores=1.10471*pop(1)^2*pop(2) + 0.04811*pop(3)*pop(4)*(14+pop(2));
end