create database university_ranking_project;

use university_ranking_project;

show tables;

desc institute_details;

desc institute_location;

desc institute_ranking;

# view creation

create view university_ranking as
SELECT 
    institute_details.institute_id, 
    institute_details.name, 
    institute_location.city, 
    institute_location.state, 
    institute_ranking.score, 
    institute_ranking.rank_
FROM institute_details
LEFT JOIN institute_location
    ON institute_details.institute_id = institute_location.institute_id
LEFT JOIN institute_ranking
    ON institute_details.institute_id = institute_ranking.institute_id;
    
    select * from university_ranking;
    


# -----------------------------------kpi's--------------------------------------
 
 
 # Total no of instutions 
 select count(institute_id) as "Totalnumber of instutions" ,
 # over all average percentage
 concat(round(avg(score),2),"%") as "over all average percentage",
 # over all rank percentage
 concat(round(avg(rank_),2),"%") as "over all rank percentage" 
 from university_ranking;
 
# ------------------- charts--------------------------------------------------

# Rank wise top 5 institutions
select rank_, name from university_ranking
where rank_<6;

# state wise average scores in percentage
select state , round(avg(score),2) as "average score" from university_ranking
group by state 
order by state asc;

# grade wise institutions in percentage
select 
CASE
    WHEN score >= 90 THEN 'A+'
    WHEN score >= 80 THEN 'A'
    WHEN score >= 70 THEN 'B'
    WHEN score >= 60 THEN 'C'
    WHEN score >= 50 THEN 'D'
    ELSE 'F'
END AS grade,
count(institute_id) as institions_no
 from university_ranking
 group by grade;
 
# state wise number of instutions

select state , count(institute_id) as "number of institutions" from university_ranking
group by state 
order by state asc;


