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

