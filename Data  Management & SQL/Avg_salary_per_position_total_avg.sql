/* */

/* What is the average salary per position per team over the years and what is the average salary over the years in general?*/
WITH clean_data AS (
SELECT 
         player_id,
            year,
            CASE
                WHEN team LIKE 'Arizona%' THEN 'Arizona Diamondbacks'
                WHEN team LIKE 'Atlanta%' THEN 'Atlanta Braves'
                WHEN team LIKE 'Baltimore%' THEN 'Baltimore Orioles'
                WHEN team LIKE 'Boston%' THEN 'Boston Red Sox'
                WHEN team LIKE 'Chi. Cubs' THEN 'Chicago Cubs'
                WHEN team LIKE 'Chicago Cubs' THEN 'Chicago Cubs'
                WHEN team LIKE 'Chic. White Sox' THEN 'Chicago White Sox'
                WHEN team LIKE 'Chicago White Sox' THEN 'Chicago White Sox'
                WHEN team LIKE 'Cincinnati%' THEN 'Cincinnati Reds'
                WHEN team LIKE 'Cleveland%' THEN 'Cleveland Indians'
                WHEN team LIKE 'Colorado%' THEN 'Colorado Rockies'
                WHEN team LIKE 'Detroit%' THEN 'Detroit Tigers'
                WHEN team LIKE 'Florida Marlins' THEN 'Florida Marlins'
                WHEN team LIKE 'Houston%' THEN 'Houston Rockets'
                WHEN team LIKE 'Kansas%' THEN 'Kansas City'
                WHEN team LIKE 'L.A. Dodgers' THEN 'Los Angeles Dodgers'
                WHEN team LIKE 'Los Angeles Dodgers' THEN 'Los Angeles Dodgers'
                WHEN team LIKE 'L.A. Angels' THEN 'Los Angeles Angels'
                WHEN team LIKE 'Los Angeles Angels' THEN 'Los Angeles Angels'
                WHEN team LIKE 'Miami%' THEN 'Miami Marlins'
                WHEN team LIKE 'Milwaukee%' THEN 'Milwaukee Brewers'
                WHEN team LIKE 'Minnesota%' THEN 'Minnesota Twins'
                WHEN team LIKE 'N.Y. Mets' THEN 'New York Mets'
                WHEN team LIKE 'New York Mets' THEN 'New York Mets'
                WHEN team LIKE 'N.Y. Yankees' THEN 'New York Yankees'
                WHEN team LIKE 'New York Yankees' THEN 'New York Yankees'
                WHEN team LIKE 'Oakland%' THEN 'Oakland Athletics'
                WHEN team LIKE 'Philadelphia%' THEN 'Philadelphia Phillies'
                WHEN team LIKE 'Pittsburgh%' THEN 'Pittsburgh Pirates'
                WHEN team LIKE 'San Diego%' THEN 'San Diego Padres'
                WHEN team LIKE 'San Francisco%' THEN 'San Francisco Giants'
                WHEN team LIKE 'Seattle%' THEN 'Seattle Marinerss'
                WHEN team LIKE 'St. Louis%' THEN 'St. Louis Cardinals'
                WHEN team LIKE 'Tampa Bay%' THEN 'Tampa Bay Rays'
                WHEN team LIKE 'Texas%' THEN 'Texas Rangers'
                WHEN team LIKE 'Toronto%' THEN 'Toronto Blue Jays'
                WHEN team LIKE 'Washington%' THEN 'Washington Nationals'
                ELSE 'TBD'
            END AS team,
            name,
            CASE
                WHEN position LIKE '1B' THEN 'First Baseman'
                WHEN position LIKE 'First Baseman' THEN 'First Baseman'
                WHEN position LIKE '2B' THEN 'Second Baseman'
                WHEN position LIKE 'Second Baseman' THEN 'Second Baseman'
                WHEN position LIKE '3B' THEN 'Third Baseman'
                WHEN position LIKE 'Third Baseman' THEN 'Third Baseman'
                WHEN position LIKE 'DH' THEN 'Designated Hitter'
                WHEN position LIKE 'Designated Hitter' THEN 'Designated Hitter'
                WHEN position LIKE 'SS' THEN 'Shortstop'
                WHEN position LIKE 'Shortstop' THEN 'Shortstop'
                WHEN position LIKE 'C' THEN 'Catcher'
                WHEN position LIKE 'Catcher' THEN 'Catcher'
                WHEN position LIKE 'INF' THEN 'Infielder'
                WHEN position LIKE 'Infielder' THEN 'Infielder'
                WHEN position LIKE 'OF' THEN 'Outfielder'
                WHEN position LIKE 'Outfielder' THEN 'Outfielder'
                WHEN position LIKE 'Pitcher' THEN 'Pitcher'
                WHEN position LIKE 'LHP%' THEN 'Pitcher'
                WHEN position LIKE 'RHP%' THEN 'Pitcher'
                ELSE 'TBD'
            END AS position,
            salary
    FROM
        players
    ORDER BY year , team , position)
SELECT  team, position, FORMAT(avg_salary, '#,##.0') AS avg_salary_position, FORMAT(AVG(avg_salary) OVER(),'#,##.0') AS total_avg
FROM (
SELECT team, position, AVG(salary) AS avg_salary
FROM clean_data
GROUP BY team, position) AS sub
GROUP BY team, position
ORDER BY team, avg_salary DESC;
