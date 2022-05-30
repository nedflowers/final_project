# Oregon Cannabis and Hemp Market Trends

## Overview
For our final project we chose to study data for the cannabis industry in Oregon. We chose this new and emerging market because Hemp and Cannabis are being studied like never before, and because of its increased legality we now have access to cannabis data sets that didn't exist 10 years ago. With 18 states passing laws decriminalizing and allowing state-licensed sales of cannabis, it’s becoming less of a taboo, and making its way into mainstream. You can even find CBD infused products at gas stations, grocery stores, corner stores and even large nation-wide retailers, while THC-derived products remain hugely controlled.

Possibilities of ever-emerging datatsets and patterns inspired us to dig into this data. Believing and witnessing first-hand the benefits of hemp and cannabis at a medical level, and with full-support of adult-use legalization, we are setting out to answer a question. Can we use machine learning to predict future sales of cannabis in Oregon based on current data by county and product types over the six years cannabis has been legal in Oregon?

In order gain valuable information about the cannabis industry in Oregon, we needed access to data sets. The two main data sets we selected were CSVs about both cannabis sales in Oregon(by County, Product, and Month x 6yrs) from the Oregon Liquor and Cannabis Commission (OLCC), and a population data set with populations by county in Oregon from the most recent census data.

The data exploration phase seemed pretty straight forward. One data set has sales information over time by product type and by county. The other data set has population information for each county in Oregon. We looked at each data set and performed some clean-up in order to drop redundant information. We joined data the sets using a LEFT join on the two data sets joining by County, favoring the Sales data over the Population.

Once we had the combined data sets in one data frame, we started the data analysis. The analysis consisted of taking all of the data and condensing it down to only what we needed. We dropped columns that contained market share by county and other superfluous information. Because we were interested in predicting future sales based on previous sales by county and product type over time, we thought linear regression would be the best model for machine learning. We used the Sales column as the target and rest of the columns as the features. The features columns included: County, Product Type, Date, and County Population.
## Sources

### Oregon Marijuana Market Data
 https://www.oregon.gov/olcc/marijuana/Pages/Marijuana-Market-Data.aspx

### Portland State University - Census Data for Oregon

https://www.pdx.edu/population-research/census-data-oregon

# Tools

<!-- ## Quick DBD
https://app.quickdatabasediagrams.com/#/
 -->
## Tableau
https://www.tableau.com/

## Jupyter Notebook
Used for developing python code.

## PgAdmin4
A Database Studio that we used to connect to AWS and confirm proper table setup, and develop SQL queries.

## AWS
A Cloud based service that we use to store our CSV files and Postgres Database.
<!-- 
https://s3.console.aws.amazon.com/s3/buckets/myosus32022buk?region=us-west-2 -->

![AWSview](/imgs/AWS-Bucket.png)

https://myosus32022buk.s3.amazonaws.com/County%20Product%20Trend_Full%20Data_data.csv  : Sales Data

https://myosus32022buk.s3.amazonaws.com/census_estimates.csv  : Population Data


## Google Colab
A Convienent place to store and run Python/Jupyter Notebook Code
<!-- https://colab.research.google.com/drive/10GP8dXiVwqJu2Y1AZJfR4IOSOO9fgVPP   AWScsvToDBwSQLmerge.ipynb -->
<!-- https://colab.research.google.com/drive/1SoEdLRvutqdlRRBVBOYx1OXHd_psNM_j   AWSMachineLearningv2done.ipynb -->

## Google Slides
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

## Presentation
https://github.com/nedflowers/final_project/blob/main/second_segment/Slides/PREZ/Copy%20of%20CannaPres.pdf

## Dashboard Storyboarding
https://github.com/nedflowers/final_project/blob/main/second_segment/Slides/DASH/DashStory.pdf


## Database 
Postgres is a Relational Database we use to store our data in tables. Some data preprocessing occurs here, including merging our two datasets into one
![ShowingDatasourcesAndMerge](/imgs/DatasetSelectionMergePresentationHalfSize.png)

An early(but working) version of the SQL we use to do this is shown in this text file

(We have since moved the SQL code into SQL-Alcehmy/Python file below)

[cannadata.sql.txt](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/cannadata.sql.txt)

<!-- https://github.com/nedflowers/final_project/tree/main/second_segment/DB -->

## Data Processing 
### Python and Spark and SQLAlchemy
https://github.com/nedflowers/final_project/blob/BE_final_project/forth_segment_final/AWScsvToDBwSQLmerge.ipynb

We use Spark for importing the AWS-CSV to the Postgres DB,
and we use SQLAlchemy for working with the SQL Tables(through the use of conn.execute), specifically joining the two dataset on county,
and some data cleaning and trimming(The SQL codes are very similar if not identical to the SQL/text file above, and are shown in comments).
After the data preparations are complete what is available is a dataset we can do ML on.

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
This is complex enough it is broken down in a linked ReadMe

[MachineLearningModel.md](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/MachineLearningModel.md)

Here is the code
Linear Regression(Old Version)
[AWSMachineLearningv2done.ipynb](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/AWSMachineLearningv2done.ipynb)

The Linear Regression results are not very usefull. After conuslting with Niño Yosinao, and Shan Jiang, we were made aware that using a Bin for the Sales amount, and using a Random Forest Classifier should be a better Model to get better accuracy scores. Using a Random Forest Classifier would also allow us to create a confusion matrix, right now I dont believe the Linear Regression results would facilitate creating one.

Random Forest Classifier
[AWSMLv3RandomForestClassifier.ipynb](https://github.com/nedflowers/final_project/blob/main/forth_segment_final/AWSMLv3RandomForestClassifier.ipynb)

## Summary
Our results using the Random Forest Classifier were much better than the Linear Regression
![ConfusionMatrix](https://github.com/nedflowers/final_project/blob/main/imgs/ConfusionMatrix.png)

As Shown the Bins are largly predicted succefully.
A Note-worthy point for consideration; The Model could be used to predict future sales, but it would need Market-Share Data, this could be provided by taking the mean market share per county per product, and using that with the other features.


