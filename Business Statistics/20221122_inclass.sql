USE h_trifecta;
SELECT 
    customer_id,
	age,
	weight,
	mb.race,
	mb.income_range,
	sub_race1.race_bins,
	sub_2.revised_income_bins,
	total_meals_per_box,
	NTILE(4)  OVER(ORDER BY age)-1 AS age_bin,
	NTILE(4) OVER(ORDER BY weight) -1 AS weight_bin,
	NTILE(4) OVER(ORDER BY total_meals_per_box) -1 AS total_meals_bin,
    gender,
    employment_status,
	ordered_3rd_entree,
    living_alone AS household_status,
    household_type,
    meal_sent AS meal_preference,
    became_member    
FROM
    mboenigk_view AS mb
LEFT JOIN (SELECT income_range, income_count, CASE WHEN income_count < 100 THEN "Others" ELSE income_range END AS revised_income_bins
FROM (
SELECT income_range, COUNT(income_range) AS income_count
FROM mboenigk_view
GROUP BY income_range ) AS sub) AS sub_2
ON mb.income_range = sub_2.income_range

LEFT JOIN (SELECT race, race_count, CASE WHEN race_count < 100 THEN "Others" ELSE race END AS race_bins
FROM (
SELECT race, COUNT(race) AS race_count
FROM mboenigk_view
GROUP BY race ) AS sub_race) AS sub_race1
ON mb.race = sub_race1.race;