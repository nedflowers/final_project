# Oregon Cannabis and Hemp Market Trends

## Overview
For our final project we chose to study data for the cannabis industry in Oregon. We chose this new and emerging market because Hemp and Cannabis are being studied like never before, and because of its increased legality we now have access to cannabis data sets that didn't exist 10 years ago. With 18 states passing laws decriminalizing and allowing state-licensed sales of cannabis, it’s becoming less of a taboo, and making its way into mainstream. You can even find CBD infused products at gas stations, grocery stores, corner stores and even large nation-wide retailers, while THC-derived products remain hugely controlled.

Possibilities of ever emerging datasets and patterns inspired us to dig into this data. Believing and witnessing first-hand the benefits of hemp and cannabis at a medical level, and with full-support of adult-use legalization, we are setting out to answer a question. Can we use machine learning to predict future sales of cannabis in Oregon based on current data by county and product types over the six years cannabis has been legal in Oregon?

In order gain valuable information about the cannabis industry in Oregon, we needed access to data sets. The two main data sets we selected were CSVs about both cannabis sales in Oregon (by County, Product, and Month x 6yrs) from the Oregon Liquor and Cannabis Commission (OLCC), and a population data set with populations by county in Oregon from the most recent census data.

The data exploration phase seemed straight forward. One data set has sales information over time by product type and by county. The other data set has population information for each county in Oregon. We looked at each data set and performed some clean-up to drop redundant information. We joined data the sets using a LEFT join on the two data sets joining by County, favoring the Sales data over the Population.

Once we had the combined data sets in one data frame, we started the data analysis. The analysis consisted of taking all the data and condensing it down to only what we needed. We dropped columns that contained market share by county and other superfluous information. Because we were interested in predicting future sales based on previous sales by county and product type over time, we thought linear regression would be the best model for machine learning. We used the Sales column as the target and rest of the columns as the features. The features columns included: County, Product Type, Date, and County Population.

## Sources

- ### [Oregon Marijuana Market Data](https://www.oregon.gov/olcc/marijuana/Pages/Marijuana-Market-Data.aspx)

- ### [Portland State University - Census Data for Oregon](https://www.pdx.edu/population-research/census-data-oregon)

## Tools Used
<!-- ## Quick DBD
https://app.quickdatabasediagrams.com/#/
 -->
- ### [Tableau](https://public.tableau.com/app/profile/pau.rodriguez/viz/OregonCannabisandHempSales/CannabisSalesDashboard#1)

- ### Jupyter Notebook
	- Used for developing python code.

- ### PgAdmin4
	- A Database Studio that we used to connect to AWS and confirm proper table setup and develop SQL queries.

- ### AWS
	- A Cloud based service that we use to store our CSV files and Postgres Database.
<!-- 
https://s3.console.aws.amazon.com/s3/buckets/myosus32022buk?region=us-west-2 -->

![AWSview](/imgs/AWS-Bucket.png)

- #### [Source Sales Data](https://myosus32022buk.s3.amazonaws.com/County%20Product%20Trend_Full%20Data_data.csv)

- #### [Source Population Data](https://myosus32022buk.s3.amazonaws.com/census_estimates.csv)

### Google Colab
- A Convenient place to store and run Python/Jupyter Notebook Code
<!-- https://colab.research.google.com/drive/10GP8dXiVwqJu2Y1AZJfR4IOSOO9fgVPP   AWScsvToDBwSQLmerge.ipynb -->
<!-- https://colab.research.google.com/drive/1SoEdLRvutqdlRRBVBOYx1OXHd_psNM_j   AWSMachineLearningv2done.ipynb -->


## Database 
Postgres is a Relational Database we use to store our data in tables. Some data preprocessing occurs here, including [merging](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/cannadata.sql.txt) our two datasets into one.

![ShowingDatasourcesAndMerge](/imgs/DatasetSelectionMergePresentationHalfSize.png)

<!--  An early(but working) version of the SQL we use to do this is shown in this text file
(We have since moved the SQL code into SQL-Alchemy/Python file below) -->

<!-- View PostgreSQL[script](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/cannadata.sql.txt). -->

<!--https://github.com/nedflowers/final_project/tree/main/second_segment/DB -->

