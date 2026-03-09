Hurricane Intensity vs Economic Damage (SQL Analysis)
Project Overview
This project analyzes the relationship between hurricane intensity and economic damage using historical hurricane data and economic impact data.
Using SQL, I combined two datasets:
HURDAT2 Atlantic Hurricane Dataset – storm track and intensity data from NOAA
Major Hurricane Economic Damage Dataset – CPI-adjusted economic losses from major U.S. hurricanes
The goal of the project was to explore questions such as:
Do stronger hurricanes cause more economic damage?
Which hurricanes have been the most destructive since 1980?
How does maximum wind speed relate to economic loss?
This project focuses on data cleaning, transformation, and joins across messy real-world datasets, which is a common challenge in real-world analytics.

Datasets
1. HURDAT2 Hurricane Dataset
Source: NOAA
Contains historical Atlantic hurricane data including:
Storm name
Year
Wind speed measurements
Storm track observations
The raw dataset contains multiple rows per storm (every 6 hours), so storms were aggregated to one row per storm using maximum recorded wind speed.

2. Hurricane Economic Damage Dataset
Contains the CPI-adjusted cost of major hurricanes in millions of dollars.
Fields include:
Storm name
Beginning date
Total CPI-adjusted economic damage
Storm names required significant normalization before joining due to formatting differences such as:
HURRICANE KATRINA (AUGUST 2005)
vs
KATRINA

Data Cleaning & Transformation
Key preprocessing steps included:
Converting storm track data into one row per storm
Extracting year values from date fields
Normalizing storm names by:
Removing "HURRICANE " prefixes
Removing text after parentheses
Converting names to uppercase
Trimming whitespace
These transformations allowed the datasets to be joined reliably.



Final Dataset
The final dataset contains:
year
storm_name
max_wind
cost_millions
This enables direct comparison between hurricane intensity and economic impact.

Example SQL Techniques Used
Aggregations (MAX, GROUP BY)
Data cleaning with REPLACE, SUBSTR, TRIM
Date extraction
Complex JOIN conditions
Creation of intermediate analysis tables

Key Analysis Questions
Which hurricanes have caused the most economic damage?
The most economically damaging hurricanes in the dataset include storms such as Katrina (2005), Harvey (2017), Maria (2017), and Sandy (2012). These events caused tens to hundreds of billions of dollars in damage after adjusting for inflation. Many of the most damaging storms occurred in the 21st century, reflecting increased coastal development and exposure to hurricane risk.

Is there a relationship between maximum wind speed and economic damage?
Analysis of the dataset suggests that hurricane wind speed has a general influence on economic damage, but the relationship is not perfectly linear. Some high-intensity storms produce very large financial losses, but several weaker storms also generated extremely high economic damage. For example, storms with wind speeds around 115 mph and 150 mph produced average damages exceeding $100 billion, while some stronger storms produced far less damage. This indicates that factors beyond storm intensity—such as landfall location, population density, infrastructure exposure, and storm surge—play major roles in determining economic impact.

Are stronger hurricanes consistently more costly?
Analysis shows that stronger hurricanes generally cause higher economic damage, but the relationship is not perfectly consistent. Category 3 and Category 4 storms produced the highest average damage in the dataset, while Category 5 storms did not have the highest average due to a very small sample size. Additionally, total economic losses depend on factors beyond wind speed, including population density, infrastructure, storm surge, and landfall location. This suggests that hurricane intensity is an important driver of damage but not the only determinant.
How does hurricane damage vary over time?
Economic damage from hurricanes has increased significantly over time. The analysis shows a clear upward trend in both total damage and average damage per storm from the 1980s through the 2010s. Average losses rose from approximately $6 billion per storm in the 1980s to nearly $50 billion per storm in the 2010s. Interestingly, the 2010s experienced fewer storms than the 2000s but still produced greater total damage, suggesting that individual storms are becoming more economically destructive. This trend is likely influenced by multiple factors including increased coastal development, higher property values, inflation, and potentially stronger or wetter storms.






Why This Project
Climate and extreme weather events have always interested me, and this project allowed me to combine that curiosity with data analysis.
Working with hurricane datasets introduced real-world data challenges such as inconsistent naming conventions and messy date formats, which required careful preprocessing before meaningful analysis could be performed.

Tools Used
SQL (SQLite)
DataGrip
GitHub

Future Improvements
Potential extensions for this project include:
Visualizing hurricane damage trends
Performing correlation analysis between wind speed and damage
Incorporating additional storm characteristics such as pressure or landfall location
Expanding the dataset to include all hurricanes rather than only the most damaging events

Personal Reflection
This project was particularly enjoyable to work on because it combines natural systems, historical data, and economic impact analysis. It reinforced how messy real-world datasets can be and how much of data analysis involves cleaning and structuring data before analysis can begin.
