12-1
Insert Statement 
kopya tablo yaratmak 
CREATE TABLE copy_tablenam AS (SELECT *FROM tablename);

CREATE TABLE copy_employees AS (SELECT * FROM employees);
CREATE TABLE copy_departments AS (SELECT * FROM departments);
//alt sorgu ile tum tablolari secip bir kopyasini yaratacaktir 

//kopyaladigin tablonun tablolarina bu sekilde ulasabilirsin 
DESCRIBE copy_employees;
SELECT*FROM copy_employees;
DESCRIBE copy_departments;
SELECT * FROM copy_departments;

insert statement 
tabloya yeni satir eklemek icin kullanilir 
eklenecek tablo verileri verildigi sirada eklenir 
numaralar tek tirnak icine alinmaz 
varcharlar tek tirnak icine alinir 

INSERT INTO copy_departments 
(department_id, department_name, manager_id, location_id)
VALUES (200,'Human Resources',205,1500);
//sutun isimlerini verip degerleri yazip eklemede yapabiliriz 

INSERT INTO copy_departments VALUES (210,'Estate Management',102,1700);
//seklindede ekleme yapabilirz 

tablolardaki sutunlardaki degerlerin ifade ettikleri anlamlar 
precision= toplam basamak sayisidir 
scale= ondalık basamağın sağındaki basamak sayısıdır 

ornegin precision=8 ve scale=2 olan bir sayi 
max degeri = 999999.99 seklindedir 

null olabilecek bir deger eklerken 
'' koymamiz yeterlidir 
INSERT INTO copy_employees 
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES 
(302, 'Grigorz','Polanski','gpolanski','','15-Jun-2017','IT_PROG',4200);
//burada phone number null deger aldi ve null deger eklniyor tabloya 

insert special value 
INSERT INTO copy_employees 
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary)
VALUES 
(304, 'Test', USER,'t_user', 4159903234, SYSDATE, 'ST_CLERK',2500);
//burada sysdate veriyi ekledigim saateki degeri ekleyecektir bunun gibi ozel veri eklemeleri yapabilirim 

onsert specific date value 
default format modal date = DD-Mon-YYYY
date format default time of midnight = 00.00.00

//eger defaul olmayan fomatta ekleme yapmak istersek 
TO_DATE fonksiyonunu kullanmaliyiz
INSERT INTO copy_employees 
(employee_id, first_name, last_name, email,phone_number,hire_date,job_id,salary)
VALUES
(301,'Katie','Hernandez','Khernandez', '8586667641', TO_DATE('Jult 8,2017','Month fmdd,YYYY'),'MK_REP',4200);
//default formatta eklemedigimiz icin onu to_date ile default formata cevirip ekleme islemini gerceklestirdik 

INSERT INTO copy_employees 
(employee_id, first_name, last_name, email,phone_number,hire_date,job_id,salary)
VALUES 
(303,'Angelina','Wright','awright','4159982010',TO_DATE('July 10,2017 17:20','Month fmdd,YYYY HH24:MI'), 'MK_REP',3600)
//istedigimiz veriyi ekledik 

//yukaridaki veriyi sagirma komutunu yazalim 
SELECT first_name , last_name, TO_CHAR(hire_date,'dd-Mon-YYYY HH24:MI') As "Date and Time"
FROM copy_employees
WHERE employee_id=303;

USING A SUBQUERY TO COPY ROWS 
INSERT INTO sales_reps(id,name,salary,commission_pct)
SELECT employee_id, last_name, salary, commission_pct 
FROM employees
WHERE job_id LIKE '%REP%';
//alt sorgudan cektigi veriyi sales_reps olarak kayit edecektir 

INSERT INTO sales_reps SELECT* FROM employees;
// alt sorguda sectigi tum tablolar sales_rep olarak kaydedecektir 


12-2 
UPDATE Statement 
UPDATE copy_employees 
SET phone_number='123456'
WHERE employee_id=303;
// isci i d303 olan copy_employees tablosundaki phone_number guncelleyecektir 

UPDATE copy_employees
SET phone_number='654321', last_name='Derya'
WHERE employee_id>=303;
//  copy employees tablosundaki isci idsi 303 den buyuk  olanlarin numarasi ve soy ismi degisecektir 
// eger where clause kullanmazsan tum satirlarin guncellenir 

UPDATE copy_employees 
SET salary =(SELECT salary FROM copy_employees WHERE employee_id=100)
WHERE employee_id=101;
// idsi 101 olani bul alt sorgudaki id 100 olan kisinin masina esitle 101 idli kisinin masini ve bunu yeni maas olarak guncelle 101 idli employeede 

