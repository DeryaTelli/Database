10-1
SUBQUERY 
// where clauseda ise eger ic sorgu hicbir satir donmez ve null deger verirse dis sorguda alt sorgunun sonucunu alacaktir yani null 
//subquery kendi order by clause olamaz 
outher querynin order byi olur 
subquery syntax 
SELECT select_list 
FROM table 
WHERE expression operator 
(SELECT select_list FROM table); // parantez icindeki subquery syntax 

single-row subquery 
right hand side of the comparison condition 
sadece tek satir operatorleri kullanir  (>,=,>=, <,<>,<=)
ic sorgudan bir tane satir doner sadece 
multiple-row subquery 
coklu operator kullanir (in , any , all)
ic sorgudan birden fazla satir doner 

SELECT first_name, last_name, hire_date FROM employees WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name='Vargas');
// ic sorgudaki deger soy ismi vargas olan employee tablosundan hire date cekecektir o hiredate den buyuk olanlarin ilk ismi , soy ismi ve ise girme tarihlerini verecektir 

SELECT last_name FROM employees WHERE department_id=(SELECT department_id FROM employees WHERE last_name='Grant');
//where clausedaki  ic sorgunun degeri null oldugu icin dis sorguda veri bulamayacaktir null donecektir 

10-2 
single-row subquery 
SELECT last_name, job_id, department_id 
FROM employees 
WHERE department_id= (
    SELECT department_id FROM departments WHERE department_name='Marketing')
ORDER BY job_id;
// ic sorguda departman ismi marketing olanin department idsi ile ayni olan isci tablosundaki soy ismi job id ve department id getiriyor sonra onu job id ye gore siraliyor


SELECT last_name, job_id, salary, department_id FROM employees 
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id=141)
AND department_id=(SELECT deparment_id FROM departments WHERE location_id=1500);
// once location id 1500 esit olan departman id aliyor dis sorgu idsine esitliyor ve employee idsi 141 olan job idsini aliyor dis sorgu job idsine esitliyor 
sonra isci tablosundaki bu kosullari saglayan soy ismi job id maasi ve department id buluyor 

SELECT last_name, salary FROM employees WHERE salary< (SELECT AVG(salary) FROM employees);
// alt sorgu tum iscilerin ortalama masini buluyor ve o  ortalama maasdan kucuk maas alan iscilerin isimleri ve maaslarini getiriyor sorgu 


SELECT department_id, MIN(salary) FROM employees 
GROUP BY department_id HAVING MIN(salary)>
( SELECT MIN(salary) FROM employees WHERE department_id=50);
// alt sorgu department idsi 50 olan icilerin minimum maasini getiricek sonra dis sorgudaki 
min maas alt sorgudaki min maasdan byuk ise department id ve min maasin verilerini getirecektir 

10-3
Multiple-row subquerys 
bir veya birden daha fazla veri donmesine denir 
multiple row operator = in any all 

IN Kullanimi

SELECT last_name , hire_date FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) IN 
(SELECT EXTRACT(YEAR FROM hire_date) FROM employees WHERE department_id=90);
//ic sorgu department id 90 olan icilerin extract ile ise alim yilini verir dis sorgu daki ise alim yiliyla ayni ise soy ismi ise alim yilini getirecektir 
// ayni olup olmamayi = degil in ile yaptik cunku bu coklu satir altsorgusu 

ANY Kullanimi 

SELECT last_name, hire_date FROM employees WHERE EXTRACT (YEAR FROM hire_date) < ANY 
(SELECT EXTRACT(YEAR FROM hire_date) FROM employees WHERE department_id=90);
// ic sorguda department idsi 90 olanlarin ise alim yilini buluyor dis sorguda bulunan yillar ic sorgudaki yildan kucuk ise onlarin soy ismi ve ise girme tarihini donduruyor 

