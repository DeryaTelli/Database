//AND Operator 

SELECT last_name, department_id , salary FROM employees WHERE department_id> 50 AND salary>12000; 
// bu son ismi ve departmant idsi 50 den buyuk salarysi 12000 den buyuk olan employeeleri getiricektir 
SELECT last_name, hire_date , job_id FROM employees WHERE hire_date>'01-Jan-1998' AND job_id LIKE 'SA%';
// bu son ismi ve ise alim tarih 1 ocak 1998 olan ve  job idisi sa ile baslayip sonuna herkangi bir kelime olan epmloyeeleri getiricektir 

//OR Operator

SELECT department_name,manager_id , location_id FROM departments WHERE location_id=2500 OR manager_id=124;
// bu departman ismini manger idsi 124 veya lokasyon idsi 2500 olan departmanlari getirecektir ikisinden birisi olucaktir yada her ikiside ayni olabilir 

//NOT Operator

SELECT department_name, location_id FROM departments WHERE location_id NOT IN(1700,1800);
//departman ismini ve lokasyon idsi 1700 ve 1800 olmayan departmanlari getirecektir 

//Precedence Rules

//order rule 
//1- Arithmetic (*,/,+,-)
//2-Concatenation(||)
//3-Comparison (<,>,=,<=,>=)
//4-IS(NOT)NULL, LIKE,(NOT)IN
//5-(NOT)Between 
//6-NOT 
//7-AND
//8-OR

//ogrenildi parantez var gibi dusunuceksin burada 
?? anlasilmadi hocaya sor ??
SELECT last_name|| ' '||salary*1.05 AS "Employee Raise", department_id, first_name FROM employees WHERE (department_id IN(50,80) AND first_name LIKE 'C%') OR last_name LIKE '%s%';
?? anlasilmadi hocaya sor ??
SELECT last_name||' '||salary*1.05 AS "Employee Raise", department_id , first_name FROM employees WHERE department_id (IN(50,80) OR first_name LIKE 'C%') AND last_name LIKE '%s%';

SELECT last_name||' '||salary*1.05 AS "Employee Raise", department_id, first_name FROM employees 
WHERE (department_id IN(50,80) OR first_name LIKE 'C%') AND last_name LIKE '%s%';
// ilk parentez icinden or mantik ifadesine gore herhangi birini secicektir ama and den sonra kullanilan soy isim icin hepsinin icinde s harfi olmak zorundadir buna uyan elamanlari getirecektir 


//Order by Clause 

SELECt last_name, hire_date FROM emploees ORDER BY hire_data;
// ise alim tarihini  artan sekilde yani kucukten buyuge seklinde siralayacaktir 
SELECT last_name , hire_date FROM employees ORDER BY hire_data DESC;
//ise alim tarihini DESC sayesinde buyukten kucuge dogru siralayacaktir 
SELECT last_name AS "Date Started" FROM employees ORDER BY "Date Started";
// sutunu tekrar isimlendirdim ve bu isme ait olan yerin siralamasini kucukten buyuge seklinde yapti 
SELECT employee_id , first_name FROM employee_id<105 ORDER BY first_name;
// employe idsi 105 den kucuk olanlari getiricek ve ilk isimlerinin harflerine gore siralama yapacaktir 
SELECT department_id last_name FROM employees WHERE department_id<=50 ORDER BY department_id, last_name;
// departman idsi 50ye esit ve kucul olanlari getirecektir onlari kucukten buyuge dogru siralayacaktir ve getirilen soy isimleride harfe gore siralayacaktir
SELECT department_id , last_name FROM employees WHERE department_id<=50 ORDER BY department_id DESC, last_name;
//departman idsini buyukten kucuge siralar soy ismi ise harfe gore siralayacaktir 
//eger ters sira istersen o sutun isminden sonra belirtmelisn 

//Functions
//Oracle has two distinct types of Functions
//1-Single-row Functions (Character,General , Number , Conversion , Date )
//2-Multi-row Functions












