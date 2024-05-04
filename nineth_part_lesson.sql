9-1

GROUP BY 

SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id; 
//isci tablosunda  department_id sutununa gore gruplar ve siralar departman idyi ve mas ortalamasini getirecektir 
// yani deparman idye gore grupladi ve ayni idye sahip olanlarin ortalamasini aldi 

SELECT MAX(salary) FROM employees GROUP BY department_id;
// departman idye gore grupladiktan her bir idnin max mas degerini verecektir 

SELECT COUNT(country_name), region_id FROM wf_countries GROUP BY region_id ORDER BY region_id
// region_id ye gore gruplandiracaktir sonra idsi ayni olan sehir isimlerini sayisini verecektir null olanlar haric 

SELECT COUNT(*), region_id FROM wf_countries GROUP BY region_id ORDER BY region_id
// tum gruplardaki satir degerlerini sayacaktir 

SELECT department_id, MAX(salary) FROM employees WHERE last_name !='King' GROUP BY department_id;
// departmen i gore gruplicak idleri ayni olanlarin icinde soy ismi king olmayan max degeri verecektir 

SELECT region_id, ROUND(AVG(population)) AS population FROM wf_countries GROUP BY region_id ORDER BY region_id 
// region_id gore gruplama yapacaktir sonra idleri ayni olanlarin populasyondaki degerlerinin ortalamasini alacaktir ve yuvarlama islemi gerceklestirecektir 

SELECT country_id, COUNT(language_id) AS "Number of Languages " FROM wf_spoken_languages GROUP BY country_id;
// country_id gore grupluypr sonra idleri ayni olanlarin null olmayan language_idlerini sayiyor 

SELECT department_id, job_id , COUNT(*) FROM employees WHERE department_id>40 GROUP BY department_id , job_id 
//önce "department_id" sütununa göre gruplar ve ardından her bir bölüm içinde "job_id" sütununa göre alt gruplar oluşturur. 
Yani, her bir departman ve iş pozisyonu kombinasyonu için çalışan sayısı hesaplanır.


nesting group function 
SELECT MAX(AVG(salary)) FROM employees GROUP BY department_id
//department_id gore gruplandirdi ayni idlere sahip olan  maasin bir ortalamasini aldi sonrada max degerini aldi

HAVING KULLANIMI 
SELECT department_id , MAX(salary) FROM employees GROUP BY department_id HAVING COUNT(*)>1 ORDER BY department_id;
// where kullanamadigimiz icin group functionda onun yerine onla ayni isleve sahip having kullaniyoruz 
SELECT region_id, ROUND(AVG(population)) FROM wf_countries GROUP BY region_id HAVING MIN(population)>300000 ORDER BY region_id;
// region id gore gruplama yapar ve siralar havinde verilen kisitlamayi gercelestirir ve kalanlarin populasyonlarinin ortalamasini alip yuvarlar

sorgu siralamasi 
SELECT column , group_function 
FROM table 
WHERE 
GROUP BY 
HAVING 
ORDER BY 

9-2 
ROLLUP 
rollup, bağımsız değişken listesinde gruplama sütunlarının sıralı bir listesini kullanır 
ROLLUP bağımsız değişken listesinde görünen sütun veya ifadelerin sayısı gruplama sayısını belirler 

SELECT department_id, job_id, SUM(salary) FROM employees WHERE department_id< 50 GROUP BY ROLLUP(department_id, job_id);
// department_id varsa job_idsi null ise subtotal hesaplaniyor 
//department_id ve job_id null ise grand total hesaplaniyor 
// ikiside null degil ise normal total hesaplaniyor 

CUBE 
SELECT department_id, job_id, SUM(salary) FROM employees WHERE department_id<50 GROUP BY CUBE (department_id, job_id);
// department id null job id de null ise bu total 
//department id mull job id null degil ise bu subtotal 
department id for degil ise job id null ise nu subtotal 

GROUPING SETS 
SELECT department_id, job_id , manager_id, SUM(salary) FROM employees WHERE department_id<50 GROUP BY GROUPING SETS ((job_id ,manager_id),(department_id,job_id),(department_id, manager_id)) 
//grup setlerinden herhangi biri null olabilir her ikisiide null olmayabilir

9-3
A_ID={1,2,3,4,5}
B_ID={4,5,6,7,8}
iki tane id sutunum var 

UNION
tekrarlilari bir kez alir 
SELECT a_id FROM a UNION SELECT b_id FROM b;
// bu tekrarli olan verileri teke dusurecektir bu sorgu {1,2,3,4,5,6,7,8} verecektir 

UNION ALL 
tekrarlilari ne kadar varsa o kadar alir 
SELECT a_id FROM a UNION ALL SELECT b_id FROM b;
//tum elemanlari donecektir {1,2,3,4,5,4,5,6,7,8}

INTERSECT 
iki tablodaki ortak satirlari alir 
SELECT a_id FROM a INTERSECT SELECT b_id FROM b;
//ortak degerleri alacaktir {4,5}

MINUS 
iki tabloda da olan degerler disindaki degerleri verecektir 
yani ortak olmayan elemanlari verecektir 
SELECT a_id FROM a MINUS SELECT b_id FROM b;
// a da ortak olmayanlar {1,2,3}
// eger B MINUS A olsaydi sonuc {6,7,8} olurdu 

SELECT hire_date , employee_d, job_id FROM employees UNION SELECT TO_DATE(NULL), employee_id, job_id FROM job_history;
//tekrarlilari eleyip birlestirecektir ama job_history hire_date sahip olmadigi icin onun degerlerini hire date null olarak alacaktir 

SELECT hire_date, employee_id, job_id FROM employees UNION SELECT TO_DATE(NULL), employee_id,  job_id FROM job_history ORDER BY employee_id;
//employee idye gore siralayacaktir

SELECT hire_date, employee_id , TO_DATE(NULL) start_date, TO_DATE(NULL) end_date, job_id, department_id FROM employees UNION SELECT TO_DATE(NULL), employee_id , start_date, end_date, job_id, department_id FROM job_history ORDER BY employee_id;
//employees start_date ve end_date tarihleri null olacak demek ama job_historynin tarihleri null olmiyacak demek 
