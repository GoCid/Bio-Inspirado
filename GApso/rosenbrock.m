function scores = rosenbrock(pop)

scores = 100 * (pop(1)^2-pop(2))^2+(1 - pop(1))^2;
end