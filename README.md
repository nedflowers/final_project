# Oregon Cannabis and Hemp Market Trends

## Overview
For our final project we chose to study data for the cannabis industry in Oregon. We chose this new and emerging market because Hemp and Cannabis are being studied like never before, and because of its increased legality we now have access to cannabis data sets that didn't exist 10 years ago. With 18 states passing laws decriminalizing and allowing state-licensed sales of cannabis, it’s becoming less of a taboo, and making its way into mainstream. You can even find CBD infused products at gas stations, grocery stores, corner stores and even large nation-wide retailers, while THC-derived products remain hugely controlled.

Possibilities of ever-emerging datatsets and patterns inspired us to dig into this data. Believing and witnessing first-hand the benefits of hemp and cannabis at a medical level, and with full-support of adult-use legalization, we are setting out to answer a question. Can we use machine learning to predict future sales of cannabis in Oregon based on current data by county and product types over the six years cannabis has been legal in Oregon?

In order gain valuable information about the cannabis industry in Oregon, we needed access to data sets. The two main data sets we selected were CSVs about both cannabis sales in Oregon by county and product type over the six years cannabis has been legal in Oregon from the Oregon Liquor and Cannabis Commission (OLCC), and a population data set with populations by county in Oregon from the most recent census data.

The data exploration phase seemed pretty straight forward. One data set has sales information over time by product type and by county. The other data set has population information for each county in Oregon. We looked at each data set and preformed some clean-up in order to drop redundant information. Next, we joined data sets using an inner join on the two data sets joining the counties.

Once we had the combined data sets in one data frame, we started the data analysis. The analysis consisted of taking all of the data and condensing it down to only what we needed. We dropped columns that contained market share by county and other superfluous information. Because we were interested in predicting future sales based on previous sales by county and product type over time, we thought linear regression would be the best model for machine learning. We used the sales column as the target and rest of the columns as the features. The features columns included: County, Product Type, Date, and County Population.
## Sources

### Oregon Marijuana Market Data
https://www.oregon.gov/olcc/marijuana/Pages/Marijuana-Market-Data.aspx

https://data.olcc.state.or.us/t/OLCCPublic/views/MarketDataTableau/MainScreen

### Portland State University - Census Data for Oregon

https://www.pdx.edu/population-research/census-data-oregon


## Tools 

### Quick DBD
https://app.quickdatabasediagrams.com/#/

### Tableau
https://www.tableau.com/

### Jupyter Notebook

### PgAdmin4

### AWS

### Google Colab

### Google Slides

#### Presentation
https://github.com/nedflowers/final_project/blob/main/second_segment/Slides/PREZ/Copy%20of%20CannaPres.pdf

#### Dashboard Storyboarding
https://github.com/nedflowers/final_project/blob/main/second_segment/Slides/DASH/DashStory.pdf

### Git

### Database 
https://github.com/nedflowers/final_project/tree/main/second_segment/DB

### Model 

https://github.com/nedflowers/final_project/blob/main/first_segment/ML_Mockup.ipynb

## Summary