ALL Kullanimi 
SELECT last_name, hire_date FROM employees WHERE EXTRACT (YEAR FROM hire_date) < ALL 
(SELECT EXTRACT(YEAR FROM hire_date) FROM employees WHERE department_id=90);
//ic sorguda department idsi 90 olan ise alim yillarini buluyor bu yillar icinden en kucugunnden kucuk bir deger yok ise dis sorguda hic bir satiri donmeyecektir veri bulunmayacaktir eger var ise soy isim ve ise alim tarihini dondurecektir 

NULL Values 
// coklu satir alt sorgusu null ama diger degerler null degil ise in ve any de deger donecektir 
ama all da deger donmeyecek null olacaktir 

SELECT last_name, employee_id FROM employees WHERE employee_id IN
(SELECT manager_id FROM employees);
//manager id bulacaktir null olan ve olmayan degerleri sonra employee id ile es olanlarin soy ismini ve employee id sini dondurecektir 

SELECT last_name, employee_id FROM employees WHERE employee_id <=ALL
(SELECT manager_id FROM employees);
// ic sorguda null deger varsa ALL kullanildigi icin dis sorgudada null donecektir 


SELECT department_id ,MIN(salary) FROM employees 
GROUP BY department_id 
HAVING MIN(salary)< ANY
(SELECT salary FROM employees WHERE department_id IN(10,20))
ORDER BY department_id; 
//alt sorgu degeri bulunuyor dis sorgudaki min degeri ic sorgu degerlerinden kucuk ise 
// department id min salarysi yaziliyor ve department idye gore siralaniyor 

pair wise multiple column 

SELECT employee_id, manager_id, department_id FROM employees WHERE (manager_id, department_id) IN 
(SELECT manager_id,department_id FROM employees WHERE employee_id IN(149,174))
AND employee_id NOT IN(149,174)
//ic sorgudaki manager id ve department id bulunuyor dis sorgudada buna esit olan department ve manager id bulunuyor ama employee idleri 149 174 olmayanlarin idleri aliniyor ve onlarin manager idsi, department idsi ve employe idsi yaziliyor 

non-pair wise multiple column 

SELECT employee_id , manager_id , department_id 
FROM employees 
WHERE manager_id IN 
(SELECT manager_id FROM employees WHERE employee_id IN(149,174))
AND department_id IN 
(SELECT department_id FROM employees WHERE employee_id IN (149,174))
AND employee_id NOT IN(149,174);
//ic sorgu degerlerrini buluyor onlari dis sorgu degerleri ile kiyasliyor ve employee idsi 149 ve 174 esit olmayanlarin idlerini cekiyor 


10-4 
Correlated subquery
ilişkili alt sorgu, üst deyim tarafından işlenen her satır için bir kez değerlendirilir 
satir satir ilerleme kullanir 

SELECT o.first_name, 0.last_name, 0.salary FROM employees o 
WHERE employees o WHERE o.salary> 
(SELECT AVG(i.salary) FROM employees i WHERE i.department_id=o.department_id);
// iliskili sorgu olmasini surdan anliyoruz dis sorgudaki employees o isimlendirmesini kullandi 
// iliskili sorguda bulunan deger dis sorguda degerlendirilip cikti verecektir ona gire 

EXISTS AND NOT EXISTS 
exists = alt sorguda eslesen bir degerin dogru oldugunu test eder 
not exists = als sorguda eselesen bir degerin dogru olmadigini test eder 


SELECT last_name AS "Not a Manager"
FROM employees e 
WHERE NOT EXISTS 
(SELECT * FROM employees m WHERE m.manager_id=e.employee_id);
// ic sorgudaki m.manager id ve e.employee idsi es olanlarin disinda kalanlar manager degildir 


WITH managers AS (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL)
SELECT last_name AS "Not a manager" FROM employees WHERE employee_id NOT IN (SELECT * FROM managers);
//once with sorgusunda manageri id null olmayanlarin tekli manager idlerini donuyor sonra bu managers olarak isimlendiriyor 
//select sorgusunda bu managers tablosunun hepsini donduruyor ve employee id ile es olmayanlar manager olmayanlar oluyor bunlarin soy isimlerini cektir 
