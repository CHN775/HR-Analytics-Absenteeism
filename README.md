# 📉HR Analytics-Absenteeism at Work 
## Problem Statement: 🔍 
HR Request to Data Analysis Team To provide a list of healthy individuals with low absenteeism for our healthy bonus program. The program's total budget is $1000 USD.  

➢ Please calculate the wage increase or annual compensation for 
nonsmokers, using an insurance budget of $983,221 for all non
smokers.  
➢ Lastly, create a dashboard for HR to understand absenteeism at work, 
based on the approved wireframe. 

## Approach:-   
1. Understanding Data Analysis Task and Problem Statement  
2. Connecting to MySQL Workbench and Database/Table Creation  
3. Uploading Data to the Database  
4. Writing SQL Complex Join Queries  
5. SQL Query with Filters for Healthy Workers  
6. Compensation Calculation Analysis with SQL  
7. Optimize SQL Query and CASE Statements  
8. Connecting Excel to Database MySQL  
9. Dashboard Development and Wireframe  
10. Final Dashboard Design  

## Tool used-  
SQL (MySQL Workbench), Advanced Excel (Power Query, Power Pivot, Dashboard, 
Pivot Tables) 

## Joining tables through queries. 
```sql
select * 
from absenteeism_at_work
left join compensation on absenteeism_at_work.ID = compensation.ID
left join reasons on absenteeism_at_work.Reason_for_absence = reasons.Number;
```

# Insights 👎  
### Q1. To provide a list of healthy individuals with low absenteeism for our healthy bonus program. The program's total budget is $1000 USD.  

### Solution:- 🔍

Based on the SQL query, we have determined that there are 111 employers who 
meet multiple criteria and are considered to be healthy with low absenteeism. We 
can offer them bonus incentives from our fixed budget to show our apprciation.         
```sql
select *
from absenteeism_at_work
where Social_drinker = 0 and Social_drinker = 0
and Body_mass_index < 25 and
Absenteeism_time < (select avg(Absenteeism_time) from absenteeism_at_work);
```
### Q2. Please calculate the wage increase or annual compensation for nonsmokers, using an insurance budget of $983,221 for all non-smokers.  
### Solution:-  
The compensation rate increase for non-smokers by 0.68 increase per hour 
which means  
$1,414.4/year.  
```sql
select count(*) as nonsmokers
from absenteeism_at_work
where Social_smoker = 0;
```
> ### COUNT= 686

To calculate the wage increase or annual compensation for non-smokers, using 
an insurance budget of $983,221 for all non-smokers, we can use the following 
steps:  
5days * 8hr = 40hr/day. it means in 52 week(1 yr) 40 hr *52 = 2080 hr  
1. Calculate the total number of hours worked by all employees:  
2080hr *686 = 1,426,880 hrs  
2. Divide the total number of hours worked by the insurance budget to get the hourly compensation rate increase:  
1,426,880 \ $983,221 = 0.68$/hr  
3. Finally, multiply the hourly compensation rate increase by the number of hours worked per year (2080) to get the annual compensation increase:  

0.68 $ * 2080 hrs = $1,414.4/yr  
Therefore, the annual compensation increase for non-smokers is $1,414.4yr
# Data Processing And Query Optimization for Dashboard Prepration 
```sql
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
```
