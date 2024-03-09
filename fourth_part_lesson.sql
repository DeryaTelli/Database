//4-1

//Dual Table 
//has one row and one column 

SELECT (319/29)+12 FROM DUAL; 
// sutunda  (319/29)+12 gozukecektir satirsa ise cikti gozukecektir 23 diye 

//Charachter Functions 
//1-Case Manipulation Functions (Lower, Upper ,Initcap)
//2-Character-Manipulation Functions (Concat,Substr, Length,Instr,Lpas|Rpad,Trim,Replace)

//Lower(column|expression)

SELECT last_name FROM employees WHERE LOWER(last_name)='abel';
// ifadeleri kucuk ifadelere cevirecektir 

//Upper(column|expression)

SELECT last_name FROM employees WHERE UPPER(last_name)='ABEL';
//ifadeleri buyuk harfe cevirecektir 
//Initcap(column|expression)
SELECT last_name FROM employees WHERE INITCAP(last_name)='Abel';
// ifadelerini ilk harfini buyuk harf tapacaktir digerleri kucuk kalacaktir 

//Concat(take 2 charachter string arguments)

SELECT CONCAT('Hello','World') FROM DUAL ; 
// hello world ifadesini birlesik sekilde yazacaktir output(HelloWorld)
SELECT CONCAT(first_name,last_name) FROM employees;
// employees tablosundaki ilk ve son isimleri birlestirecektir 

//SUBSTR(charachter String , starting position, lenght)

SELECT SUBSTR('HelloWorld',1,5) FROM DUAL;
// birinci harften itibaren 5 harf uzunlugunda aliacaktir helloworlden output(Hello) olacaktir 
SELECT SUBSTR('HelloWorld',6) FROM DUAL;
// 6 ci harften baslayacaktir nekadar haf almamiz gerektiginin bilgisi yani uzunluk verilmedigi icin kelime sonuna kadar gidilecektir output(World)
SELECT SUBSTR(last_name,1,3) FROM employees; 
// iscilerin son isimlerinden 1ci harften baslayip 3 karakter uzunlugunda olacak sekilde cikti verecektir 

//LENGTH(charachter String)

SELECT LENGTH('HelloWorld')From DUAL;
// helloworld uzunlugunu cikti olarak verecektir output(10)
SELECT LENGTH(last_name)FROM employees;
//iscilerin son isimlerinin uzunlugunu cikti olarak verecektir 

//INSTR(charachter String,substring) buyuk kucuk harf duyarli

SELECT INSTR('HelloWorld','W') FROM DUAL;
// helloworld icindeki w harfinin buludugu indexi verecektir output(6)
SELECT  last_name ,INSTR(last_name,'a') FROM employees;
// iscilerin son isimlerindeki a harfinin bulundugu indexi verecektir

//LPAD(character string , total number of character , the charachter to pad with)

SELECT LPAD('HelloWorld',15,'-') FROM DUAL;
//helloworld ifadeisini 15 karakter uzunluguna cikarmak icin - ekleyecektir sol tarafa 
SELECT LPAD(last_name,10,''*) FROM employees;
//last name ifadelerini 10 karakter uzunluguna cikarmak icin * ekleyecekyir sol taraflarina 

//RPAD(character string,total number of charecter, the charachter to pad with)

SELECT RPAD('HelloWorld',15,'-') FROM DUAL;
//helloworld ifadesini15 karaktere uzunluguna cikarmak icin sag tarafina - ekleyecektir 
SELECT RPAD(last_name,10,'*') FROM employees;
// last name ifadelerini 10 karaktere uzunluguna cikarmak icin sag tarafina * ekleyecektir 

//TRIM
//kelimenin basindan veya sonundan yada her ikisinden karakter ozel karakterleri siler 

SELECT TRIM(LEADING 'a' FROM 'abcba') FROM DUAL;
// abcba ifadesinden bastaki a harfini silecektir 
SELECT TRIM(TRAILING 'a' FROM 'abcba') FROM DUAL;
//abcba ifadesinden sondaki a harfini silecektir 
SELECT TRIM(BOTH 'a' FROM 'abcba') FROM DUAL;
//abcba ifadesinden bastaki ve sondaki a harfini silecektir 


//REPLACE(string1 , string_to_replace,[replacement_string])