Update two column with teo subquery statement 
UPDATE copy_employees 
SET salary=(SELECT salary FROM copy_employees WHERE employee_id=205),
job_if=(SELECT job_id FROM copy_employees WHERE employee_id=205)
WHERE employee_id=206;
//ic sorgulardaki isci idsi 205 olanlarin maas ve job id degerlerini alir 206 idli employe idnin isci ve maas degerine esitlenerek guncellenir 

ALTER TABLE copy_employees 
ADD (department_name varchar2(30) NOT NULL);

UPDATE copy_employees e 
SET e.department_name=
(SELECT d.department_name FROM departments d WHERE e.department_id=d.department_id);
//correlated sub query getirdigi deger ile guncelenecek department_name tablosu 

DELETE Statement 

DELETE FROM copy_employees 
WHERE employee_id=303; 
// employee idsi 303 olan satiri silecektir 

DELETE FROM copy_employees 
WHERE department_id=
(SELECT department_id FROM departments WHERE department_name='Shipping');
// alt sorguda dapartman ismi shipping olan idlere es olan tum satirlari silecektir 

DELETE FROM copy_employees e 
WHERE e.manager_id IN (SELECT d.manager_id FROM employees d HAVING count (d.department_id)<2 GROUP BY d.manager_id);
//coklu alt sorgu yaparak manager id ye gore birlestirme yapar 
tekrarsiz department id sayisi 2 den az ise iscilerdeki manager id getirir ve o ide denk olan manager idyi employees tablosundan siler 

FOR UPDATE Clause 

SELECT e.employee_id, e.salary, d.department_name FROM 
employees e JOIN departments d USING (department_id) 
WHERE job_id='ST_CLERK' AND location_id=1500 
FOR UPDATE 
ORDER BY e.employee_id;
//tum tablolari kilitleyecektir 
//commit ve rollback vererek komutu kilitten cikarabilirler 

12-3 
//create table 
CREATE TABLE my_employees(
    hire_date DATE DEFAULT SYSDATE,
    first_name VARCHAR2(15),
    last_name VARCHAR2(15));
// tablolara degerle eklendiginde acik bir hire_date kalirsa eger ona sysdate eklenecektir 


//insert statement 
INSERT INTO my_employees (hire_date, first_name, last_name)
VALUES 
(DEFAULT, 'Angelina', 'Wright');
// defaultun acik kullanimi 

INSERT INTO my_employees 
(first_name, last_name)
VALUES 
('Angelina','Wright');
//ortuk sekilde defaul gosterimi 


//update statement 
UPDATE my_employees 
SET hire_date=DEFAULT 
WHERE last_name='Wright';

//MERGE 
iki gorevi ayni anda gerceklestirir 
ayni anda insert and update yapar ve takma adlar merge deyimi ile kullanilabilir


MERGE INTO destination_table USING source_table ON matching-condition 
WHEN MATCHED THEN UPDATE 
SET .....
WHEN NOT MATCHED THEN INSERT 
VALUES(.....);

MERGE INTO copy_emp c USING employees e 
ON(c.employee_id=e.employee_id)
WHEN MATCHED THEN UPDATE 
SET 
c.last_name=e.last_name,
c.department_id=e.department_id
WHEN NOT MATCHED THEN INSERT 
VALUES(e.employee_id,e.last_name,e.department_id);
//merge example idleri esit olan copy_emp ve employees son isimleri ve idleri birbirine esitlemek icin guncellenir 
ve bunlari eklemek icin asagidaki degerler girilir 


//Multi-Table Inserts Syntax 
INSEERT ALL INTO clause VALUES clause SUBQUERY 


INSERT ALL 
    INTO my_employees
        VALUES(hire_date,first_name,last_name)
    INTO copy_my_employees 
        VALUES(hire_date,first_name,last_name)
SELECT hire_date, first_name , last_name FROM employees; 

INSERT ALL
WHEN call format IN ('tlk', 'txt', 'pic') THEN
INTO all calls
VALUES (caller id, call timestamp, call duration, call format)
WHEN call format IN ('tlk', 'txt') THEN
INTO police record calls
VALUES (caller id, call timestamp, recipient caller)
WHEN call duration < 50 AND call type = 'tlk' THEN
INTO short calls
VALUES (caller id, call timestamp, call duration)
WHEN call duration > = 50 AND call type = 'tlk' THEN
INTO long calls
VALUES (caller id, call timestamp, call duration)
SELECT caller id, call timestamp, call duration, call format,
recipient caller
FROM calls
WHERE TRUNC (call timestamp ) = TRUNC (SYSDATE) ;