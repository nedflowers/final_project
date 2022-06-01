Our python jupyter notebook starts our Machine Learning Model by importing the CSV that contains our dataset; for now its County Product Trend_Full Data_data.csv

We convert the "Month Year" column to a datetime, so it can be split into dateparts later, and eventually encoded.
Dropping columns "Month Name", "Month Year", "Tooltip Date", "Date", "Sales Detail" because they are not needed, and keeping them may confuse the Regression Model.
Next we have an odd ocuurance of two rows for every Date/Type/County, some even have six occurances.  Due diligence is perform with calculations to make sure aggregating these values does not make our data invalid.(We total a individual County/Date/Type and divide that by a total for County/Date)
<Img1>
<Img2>
We drop the "Market Share County" coulmn now that its not needed.
Since we want to encode our date data, we split the Month and Year into separate columns.

A quick scan of each columns unique values, shows we have a feature set as follows

ProductType: 7 Unique Values
County: 31 Unique Values
SalesMonth: 12 Unique Values
SalesYear: 7 Unique Values

Our feature selection/engineering is relativly simple, from the CSV we have:
Date         :we dont need more than one date data, duplicate, we drop this
Product Type :KEEP-this the the product type
County       :KEEP-this is the county name
Month Name   :we dont need more than one date data, duplicate, we drop this
Month Year   :KEEP-has the time data we need, month and year
Tooltip Date :we dont need more than one date data, duplicate, we drop this
Market Share County :
Sales        :KEEP-this is our sales data
Sales Detail :This is a duplicate of Sales, we drop this


In order to do our train-test-split we first use OneHotEncoder on our dataset
This converts our Features into numeric data for the ML model to learn from.
We split out the "Sales" column into the Y
And we set the X to everything but the "Sales"

Are X_train, X_test, y_train, y_test variables 
are set with train_test_split(X, y, random_state=78)

we get 
rows: 7135 X_train
rows: 2379 X_test
rows: 7135 y_train
rows: 2379 y_test

we run a scaler on the X_train and X_test

A ML Model is created with:
# Creating the Linear Regression instance.
model = LinearRegression()
# Fitting the model.
model = model.fit(X_train_scaled, y_train)

We chose Linear Regression for our model because we have sales data that is increasing over time, so of our available choices, it seems to be the one that will fit our data.
One downside is it may be very simple.




