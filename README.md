# 🌪 Hurricane Intensity vs Economic Damage (SQL Analysis)

## Project Overview

This project analyzes the relationship between **hurricane intensity and economic damage** using historical Atlantic hurricane data and economic impact records.

Using SQL, two datasets were combined:

- **HURDAT2 Atlantic Hurricane Dataset** – storm track and intensity data from NOAA  
- **Major Hurricane Economic Damage Dataset** – CPI-adjusted economic losses from major U.S. hurricanes  

The goal of the project was to explore questions such as:

- Do stronger hurricanes cause more economic damage?
- Which hurricanes have been the most destructive since 1980?
- How does maximum wind speed relate to economic loss?

The project focuses on **data cleaning, transformation, and joins across messy real-world datasets**, which is a common challenge in practical data analysis.

---

# 📊 Datasets

## 1. HURDAT2 Hurricane Dataset

**Source:** NOAA

Contains historical Atlantic hurricane data including:

- Storm name  
- Year  
- Wind speed measurements  
- Storm track observations  

The raw dataset contains **multiple rows per storm (every 6 hours)**.

To simplify analysis, storms were aggregated to **one row per storm** using the **maximum recorded wind speed**.

---

## 2. Hurricane Economic Damage Dataset

Contains **CPI-adjusted economic damage estimates** for major U.S. hurricanes.

Fields include:

- Storm name  
- Beginning date  
- Total CPI-adjusted economic damage  

Storm names required significant normalization before joining due to formatting differences.

---

# 🧹 Data Cleaning & Transformation

Key preprocessing steps included:

- Converting storm track data into **one row per storm**
- Extracting **year values from date fields**
- Normalizing storm names by:
  - Removing `"HURRICANE "` prefixes
  - Removing text inside parentheses
  - Converting names to **uppercase**
  - Trimming whitespace

These transformations allowed the datasets to be **joined reliably**.

---

# 📈 Final Dataset

The final dataset contains the following fields:

- `year`
- `storm_name`
- `max_wind`
- `cost_millions`

This structure enables direct comparison between **hurricane intensity and economic impact**.

---

# 🧠 SQL Techniques Used

This project demonstrates several core SQL skills:

- Aggregations (`MAX`, `GROUP BY`)
- Data cleaning (`REPLACE`, `SUBSTR`, `TRIM`)
- Date extraction
- Complex `JOIN` conditions
- Creation of intermediate analysis tables

---

# 🔎 Key Analysis Questions

## Which hurricanes have caused the most economic damage?

The most economically damaging hurricanes in the dataset include storms such as **Katrina (2005), Harvey (2017), Maria (2017), and Sandy (2012)**.

These storms caused **tens to hundreds of billions of dollars in damage after adjusting for inflation**. Many of the most damaging events occurred in the **21st century**, reflecting increased coastal development and exposure to hurricane risk.

---

## Is there a relationship between maximum wind speed and economic damage?

The analysis suggests that **wind speed influences economic damage**, but the relationship is **not perfectly linear**.

Some extremely powerful storms produced large financial losses, while several **lower-intensity storms also generated very high damage**.

This indicates that factors beyond storm intensity—such as:

- landfall location
- population density
- infrastructure exposure
- storm surge

play major roles in determining economic impact.

---

## Are stronger hurricanes consistently more costly?

Stronger hurricanes **tend to produce higher average damage**, but the relationship is not perfectly consistent.

Category 3 and Category 4 storms produced the **highest average damage in the dataset**, while Category 5 storms did not have the highest average due to a **small sample size**.

Economic losses depend heavily on **where storms strike and the level of infrastructure exposure**.

---

## How does hurricane damage vary over time?

Economic damage from hurricanes has **increased significantly over time**.

Average losses rose from approximately:

- **$6 billion per storm in the 1980s**
- **Nearly $50 billion per storm in the 2010s**

Interestingly, the **2010s experienced fewer storms than the 2000s but still produced greater total damage**, suggesting that individual storms are becoming **more economically destructive**.

This trend is likely influenced by:

- increased coastal development
- rising property values
- inflation
- potentially stronger or wetter storms

---

# 🧰 Tools Used

- **SQL (SQLite)**
- **DataGrip**
- **GitHub**

---

# 🚀 Future Improvements

Potential extensions for this project include:

- Visualizing hurricane damage trends
- Performing correlation analysis between **wind speed and economic damage**
- Incorporating additional storm characteristics such as **pressure or landfall location**
- Expanding the dataset to include **all hurricanes rather than only major damaging events**

---

# 🌎 Why This Project

Climate and extreme weather events have always interested me, and this project allowed me to combine that curiosity with **data analysis**.

Working with hurricane datasets introduced real-world data challenges such as **inconsistent naming conventions and messy date formats**, reinforcing how much of data analysis involves **cleaning and structuring data before meaningful analysis can begin**.

---

# Personal Reflection

This project highlights how **real-world datasets rarely arrive in a clean, analysis-ready format**. A significant portion of the work involved transforming and standardizing the data before meaningful analysis could occur.

Projects like this reinforce the importance of **data preparation, reproducible workflows, and clear documentation** when working with real-world data.
