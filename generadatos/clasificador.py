########## LIBRERÍAS A UTILIZAR ##########

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
########## APLICACIÓN DE ALGORITMOS DE MACHINE LEARNING ##########

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier

#Importamos el dataset para iniciar el análisis
iris = pd.read_csv("Iris.csv")


#Eliminamos la primera columna ID
iris = iris.drop('Id',axis=1)

#Análizamos los datos que tenemos disponibles

print('Distribución de las especies de Iris:')
print(iris.groupby('Species').size())

#Grafico Sepal - Longitud vs Ancho
fig = iris[iris.Species == 'Iris-setosa'].plot(kind='scatter',
          x='SepalLengthCm', y='SepalWidthCm', color='blue', label='Setosa')
iris[iris.Species == 'Iris-versicolor'].plot(kind='scatter',
    x='SepalLengthCm', y='SepalWidthCm', color='green', label='Versicolor', ax=fig)
iris[iris.Species == 'Iris-virginica'].plot(kind='scatter',
    x='SepalLengthCm', y='SepalWidthCm', color='red', label='Virginica', ax=fig)

fig.set_xlabel('Sépalo - Longitud')
fig.set_ylabel('Sépalo - Ancho')
fig.set_title('Sépalo - Longitud vs Ancho')

#Grafico Pétalo - Longitud vs Ancho
fig = iris[iris.Species == 'Iris-setosa'].plot(kind='scatter',
          x='PetalLengthCm', y='PetalWidthCm', color='blue', label='Setosa')
iris[iris.Species == 'Iris-versicolor'].plot(kind='scatter',
    x='PetalLengthCm', y='PetalWidthCm', color='green',
    label='Versicolor', ax=fig)
iris[iris.Species == 'Iris-virginica'].plot(kind='scatter',
    x='PetalLengthCm', y='PetalWidthCm', color='red', label='Virginica', ax=fig)

fig.set_xlabel('Pétalo - Longitud')
fig.set_ylabel('Pétalo - Ancho')
fig.set_title('Pétalo Longitud vs Ancho')
plt.show()
