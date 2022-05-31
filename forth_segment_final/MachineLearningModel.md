Our jupyter notebook starts our Machine Learning Model by importing the dataset that was resides and was cleaned in AWS.
![rawdatasetforML](https://github.com/nedflowers/final_project/blob/main/imgs/rawdatasetforML.png)
We convert our columns to the datatypes we want, int are better than floats for many of our columns.

We remove the product type 'Industrial Hemp' and any rows with sales data having a market share of 0.00%.
There is not enough data for this product type.
```
cannabis_df = cannabis_df[cannabis_df["product"]!='Industrial Hemp']
cannabis_df = cannabis_df[cannabis_df["marketshare"]!=0.00]
```

In order to create bins for our sales data, we need to see information about that column.
Using describe allows us to see the Min, Max, and Standard Deviation.
Our data has a mean of 497,947, with a std of 1,327,071.
Showing a histogram of the sales-data shows the data is very skewd to the low end of the range(lots of small sales data, and a few HUGE numbers)

Through trial and error, a intuitive set of bins is arrived at (choosing bin-size-number can be very subjective)
```
bins = [-np.inf,10000,50000,100000,500000,1000000,np.inf]
```
```
100kto500k    2785
10kto50k      1963
50kto100k     1385
10ksmaller    1097
1mgreater     1058
500kto1m       987
Name: bins, dtype: int64
```

We use OneHotEncoder to encode County into 31 feature columns, and Product into 6 feature columns
SalesMonth, SalesYear, and population are left as numeric.
Population is manually scaled by dividing by 1,000, giving a range of 7(k) to 816(k).
We could play with this and put population into bins and see the effect on our results, but time doesn't allow for that adventure.

We end up with a dataset with 41 Features and 1 Result column.(9,050 rows)

<table>
  <tr><td>ProductType:</td><td>6 Unique Values</td></tr>
  <tr><td>County:</td><td>31 Unique Values</td></tr>
  <tr><td>SalesMonth:</td><td>12 Unique Values</td></tr>
  <tr><td>SalesYear:</td><td>7 Unique Values</td></tr>
</table>

We set the "Sales" column into Y
And we set the X to everything but the "Sales"

Are X_train, X_test, y_train, y_test variables 
are set with 
```
train_test_split(X, y, random_state=78)
```

We get 
<table>
  <tr><td>X_train: </td><td>6787</td></tr>
  <tr><td>X_test</td><td>2263</td></tr>
  <tr><td>y_train</td><td>6787</td></tr>
  <tr><td>y_test</td><td>2263</td></tr>
</table>

A ML Model is created with:
```
# Creating the RandomForestClassifier instance.
model = RandomForestClassifier(n_estimators=100)
# Fitting the model.
#model = model.fit(X_train_scaled, y_train)
model = model.fit(X_train, y_train)
```

We arrive at:

Accuracy: 0.8444542642509942

![MLreadmeConfusionMatrix](https://github.com/nedflowers/final_project/blob/main/imgs/MLreadmeConfusionMatrix.png)




