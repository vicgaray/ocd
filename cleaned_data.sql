 -- 1. Count of M vs F that OCD & Average Obsession Score by Gender

SELECT 
	Gender,
	COUNT(`Patient ID`) as patient_count,
	ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM OCD.ocd_patient_dataset 
GROUP BY Gender
ORDER BY patient_count

-- 2. Count of Patients by ethnicity and their respective Average Obsession Score 
SELECT 
	Ethnicity,
    count(`Patient ID`) as patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM OCD.ocd_patient_dataset 
GROUP BY Ethnicity
ORDER BY patient_count

-- 3. Number of people diagnosed MoM
ALTER TABLE OCD.ocd_patient_dataset
MODIFY `OCD Diagnosis Date` date

SELECT
	date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
    COUNT(`Patient ID`) as patient_count
FROM OCD.ocd_patient_dataset 
GROUP BY month
ORDER BY month

-- 4. What is the most Obession Type (count) & it's respective Average Obession Score
SELECT
	`Obsession Type`,
    COUNT(`Patient ID`) as patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM OCD.ocd_patient_dataset 
GROUP BY `Obsession Type`
ORDER BY patient_count

-- 5. What is the most common Compulsion type (count) & it's repsctive Average Obession Score
SELECT
	`Compulsion Type`,
    COUNT(`Patient ID`) as patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score
FROM OCD.ocd_patient_dataset 
GROUP BY `Compulsion Type`
ORDER BY patient_count;