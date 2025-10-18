
# NIRF College Ranking Dashboard Project

##  Overview

**NIRF** stands for **National Institutional Ranking Framework**, developed by the **Indian Government** to rank colleges and universities in India.  
It was launched in **2015** to improve transparency and assess institutional performance.

###  Ranking Parameters :

- Teaching, Learning and Resources  
- Research and Professional Practices  
- Graduation Outcomes  
- Outreach and Inclusivity

---

##  Business Problem

To analyze NIRF data and build dashboards that help understand:

- Institutional performance  
- Average scores and rankings  
- Insights by state and grade  
- Data-driven decision-making

---

##  Data Sources

- `institute_details.csv`  
- `institute_location.csv`  
- `institute_ranking.csv`

---

##  Data Cleaning Process

- Imported all files into Power Query  
- Checked data quality and column types  
- Removed null and unwanted values  
- Used text functions to clean columns  

---

##  Data Modeling

- Connected the three files using `institute_id`  
- Built a data model in Excel, Power BI, and Tableau

###  Data Model Diagram  
`![Data Model](https://your-image-link.com/data-model.png)`

---

##  Key Performance Indicators (KPIs) :

- Total number of institutions  
- Overall average score  
- Overall average rank  

---

##  Excel Dashboard Features :

- Created pivot tables for analysis  
- Built pivot charts for insights  
- Designed a user-friendly dashboard  
- Created KPIs for performance tracking  
- Added slicers for dynamic filtering  

###  Excel Dashboard :  
`![Excel Dashboard](https://your-image-link.com/excel-dashboard.png)`

---

##  What I Did :

- Imported 3 Excel files into Power Query  
- Connected them using data modeling  
- Created pivot tables for analysis  
- Turned tables into meaningful charts  
- Designed an interactive dashboard using slicers  

---

##  What I Learned :

- Improved pivot table and chart skills  
- Gained confidence in data cleaning and analysis  
- Realized Excel's chart options are somewhat limited  

---

##  Power BI

###  Dashboard Features :

- Interactive filters and slicers  
- Visual KPIs and charts  
- Enhanced visualization effects  

###  Power BI Dashboard :  
`![Power BI Dashboard](https://your-image-link.com/powerbi-dashboard.png)`

---

##  What I Did :

- Imported Excel data into Power Query  
- Cleaned and transformed the data  
- Built relationships using data modeling  
- Used DAX for KPIs and calculations  
- Created visuals for business insights  

---

##  What I Learned :

- Enhanced DAX and data modeling knowledge  
- Improved dashboard design skills  
- Developed stronger analytical thinking  

---

##  Tableau :

###  Dashboard Features :

- Created visuals and KPIs  
- Used interactive filters for easy exploration  
- Designed clean and dynamic dashboards  

###  Tableau Dashboard :  
`![Tableau Dashboard](https://your-image-link.com/tableau-dashboard.png)`

---

##  What I Did :

- Imported all cleaned Excel files  
- Connected them via data modeling  
- Created calculated fields  
- Designed visuals for key insights  

---

##  What I Learned :

- Improved LOD (Level of Detail) expressions  
- Enhanced data modeling in Tableau  
- Advanced data visualization techniques  
- Boosted problem-solving skills  

---

##  SQL :

- 1.  View Creation


-  CREATE VIEW university_ranking AS
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

![View Image](https://your-image-link.com/view-image.png)

- 2.  kpi tracking

-  SELECT 
    COUNT(institute_id) AS "Total number of institutions",
    CONCAT(ROUND(AVG(score), 2), "%") AS "Overall average percentage",
    CONCAT(ROUND(AVG(rank_), 2), "%") AS "Overall rank percentage"
FROM university_ranking;

![KPI Image](https://your-image-link.com/kpi-image.png)


- 3.  Top 5 Ranked Institutions

-  SELECT rank_, name 
FROM university_ranking
WHERE rank_ < 6;

![Top 5](https://your-image-link.com/c1-image.png)


- 4.  State-wise Average Score

-  SELECT 
    state, 
    ROUND(AVG(score), 2) AS "Average Score"
FROM university_ranking
GROUP BY state
ORDER BY state ASC;

![State Avg](https://your-image-link.com/c2-image.png)


-5.  Grade-wise Institutions

-  SELECT 
    CASE
        WHEN score >= 90 THEN 'A+'
        WHEN score >= 80 THEN 'A'
        WHEN score >= 70 THEN 'B'
        WHEN score >= 60 THEN 'C'
        WHEN score >= 50 THEN 'D'
        ELSE 'F'
    END AS grade,
    COUNT(institute_id) AS institutions_no
FROM university_ranking
GROUP BY grade;

![Grade-wise](https://your-image-link.com/c3-image.png)

-6.  State-wise Institution Count

-  SELECT 
    state, 
    COUNT(institute_id) AS "Number of Institutions"
FROM university_ranking
GROUP BY state
ORDER BY state ASC; 


![State Count](https://your-image-link.com/c4-image.png)


---

## 📘 What I Learned :

- Improved my SQL query writing 
-  Learned how to create views and KPIs 
-  Gained better understanding of joins and aggregations 

---

