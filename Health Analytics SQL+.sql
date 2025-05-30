# -- 1. Count & Percentage of Female vs Male that have OCD and Average Obsession Score by Gender
with data as (
SELECT
Gender,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs_score

FROM patient_data.ocd_patient_dataset
Group By 1
Order by 2
)

select
	sum(case when Gender = 'Female' then patient_count else 0 end) as count_female,
	sum(case when Gender = 'Male' then patient_count else 0 end) as count_male,

	round(sum(case when Gender = 'Female' then patient_count else 0 end)/
	(sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_female,

    round(sum(case when Gender = 'Male' then patient_count else 0 end)/
	(sum(case when Gender = 'Female' then patient_count else 0 end)+sum(case when Gender = 'Male' then patient_count else 0 end)) *100,2)
	 as pct_male

from data;


# -- 2. Count of Patients by Ethnicity and their respective Average Obsession Score

select
	Ethnicity,
	count(`Patient ID`) as patient_count,
	avg(`Y-BOCS Score (Obsessions)`) as obs_score
From patient_data.ocd_patient_dataset
Group by 1
Order by 2;


# -- 3. Number of people diagnosed with OCD month or month

# -- alter the table health_data.ocd_patient_dataset
# -- modify the date `OCD Diagnosis Date`
select
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
from patient_data.ocd_patient_dataset
group by 1
Order by 1;


# -- 4. Count of common Obsession Type and it's respective Average Obsession Score

Select
`Obsession Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from patient_data.ocd_patient_dataset
group by 1
Order by 2;


# -- 5. Count of common Compulsion type and it's respective Average Obsession Score

Select
`Compulsion Type`,
count(`Patient ID`) as patient_count,
round(avg(`Y-BOCS Score (Obsessions)`),2) as obs_score
from patient_data.ocd_patient_dataset
group by 1
Order by 2;