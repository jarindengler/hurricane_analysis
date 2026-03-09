-- =====================================================
-- 1. Build storm-level hurricane table from HURDAT
-- =====================================================

DROP TABLE IF EXISTS hurdat_storms;

CREATE TABLE hurdat_storms AS
SELECT
    storm_id,
    date,
    UPPER(TRIM(storm_name)) AS storm_name,
    MAX(maximum_sustained_wind_knots) AS max_wind
FROM hurdat
WHERE date >= 1980
GROUP BY storm_id, date, UPPER(TRIM(storm_name));


-- =====================================================
-- 2. Build hurricane damage table
-- =====================================================

DROP TABLE IF EXISTS damage_hurricanes;

CREATE TABLE damage_hurricanes AS
SELECT
    "Beginning Date",
    "Disaster Type",
    "Total CPI-Adjusted Cost (Millions of Dollars)" AS cost_millions
FROM hurricane_impact
WHERE UPPER("Disaster Type") LIKE 'HURRICANE%';


-- =====================================================
-- 3. Build final joined analysis table
-- =====================================================

DROP TABLE IF EXISTS hurricane_damage_analysis;

CREATE TABLE hurricane_damage_analysis AS
SELECT
    h.year,
    h.storm_name,
    h.max_wind,
    d.cost_millions
FROM hurdat_storms h
JOIN damage_hurricanes d
    ON h.year = CAST(substr(d."Beginning Date", -4) AS INTEGER)
   AND UPPER(TRIM(h.storm_name)) =
       TRIM(
           substr(
               REPLACE(UPPER(d.storm_name), 'HURRICANE ', ''),
               1,
               instr(REPLACE(UPPER(d.storm_name), 'HURRICANE ', ''), '(') - 1
           )
       );
