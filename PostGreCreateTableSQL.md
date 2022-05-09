SQL create statement to create a database table in POSTGRE
```SQL
CREATE TABLE IF NOT EXISTS public."CanabisData"
(
    "ProductType" character varying COLLATE pg_catalog."default",
    "Month" integer,
    "Year" integer,
    "Sales" numeric,
    "CustomerType" character varying COLLATE pg_catalog."default",
    "Population" numeric,
    "County" character varying COLLATE pg_catalog."default"
)
```
#END SQL statement
