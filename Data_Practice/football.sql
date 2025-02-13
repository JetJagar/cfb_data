-- queries to make sure the data was loaded correctly
SELECT * 
FROM cfb_23_def_top_50;

SELECT team, def_rank, conference
FROM cfb_23_def_top_50;

SELECT team, def_rank, conference
FROM cfb_23_def_top_50
WHERE conference = 'SEC';

SELECT team, def_rank, conference
FROM cfb_23_def_top_50
WHERE conference = 'SEC' AND def_rank between 1 and 100;

SELECT team, def_rank, conference
FROM cfb_23_def_top_50
WHERE conference = 'SEC' AND def_rank BETWEEN 1 AND 100
ORDER BY def_rank ASC;

-- changing the data type of the yrds_allowed column from 
-- text to integer
ALTER TABLE cfb_21_def_top_50
ALTER COLUMN yrds_allowed TYPE INTEGER 
USING REPLACE(yrds_allowed, ',', '')::INTEGER;

-- basic queries to sum total yards for offense and defense
SELECT conference, SUM(off_yards) AS total_off_yards
FROM cfb_21
GROUP BY conference
ORDER BY total_off_yards DESC;

SELECT conference, SUM(yrds_allowed) AS total_yrds_allowed
FROM cfb_21_def_top_50
GROUP BY conference
ORDER BY total_yrds_allowed ASC;

-- joing the two tables together
SELECT o.conference, SUM(o.off_yards) AS total_off_yrds, SUM(d.yrds_allowed) AS total_yrds_allowed
FROM cfb_21 o JOIN cfb_21_def_top_50 d 
ON o.conference = d.conference
GROUP BY o.conference
ORDER BY total_off_yrds desc;

