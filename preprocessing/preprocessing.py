from typing import Any, Union
import string
import pandas as pd
from sklearn.model_selection import train_test_split
import csv
from pandas import DataFrame, Series
from pandas.core.generic import NDFrame

df = pd.read_csv('F:/ADD/data/rawdata/labeled_data.csv')
df: Union[Union[Series, None, NDFrame, DataFrame], Any] = df[["id", "class", "tweet"]]
df["tweet"] = df["tweet"].str.replace('[^\w\s]', '')
df["tweet"] = df["tweet"].str.replace('RT', '')
df["tweet"] = df["tweet"].str.replace('_', '')
df["tweet"] = df["tweet"].str.replace('[1,2,3,4,5,6,7,8,9,0]', '')
df["tweet"] = df["tweet"].str.replace('\n', '')
df["tweet"].str.replace('[{}]'.format(string.punctuation), '')
df.to_csv("F:/ADD/data/main/preprocess.csv")

# %% Divide Testing and Training
main_data = pd.read_csv("F:/ADD/data/main/preprocess.csv")
data = main_data.drop(['Unnamed: 0', 'id'], axis=1)

X = data.iloc[:, 0:2]
Y = data.iloc[:, 1].values

X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2, random_state=2)
X_train = X_train.to_csv(r'F:/ADD/data/main/train.csv')
X_test = X_test.to_csv(r'F:/ADD/data/main/test.csv')

# %% Saving Train and Test data in different text files
with open("F:/ADD/data/main/train.csv", "r") as f:
    reader = csv.reader(f)
    rownumber = 1
    for row in reader:
        g = open("F:/ADD/data/train/train" + str(rownumber) + ".txt", "w")
        g.write(str(row[1]) + '\t' + (str(row[2])) + '\t' + (str(row[2])))
        rownumber = rownumber + 1
        g.close()

with open("F:/ADD/data/main/test.csv", "r") as f:
    reader = csv.reader(f)
    rownumber = 1
    for row in reader:
        g = open("F:/ADD/data/test/test" + str(rownumber) + ".txt", "w")
        g.write(str(row[2]))
        rownumber = rownumber + 1
        g.close()