SELECT REPLACE('JACK and JUE', 'J','BL') FROM DUAL;
// jacj ve jue ifadelerindeki j ifadesini cikartip yerine bl harfini ekleyecektir output(BLACK AND BLUE)olacaktir 
SELECT REPLACE('JACK and JUE','J')FROM DUAL;
//jack ve jue ifadelerindeki j harfini cikarticaktir output(ACK and UE)
SELECT REPLACE(last_name,'a','*') FROM employees;
//iscilerin son isimlerindeki a harfini cikarticaktir ve onun yerine * ekleyecektir 

//using column aliases with functions

SELECT LOWER(last_name)||'-'||LOWER(SUBSTR(first_name,1,1)) AS "User Name"FROM employees;
// iscilerni son ismini kucuk harfle alicaktir sonra - ekleyecektir ve ilk isminden 1 karakterini 1 uzunlukta alacak ve user name ismi ile sutuna ekleyecektir 
SELECT LOWER(last_name)|| '-'|| LOWER(SUBSTR(first_name,1,1))FROM f_staffs;
//f_staffs daki son isimi kucuk harflerle yazili sekilde alir araya - koyar sonra ilk isimlerindeki 1ci harfi 1 harf uzunlugu seklinde alir ve ekler ciktiya 

//Substitution Variables 
SELECT* FROM employees WHERE last_name= :l_name;
// bu sorguyu calistirigimizda pop up seklinde acilacaktir 

//4-2

//Number Functions 
//1-ROUND
//2-TRUNC
//3-MOD

//ROUND(column| expression, decimal places)
ROUND(45.926) 46 
ROUND(45.926) 46
ROUND(45.926,2) 45.93
ROUND(45.926,-1) 50

//TRUNC(column|expression, decimal places)
TRUNC(45.926,2) 45.92
TRUNC(45.926) 45
TRUNC(45.926,0) 45

//MOD ??? calismayan sorgu 
SELECT country_name, MOD(airports,2) AS "MOD DEMO" FROM wf_countries;


//4-3 

//SYSDATE 

SELECT SYSDATE FROM DUAL;
//suanki zamani gosterecektir
SELECT last_name , hire_date+60 FROM employees; 
// iscilerin giris tarihine 60 gun eklenecektir 
SELECT last_name (SYSDATE-hire_date)/7 FROM employees;
//Guncel tarihten ise giris tarihini cikartip 7 boluyor 
SELECT employee_id,(end_date-start_date)/365 AS "Tenure in last job" FROM job_history;

//DATE Functions

//1-MONTHS_BETWEEN

SELECT last_name, hire_date FROM employees WHERE MONTHS_BETWEEN(SYSDATE,hire_date)>240;
// iki takvim arasindaki degerleri alir bu degerler 240 gun dan buyuk olanlari getirir 

//2-ADD_MONTHS

SELECT ADD_MONTHS(SYSDATE,12) AS"Next Year" FROM DUAL;
//Guncel tarihe 12 ay ekliyor 

//3-NEXT_DAY
SELECT NEXT_DAY(SYSDATE,'Saturday') AS"Next Saturday" FROM DUAL;
//guncel tarihin yanindaki gune gore gelecekte o gunun hangi tarih oldugunu soyluyor 

//4-LAST_DAY
SELECT LAST_DAY(SYSDATE) AS "End of the Month" FROM DUAL;
// Guncel tarihe gore ayin son gununu söylüyor bu ifade 

//5-ROUND

SELECT hire_date, ROUND(hire_date,'Month') FROM employees WHERE department_id=50; 
//departman idsi 50 olan iscilerin giris tarihlerini ay bazinda yuvarlayacak
SELECT hire_date Round(hire_date,'Year') FROM employees WHERE department_id=50;
// departman idsi 50 olan iscilerin giris tarihlerini yil bazinda yuvarlayacakir 

//6-TRUNC
SELECT hire_date TRUNC(hire_date,'Month') FROM employees WHERE department_id=50;
// departman idsi 50 olan iscilerin girdileri iş tarihi ayini o ayin 1 ci gunu girmis gibi gostercektir 
// ornegin 16-nov-1999 -> 01-nov-1999
SELECT hire_date TRUNC(hire_date,'Year') FROM employees WHERE department_id=50;
// departman idsi 50 olan iscileri girdikleri yilin bas ayinda girmis gibi gosterecektir 
ornegin 16-nov-1999  -> 01-jan-1999

EXAMPLE;
SELECT employee_id, hire_date, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS TENURE, ADD_MONTHS (hire_date,6) AS REVIEW, NEXT_DAY(hire_date,'FRIDAY'), LAST_DAY(hire_DATE) FROM employees WHERE MONTHS_BETWEEN(SYSDATE, hire_date)>36;



