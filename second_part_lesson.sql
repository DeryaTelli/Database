//DP-2-1 Pdf

DESCRIBE <table_name>; // (DESC) de kullanilir verilen tablo adinin tum bilgilerini dondurur
   // DESC departments; 

//Concatenation Operator (Birlestirme Operatoru "||")
   SELECT department_id || department_name FROM departments; // departments tablosundaki id ve isimleri birlestirecektir 
   SELECT department_id || ' ' || department_name FROM departments; // "|| ' '||  arasina koydugum tek tirnak isareti bosluk birakacaktir "
   SELECT department_id ||' '|| department_name AS "Department Info" FROM departments; // department info diye aliases verdik takma ad ve id ile isimleri birlestirdik 
    SELECT first_name || ' '|| last_name AS "Employee Name" FROM employees;

//Concatenation and Literal Values (Birlestirme ve Gercek Degerler)
    SELECT last_name || ' has a monthly salary of '|| salary || ' dollars' AS "Pay" FROM employees; 
// birlestirme islemi yapacaktir ama aralarina literal value'lar eklenmistir (has a monthlt salary of) bir literal value ornegidir 
    SELECT last_name || ' has a '|| 1 || 'year salary of '|| salary*12 || 'dollars.' AS Pay FROM employees;

// Using Distinct to Eliminate Duplicate (tekralanan) Rows
    SELECT department_id FROM employees; // bu satirda tekrarlanan veriler var 
    SELECT DISTINCT department_id FROM employees; // tekrarlanan verileri ortadan kalidiricaktir

//DP-2-2
// not = isimlendirmeyi where kosulunda kullanamazsin
    SELECT employee_id , first_name , last_name FROM employees; // employee tablosundan id isim soy isim getiricek 
    SELECT employee_id , first_name , last_name FROM employees WHERE employee_id=101; // employee_id 101 olan satiri getircektir artik yukarida tum bilgileri getirirken burada where ile sinrladm
    SELECT employee_id , last_name , department_id FROM employees WHERE department_id=90; 

// Comparison Operators in the where clause 
not equal to = '<>' '!=' '^='

//Character and Date Strings int the where clause 
'' icinde olmali 
SELECT first_name , last_name FROM employees WHERE last_name='Taylor';
WHERE last_name ='jones'; //bu hic bir sey dondurmeyecektir 
// WHERE hire_date< '01-Jan-2000'; // tum tarihler bu sekilde yazilacaktir aylar 3 harften olusacaktir yani 
SELECT last_name , salary FROM employees WHERE salary <= 3000; // 3000 esit ve kucuk olan maasli iscilerin soy ismini ve maasini getirecektir 

//DP-2-3
//Comparison Operators 
-BETWEEn .... AND
    SELECT last_name , salary FROM employees WHERE salary BETWEEN 9000 and 11000 ; // ' 9000 ve 11000 maas alanlarinda verisi cekilir'9000 ve 11000 arasinda  maas alanlarin soy ismini ve maasini dondurecektir 
    // WHERE salary>=9000 AND salary<=11000; // yukaridaki ifadeyle ayni anlama gelmektedir
-IN 
    // membership condition olarakta bilinir
    SELECT city , state_province , country_id FROM locations WHERE country_id IN('UK', 'CA'); // country id icinde UK ve CA varmi diye kontrol edip varsa onun verilerini dondurecektir
    // WHERE country_id='UK' OR country_id='CA'; // yukaridaki ifadeyle ayni anlama gelmektedir
-LIKE
    '%' 0 veya daha fazla karakterden olusan bir diziyi temisil eder
    '_' tek karakteri temsil eder 
    SELECT last_name FROM employees WHERE last_name LIKE '_o%';
    // ('_o%') bu ifade sunu temsil eder _ cizgi bir karakter demek bu karakterden sonra o harfi gelecek % ise o harfinden sonraki carakter dizisidir 
    // bu ozellik gibi olan iscilerin soyismini getirecektir bu sorgu 
    SELECT last_name , job_id FROM employees WHERE job_id LIKE '%_R%';

//IS NULL , IS NOT NULL
    SELECT last_name, manager_id FROM employees WHERE manager_id IS NULL; // manager_id degeri null olanlarin soy ismini ve manager
    // manager id null olan kisinin soy ismini maneger idsini dondurecektir 
    SELECT last_name, manager_id FROM employees WHERE manager_id IS NOT NULL; // manager_id degeri null degil olan
    // manager id null olmayan kisinin soy ismini manager idsini dondurecektir
