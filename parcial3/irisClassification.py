import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score 
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#geting the samples
irisNames = ['sepalLen', 'sepalWidth', 'petalLen', 'petalWidth', 'species']
irisdf = pd.read_csv('iris.csv', names=irisNames)

x = irisdf.iloc[:,:4].values
y = irisdf['species'].values
X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.2)
X_train = X_train

sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

classifier = GaussianNB()
classifier.fit(X_train, y_train)

y_pred = classifier.predict(X_test) 
cm = confusion_matrix(y_test, y_pred)
print ("Accuracy : ", accuracy_score(y_test, y_pred))
print(cm)

df = pd.DataFrame({'Real Values':y_test, 'Predicted Values':y_pred})
print(df)

                        # Parameters Average			
# 	            Iris Setosa	    Iris Versicolor	    Iris Virginica
# Sepal Len 	    5.028	      6.071428571	       6.59166
# Sepal Width	    3.48	       2.764285	           2.946153
# Petal Len	        1.46	        4.342   	        5.661
# Petal Width	    0.248	      1.335714286	      2.030769



