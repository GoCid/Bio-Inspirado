import numpy as np 
from geneticalgorithm2 import geneticalgorithm2 as ga 
from OptimizationTestFunctions import Rastrigin

dim = 2*1

f =  Rastrigin(dim)

xmin, xmax, ymin, ymax = -3,3,-3,3
        
varbound = np.array([[xmin, xmax], [ymin, ymax]]*1)


model = ga(function=f,
               dimension = dim,
               variable_type='real',
               variable_boundaries=varbound,
               algorithm_parameters = {
                       'max_num_iteration': 500,
                       'population_size': 60,
                       'mutation_probability': 0.1,
                       'elit_ratio': 0.01,
                       'crossover_probability': 0.5,
                       'parents_portion': 0.3,
                       'crossover_type':'segment',
                       'mutation_type': 'uniform_by_center',
                       'selection_type': 'tournament',
                       'max_iteration_without_improv':100
                       }
               )

model.run()