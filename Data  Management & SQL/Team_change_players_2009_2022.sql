/* Which players from 2009 are still playing in 2022 and if they changed teams how did they salary change?
*/
USE H_Baseball;

SELECT 
    sub_4.first_name,
    sub_4.last_name,
    sub_4.changed_team,
    FORMAT(sub_4.salary_change, '#,##.0') AS salary_change_2009_2022
FROM
    (SELECT 
        sub_2.first_name,
            sub_2.last_name,
            CASE
                WHEN sub_2.team LIKE sub_3.team THEN 'Changed team'
                ELSE 'Not changed team'
            END AS changed_team,
            sub_3.salary - sub_2.salary AS salary_change
    FROM
        (SELECT 
        *
    FROM
        (SELECT 
        year,
            SUBSTRING_INDEX(name, ',', - 1) AS first_name,
            SUBSTRING_INDEX(name, ',', 1) AS last_name,
            team,
            salary
    FROM
        players
    WHERE
        year = 2009
    ORDER BY year) AS inner_sub_1) AS sub_2
    INNER JOIN (SELECT 
        *
    FROM
        (SELECT 
        year,
            SUBSTRING_INDEX(name, ',', - 1) AS first_name,
            SUBSTRING_INDEX(name, ',', 1) AS last_name,
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
                WHEN team LIKE 'Seattle%' THEN 'Seattle Mariners'
                WHEN team LIKE 'St. Louis%' THEN 'St. Louis Cardinals'
                WHEN team LIKE 'Tampa Bay%' THEN 'Tampa Bay Rays'
                WHEN team LIKE 'Texas%' THEN 'Texas Rangers'
                WHEN team LIKE 'Toronto%' THEN 'Toronto Blue Jays'
                WHEN team LIKE 'Washington%' THEN 'Washington Nationals'
                ELSE 'TBD'
            END AS team,
            salary
    FROM
        players
    WHERE
        year = 2022
    ORDER BY year) AS inner_sub_2) AS sub_3 ON sub_2.first_name = sub_3.first_name
        AND sub_2.last_name = sub_3.last_name) AS sub_4
ORDER BY changed_team , salary_change DESC
;

