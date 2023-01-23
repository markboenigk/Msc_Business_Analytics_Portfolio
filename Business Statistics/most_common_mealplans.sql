/* What is the most sold meal plan  by Hispanics/Lations*/
SELECT race, mp.meal_plan, COUNT(*) AS number_orders FROM `order` AS o
LEFT JOIN customer as c
ON o.customer_id = c.customer_id
LEFT JOIN meal_plan AS mp
ON o.meal_plan_id = mp.meal_plan_id
INNER JOIN race 
ON c.race_id = race.race_id 
GROUP BY race, mp.meal_plan
HAVING race = "Hispanic/Latino"
ORDER BY race, number_orders DESC
LIMIT 1
;
/* What is the most sold meal plan  by Hispanics/Lations*/
SELECT meal_plan, race, count(order_id)
FROM `order`
INNER JOIN meal_plan USING(meal_plan_id)
INNER JOIN customer USING(customer_id)
INNER JOIN race USING(race_id)
WHERE race = "Hispanic/Latino"
GROUP BY meal_plan, race
;

