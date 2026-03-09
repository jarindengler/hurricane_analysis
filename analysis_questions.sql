-- =====================================================
-- Hurricane Intensity vs Economic Damage Analysis
-- Author: Jarin Dengler
-- Database: SQLite
-- Description:
-- Combines NOAA hurricane intensity data with historical
-- CPI-adjusted economic damage estimates to analyze the
-- relationship between hurricane strength and financial impact.
-- =====================================================



-- =====================================================
-- Question 1
-- Which hurricanes have caused the most economic damage?
-- =====================================================

SELECT
    storm_name,
    year,
    max_wind,
    cost_millions
FROM hurricane_damage_analysis
ORDER BY cost_millions DESC
LIMIT 10;



-- =====================================================
-- Question 2
-- Is there a relationship between maximum wind speed
-- and economic damage?
-- =====================================================

SELECT
    max_wind,
    ROUND(AVG(cost_millions), 2) AS avg_damage
FROM hurricane_damage_analysis
WHERE cost_millions IS NOT NULL
GROUP BY max_wind
ORDER BY max_wind;



-- =====================================================
-- Question 3
-- Are stronger hurricanes consistently more costly?
-- Group storms by Saffir-Simpson category
-- =====================================================

SELECT
    CASE
        WHEN max_wind < 96 THEN 'Below Cat 2'
        WHEN max_wind BETWEEN 96 AND 110 THEN 'Cat 2'
        WHEN max_wind BETWEEN 111 AND 129 THEN 'Cat 3'
        WHEN max_wind BETWEEN 130 AND 156 THEN 'Cat 4'
        ELSE 'Cat 5'
    END AS hurricane_category,

    COUNT(*) AS storm_count,
    ROUND(AVG(cost_millions), 2) AS avg_damage,
    ROUND(MAX(cost_millions), 2) AS max_damage

FROM hurricane_damage_analysis
WHERE max_wind IS NOT NULL
  AND cost_millions IS NOT NULL

GROUP BY hurricane_category
ORDER BY hurricane_category;



-- =====================================================
-- Question 4
-- How does hurricane damage vary over time?
-- =====================================================

SELECT
    year,
    ROUND(SUM(cost_millions), 2) AS total_damage
FROM hurricane_damage_analysis
WHERE cost_millions IS NOT NULL
GROUP BY year
ORDER BY year;
