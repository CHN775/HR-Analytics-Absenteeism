-- create a join table
select * 
from absenteeism_at_work
left join compensation on absenteeism_at_work.ID = compensation.ID
left join reasons on absenteeism_at_work.Reason_for_absence = reasons.Number;

-- find the healthiest employees for the bonus
select * from absenteeism_at_work
where Social_drinker = 0 and Social_drinker = 0
and Body_mass_index < 25 and
Absenteeism_time < (select avg(Absenteeism_time) from absenteeism_at_work);

-- compensation rate increase for non smoker / budget $983,221 so .68 increase per hour / $1,414.4 per year
select count(*) as nonsmokers from absenteeism_at_work
where Social_smoker = 0;

-- optimize this query
select 
absenteeism_at_work.ID,
reasons.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index <18.5 then 'Underweight'
     WHEN Body_mass_index between 18.5 and 25 then 'Healthy weight'
     WHEN Body_mass_index between 25 and 30 then 'Overweight'
     WHEN Body_mass_index >18.5  then 'Obese'
     ELSE 'Unknown' END as BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) Then 'Winter'
     WHEN Month_of_absence IN (3,4,5) Then 'Spring'
     WHEN Month_of_absence IN (6,7,8) Then 'Summer'
     WHEN Month_of_absence IN (9,10,11) Then 'Fall'
     ELSE 'Unknown' END as Season_Names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Workload_average,
Absenteeism_time
from absenteeism_at_work
left join compensation on absenteeism_at_work.ID = compensation.ID
left join reasons on absenteeism_at_work.Reason_for_absence = reasons.Number;