## Data Processing 
### Python and Spark and SQLAlchemy

We use Spark for importing the AWS-CSV to the Postgres DB,
and we use SQLAlchemy for working with the SQL Tables (through the use of conn.execute), specifically joining the two dataset on county,
and some data cleaning and trimming (The SQL codes are very similar if not identical to the SQL/text file above, and are shown in comments).
After the data preparations are complete what is available is a [dataset](https://github.com/nedflowers/final_project/blob/BE_final_project/forth_segment_final/AWScsvToDBwSQLmerge.ipynb) we can do ML on.

9,514 rows and 7 columns (This is the DatasetSelectionMergePresentationHalfSize.png image shown above)

<table>
	<tr><td>ID</td><td>int</td></tr>
	<tr><td>county</td><td>obj/text</td></tr>
	<tr><td>population</td><td>int</td></tr>
	<tr><td>salesmonth</td><td>float/int</td></tr>
	<tr><td>salesyear</td><td>float/int</td></tr>
	<tr><td>product</td><td>obj/text</td></tr>
	<tr><td>marketshare</td><td>float/int</td></tr>
	<tr><td>sales</td><td>float/int</td></tr>
</table>

## Model 
The model's analysis is broken down in this [ReadMe](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/MachineLearningModel.md).

First version of code - [Linear Regression](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/AWSMachineLearningv2done.ipynb).


## Presentation
Follow [this link](https://github.com/nedflowers/final_project/blob/main/second_segment/Slides/PREZ/Copy%20of%20CannaPres.pdf) to view our Google Slides presentation.

### Dashboard
Interact with the market data [here.](https://public.tableau.com/views/OregonCannabisandHempSales/CannabisSalesDashboard?:language=en-US&:display_count=n&:origin=viz_share_link)

![dash3.png](https://github.com/nedflowers/final_project/blob/main/imgs/dash3.png)


## Summary
Our results using Linear Regression render
<table>
	<tr><td>&nbsp;</td><td>Predicted</td><td>Observed</td><td>Residual</td><td>Abs. Error</td></tr>
	<tr><td>0</td><td>-1.035797e+05</td><td>849</td><td>-1.044287e+05</td><td>1.044287e+05</td></tr>
	<tr><td>1</td><td>-1.680917e+05</td><td>13012</td><td>-1.811037e+05</td><td>1.811037e+05</td></tr>
	<tr><td>2</td><td>4.534763e+05</td><td>10</td><td>4.534663e+05</td><td>4.534663e+05</td></tr>
	<tr><td>3</td><td>3.419492e+06</td><td>1818879</td><td>1.600613e+06</td><td>1.600613e+06</td></tr>
	<tr><td>4</td><td>7.504363e+05</td><td>68059</td><td>6.823773e+05</td><td>6.823773e+05</td></tr>
	<tr><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td></tr>
	<tr><td>7130</td><td>-3.575317e+05</td><td>7556</td><td>-3.650877e+05</td><td>3.650877e+05</td></tr>
	<tr><td>7131</td><td>-4.317717e+05</td><td>22591</td><td>-4.543627e+05</td><td>4.543627e+05</td></tr>
	<tr><td>7132</td><td>-1.624597e+05</td><td>43260</td><td>-2.057197e+05</td><td>2.057197e+05</td></tr>
	<tr><td>7133</td><td>1.125476e+06</td><td>679291</td><td>4.461853e+05</td><td>4.461853e+05</td></tr>
	<tr><td>7134</td><td>1.913956e+06</td><td>3190012</td><td>-1.276056e+06</td><td>1.276056e+06</td></tr>
</table>

These results seem to indicate our model is not working properly.

### [Random Forest Classifier](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/AWSMLv3RandomForestClassifier.ipynb)

## Summary
Our results using the Random Forest Classifier were much better than the Linear Regression
![ConfusionMatrix](https://github.com/nedflowers/final_project/blob/main/imgs/ConfusionMatrix.png)

As shown in the above image the Sales-Amount-Bins are predicted successfully (An Accuracy of 0.8528 is very good!)
A Note-worthy point for consideration; The Model could be used to predict future sales, but it would need Market-Share Data.
This could be provided by taking the mean market share per county per product and using that with the other features.



