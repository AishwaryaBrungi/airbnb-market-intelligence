-- ============================================================
-- Airbnb Market Intelligence Platform
-- Cities: Chicago & New Orleans | Listings: 13,593
-- ============================================================


-- ------------------------------------------------------------
-- 1. KPI SUMMARY BY CITY
--    Key metrics at a glance for each market
-- ------------------------------------------------------------
SELECT
    city,
    COUNT(*)                                        AS total_listings,
    ROUND(AVG(price), 2)                            AS avg_nightly_price,
    ROUND(AVG(occupancy_rate), 2)                   AS avg_occupancy_rate,
    ROUND(AVG(estimated_annual_revenue), 2)         AS avg_annual_revenue,
    ROUND(MAX(estimated_annual_revenue), 2)         AS max_annual_revenue
FROM airbnb_final
GROUP BY city
ORDER BY avg_annual_revenue DESC;

-- Expected output:
-- Chicago:     7,488 listings | $211/night | 36.7% occupancy | $35,209 avg revenue
-- New Orleans: 6,105 listings | $176/night | 32.6% occupancy | $31,391 avg revenue


-- ------------------------------------------------------------
-- 2. AVERAGE PRICE BY CITY AND ROOM TYPE
--    Identifies which listing types command premium pricing
-- ------------------------------------------------------------
SELECT
    city,
    room_type,
    COUNT(*)                                        AS total_listings,
    ROUND(AVG(price), 2)                            AS avg_price,
    ROUND(AVG(price) - MIN(price), 2)               AS price_range,
    ROUND(AVG(estimated_annual_revenue), 2)         AS avg_annual_revenue
FROM airbnb_final
GROUP BY city, room_type
ORDER BY city, avg_price DESC;

-- Key insight:
-- Chicago hotel rooms avg $385/night vs $234 in New Orleans
-- Chicago entire home/apt avg $244 vs $178 in New Orleans


-- ------------------------------------------------------------
-- 3. TOP 10 NEIGHBORHOODS BY ESTIMATED ANNUAL REVENUE
--    Identifies highest-earning markets for investment decisions
-- ------------------------------------------------------------
SELECT
    city,
    neighbourhood,
    COUNT(*)                                        AS total_listings,
    ROUND(AVG(price), 2)                            AS avg_price,
    ROUND(AVG(occupancy_rate), 2)                   AS avg_occupancy_rate,
    ROUND(AVG(estimated_annual_revenue), 2)         AS avg_annual_revenue
FROM airbnb_final
GROUP BY city, neighbourhood
HAVING COUNT(*) >= 5
ORDER BY avg_annual_revenue DESC
LIMIT 10;

-- Key insight:
-- Read Blvd East (New Orleans) leads at $73,699 avg annual revenue
-- Near South Side (Chicago) top Chicago neighborhood at $64,028


-- ------------------------------------------------------------
-- 4. PRICING TIER ANALYSIS
--    Segments listings into tiers and compares revenue performance
-- ------------------------------------------------------------
SELECT
    city,
    CASE
        WHEN price <= 91  THEN '1. Budget ($10–$91)'
        WHEN price <= 148 THEN '2. Mid-range ($92–$148)'
        WHEN price <= 250 THEN '3. Premium ($149–$250)'
        ELSE                   '4. Luxury ($251+)'
    END                                             AS price_tier,
    COUNT(*)                                        AS total_listings,
    ROUND(AVG(price), 2)                            AS avg_price,
    ROUND(AVG(occupancy_rate), 2)                   AS avg_occupancy_rate,
    ROUND(AVG(estimated_annual_revenue), 2)         AS avg_annual_revenue
FROM airbnb_final
GROUP BY city, price_tier
ORDER BY city, price_tier;

-- Key insight:
-- Optimal pricing range $161–$250/night
-- Premium tier yields 593.8% more revenue than budget tier


-- ------------------------------------------------------------
-- 5. HOST PERFORMANCE ANALYSIS
--    Identifies high-volume hosts and their revenue contribution
-- ------------------------------------------------------------
SELECT
    city,
    host_id,
    host_name,
    COUNT(*)                                        AS total_listings,
    ROUND(AVG(price), 2)                            AS avg_price,
    ROUND(AVG(occupancy_rate), 2)                   AS avg_occupancy_rate,
    ROUND(SUM(estimated_annual_revenue), 2)         AS total_portfolio_revenue
FROM airbnb_final
GROUP BY city, host_id, host_name
HAVING COUNT(*) >= 3
ORDER BY total_portfolio_revenue DESC
LIMIT 15;

-- Key insight:
-- Multi-listing hosts generate disproportionately higher portfolio revenue


-- ------------------------------------------------------------
-- 6. OCCUPANCY VS REVENUE CORRELATION
--    Tests whether higher occupancy always means higher revenue
-- ------------------------------------------------------------
SELECT
    city,
    CASE
        WHEN occupancy_rate < 25  THEN '1. Low (0–25%)'
        WHEN occupancy_rate < 50  THEN '2. Medium (25–50%)'
        WHEN occupancy_rate < 75  THEN '3. High (50–75%)'
        ELSE                           '4. Very High (75–100%)'
    END                                             AS occupancy_bucket,
    COUNT(*)                                        AS total_listings,
    ROUND(AVG(price), 2)                            AS avg_price,
    ROUND(AVG(estimated_annual_revenue), 2)         AS avg_annual_revenue
FROM airbnb_final
GROUP BY city, occupancy_bucket
ORDER BY city, occupancy_bucket;

-- Key insight:
-- High occupancy + optimal pricing ($161–$250) = maximum revenue
-- Very high occupancy listings may be underpriced
