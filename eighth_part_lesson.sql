8-1 

//Group Function 
min , max , count = herhangi bir veri turuyle kullanilabilir
sum, avg, stddev, variance = sadece number veri turuyle kullanilir 


//Group Function Query 
SELECT column, group_function(column), ... FROM table WHERE condition GROUP BY column ; 

1-AVG (sutundaki degerlerin ortalamasini hesaplar)
SELECT AVG(salary) FROM employees; 
//salary tablosundaki verilerin ortalamasini verecektir 
SELECT AVG(area) FROM wf_countries WHERE region_id=29;
//Region idsi 29 olan wf_countries tablosundaki area sutundaki verilerin ortalamasini verecektir 
SELECT ROUND(AVG(area),2) FROM employees WHERE department_id=90;
//departman idsi 90 olan isciler tablosundan salary sutununun ortalamasini alacaktir ve onu yuvarliyacaktir . dan sonra 2 tane kalacak sekilde 


2-COUNT(sutundaki toplam satir sayisini getirir)
SELECT COUNT(salary) FROM employees;
//salary tablosundaki satir sayisini verecektir  


3-MIN (istenilen sutundaki en kucuk veriyi getirir)
SELECT MIN(salary) FROM employees;
//salary tablosundaki en kucuk veriyi getirecektir 
SELECT MIN(life_expect_at_birth) AS "Lowest Life Exp" FROM wf_countries;
SELECT MIN(country_name) FROM wf_countries;
SELECT MIN(hire_date) FROM employees;
//bu sorgular minimum degeri dondureceklerdir 


4-MAX (istenilen sutundaki en buyuk veriyi getirir )
SELECT MAX(salary) FROM employees;
//salary tablosundaki en buyuk veriyi getirir 
SELECT MAX(life_expect_at_birth) AS "Highest Life Exp" FROM wf_countries;
SELECT MAX(country_name) FROM wf_countries;
SELECT MAX(hire_date) FROM employees;
//bu sorgular maximum degeri dondureceklerdir 


5-SUM (sutundaki degerlerinin hepsinin toplamini verecektir )
SELECT SUM(salary) FROM employees; 
// salary tablosundaki verilerin toplamini verecektir 
SELECT SUM(area) FROM wf_countries;
wf_countries tablosundaki area sutunundaki tablolarin toplamini verecektir 
SELECT SUM(area) FROM employees WHERE department_id=90;
// departman id 90 olan isciler tablosundaki area sutununaki degerlerin toplamini verecekir 


6-VARIANCE 
//Bir veri setindeki değerlerin ortalama değerden ne kadar uzaklıkta olduğunu gösteren bir ölçüdür.
Varyans, her bir veri noktasının ortalamadan ne kadar uzaklıkta olduğunu ölçer ve bu uzaklıkların karelerinin toplamının, 
veri noktalarının sayısına bölünmesiyle hesaplanır.
Örneğin, bir yatırım portföyünün getirilerindeki varyans, getirilerin ortalama getiriden ne kadar saptığını ölçer.
SELECT ROUND(VARIANCE(life_expect_at_birth),4) FROM wf_countries;
// ortalama degerden ne kadar uzakta oldugunun olcumunu yapar ve yuvarlama yapar noktadan sonra 4 rakam birakir 


7-STDDEV (stundaki verilerim standart sapmalarini hesaplar )
//Standart sapma, varyansın kareköküdür. Bu nedenle, standart sapma, 
bir veri setindeki değerlerin ortalama değere ne kadar yayıldığını ölçen bir istatistiksel ölçüdür. 
Standart sapma, varyansın karekökü olduğu için, varyansın ölçü birimine dönüştürülmesini sağlar ve 
bu nedenle varyansla aynı ölçek üzerinde yorum yapılabilir.
SELECT ROUND(STDDEV(life_expect_at_birth),4) FROM wf_countries;
// standart sapma hesaplar ve onu yuvarlar noktadan sonra 4 rakam birakacak sekilde 


//group function ignore null values 
SELECT AVG(commission_pct) FROM employees;
// null olan tablolarda var icinde onlari gormezden gelecek ve kalanlarin ortalamasini alacaktir

//more than one function 
SELECT MAX(salary), MIN(salary), MIN(employee_id) FROM employees WHERE department_id=60;
//burada departman idsi 60 olan icilerin salarysindeki max ne min degeri ve employe idnin min degerini verecektir 

8-2
Count 
//stundaki null olmayan ifadelerin sayisini dondurecektir 
SELECT COUNT(job_id) FROM employees;
// toplam satiridaki null olmayan degerlerin sayisini donecektir 
SELECT COUNT(commision_pct) FROM employees;
// commission_pct sutunundaki null olmayan degerlerin sayisini verecektir 

COUNT(*) =  bir tablodaki tum satiri donduruyor 
SELECT COUNT(*) FROM employees WHERE hire_date<'01-Jan-1996';
// ice girme tarihi 01-jan-1996 dan kucuk olan icilerin kac tane oldugunu soyleyecektir 

DISTINCT 
//tekrarlanmis kelimeleri tek kelime olarak sayar 
SELECT DISTINCT job_id FROM employees;
// isciler tablosundaki job id sununda tekrarlanmis kelimelerin sadece bir tanesi dondurecek sekilde olusturulur 
SELECT  DISTINCT job_id, department_id FROM employees;
// iki sutundada tekrarlanmis ifadeler olmayacaktir 

SELECT SUM(salary) FROM employees WHERE department_id=90;
// tekrarlanmis ifadeler ile toplama yapmistir ve sonuc= 58000
SELECT SUM(DISTINCT salary) FROM employees WHERE department_id=90;
//tekarlanmis ifadeleri cikartacaktir ve o sekilde toplama yapacaktir sonuc=41000

SELECT COUNT (DISTINCT job_id) FROM employees; 
//tekrarlanmis ifadeleri cikartip geri kalan satirlari soyleyecektir 
SELECT COUNT (DISTINCT salary ) FROM employees;
//takrarlanmis ifadeleri cikartip geri kalan satir sayisini soyleyecektir 


NVL 
SELECT AVG(NVL(commission_pct,0 )) FROM employees;
//null olan verilere 0 verip onlarida ortalama icine alacaktir 
SELECT AVG(commission_pct) FROM employees;
// null olmayan degerleri alip ortalamasini alacaktir 
