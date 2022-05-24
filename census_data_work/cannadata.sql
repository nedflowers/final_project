--
--
--reworked our draft SQL to work with tables direct imported from CSV (in AWS File Bucket) to AWS Postgres 
-- this is now ported to AWScsvToDBthenML.ipynb
--

--The AWS table created from CVS are
--
-- 1 "County Product Trend_Full Data_data.csv"   ===>>>   public.canabisdatatest
-- 2 "census_estimates.csv"                      ===>>>   public.countypoptest

-- 1 public.canabisdatatest is projected into canabisdatatrimtest as a smaller table with fewer features
--    the date column is formated to be ready for encoding in python
CREATE TABLE canabisdatatrimtest AS
SELECT "County" AS county,
    date_part('month', TO_DATE("Month Year", 'mm/dd/yyyy')) AS salesmonth, 
	date_part('year', TO_DATE("Month Year", 'mm/dd/yyyy')) AS salesyear, 
	"Product Type" as product, 
	MAX("Market Share County") as marketshare, 
    SUM("Sales") AS sales
FROM public."canabisdatatest"
GROUP BY "County", "Month Name", "Month Year", "Product Type"
ORDER BY "County", "Month Name", "Month Year", "Product Type";


-- 2 public.countypoptest is altered to have fewer features
--    and renamed columns
ALTER TABLE public."countypoptest"
	DROP COLUMN _c5, 
	DROP COLUMN _c6, 
	DROP COLUMN _c7, 
	DROP COLUMN _c8, 
	DROP COLUMN _c9, 
	DROP COLUMN _c10, 
	DROP COLUMN _c11, 
	DROP COLUMN _c12, 
	DROP COLUMN _c13, 
	DROP COLUMN _c14,
	DROP COLUMN "Certified Population Estimate July 1, 2021", 
	DROP COLUMN "Population Change 2020-2021", 
	DROP COLUMN "Percent Change 2020-2021";

ALTER TABLE public."countypoptest"
	RENAME COLUMN _c0 to county;

ALTER TABLE public."countypoptest"
	RENAME COLUMN "Revised Population Estimate July 1, 2020" to population;

-- here we trim out the ','
UPDATE public."countypoptest"
SET population = replace(population, ',', '');

-- here we remove any spaces (two word counties are now one word, thats ok)
UPDATE public."countypoptest"
SET county = replace(county, ' ', '') ;

-- again, here we remove any spaces (two word counties are now one word, thats ok)
UPDATE canabisdatatrimtest
SET County = replace(county, ' ', '');



-- Take Table 1 and 2 project them through a left join(favoring Sales data table)
SELECT
	public.canabisdatatrimtest.county, 
	public.countypoptest.population, 
	public.canabisdatatrimtest.salesmonth, 
	public.canabisdatatrimtest.salesyear, 
	public.canabisdatatrimtest.product, 
	public.canabisdatatrimtest.marketshare, 
	public.canabisdatatrimtest.sales
INTO complete_county_datatest
FROM public.canabisdatatrimtest
	LEFT JOIN public.countypoptest
	ON lower(public.canabisdatatrimtest.county) = lower(public.countypoptest.county)
ORDER BY canabisdatatrimtest.county;

-- The finished product
SELECT county, population, salesmonth, salesyear, product, marketshare, sales
FROM public.complete_county_datatest;

--We can drop the tables created from the CSV(so they can be created again if re-run)
--    and the extra tables used for cleaning
DROP TABLE canabisdatatest;
DROP TABLE canabisdatatrimtest;
DROP TABLE countypoptest;
