//5-1

//Conversion Functions

// VARCHAR2 
// sayılar, tire işaretleri ve özel karakterler dahil olmak uzere degisken uzunluktaki veriler icin kullanilir 

//CHAR 
// sayilar , tire isaterleti ve ozel karakterler dahil olmak uzere sabit uzunluktaki metin ve karakter veriler icin kullanilir 

//NUMBER 
//degisken uzunlukdaki sayi birimlerini saklamak icin kullanilir para birimi bir sayi veri turu olarak saklanir 

//DATE 
//Tarih ve zaman degerleri icin kullanilir ("DD-Mon-YYYY")

//Data Type Conversion 
// varchar2 or char => number 
// varchar2 or char => date 

//Implicit data type Conversion
// number => varchar2 or 
//date => varchar2
//donusmesi Kapali veri donusturme turudur

//Explicit data type Conversion
//number=>char 
//date=>char 
//donusmesi Acik veri donusturme turudur 

//Date conversion to Character data

//TO_CHAR (date column name ,'format model you specify')

"fm" kullanilir bosluklari ve sifirlari silmek icin 
YYYY = yil numarasi 
YEAR = yili harflerle yazar 
MM = 2 dijitli ay degeri 
MONTH = ay ismi 
MON = 3 harfli kisaltma ay degeri 
DY = haftanin gunun 3 harf ile kisaltilmasi 
DAY= haftanin gunun ismi
DD = ayin gununun numarali hali 
HH=hours
MI=minutes
SS=seconds
DDspth=FOURTEENTH
Ddspth=Fourteenth
ddspth=fourteenth
DDD or DD or D = yilin gunu , ayin gunu veya haftanin gunu 
HH24:MI:SS AM = 15:45:32 PM
DD "of" MONTH= 12 of October

//SELECT TO_CHAR(hire_date,'Month dd YYYY') FROM employees;
//ise girme tarihlerini ay gun yil olarak gosteriyor (June 07, 1994)
//SELECT TO_CHAR(hire_date,'fmMonth dd YYYY') FROM employees ; 
// isci sinifindan ise girme tarihlerini ay gun yil olarak getirecekir fm numaradaki 0lari silecektir (June 7 1994)
//SELECT TO_CHAR(hire_date,'gmMonth ddth, YYYY') FROM employees;
// isci sinifindan ise girme tarihlerini ay gunleri th st seklinde sireli ve yillari getirecektir (June 7th 1994) 
//SELECT TO_CHAR(HIRE_DATE,'fmDay ddth Mon YYYY') FROM  employees;
// isci sinifindan ise girme tarihlerini gun ismi gun rakami ay ve yili getirecektir (Tuesday 7th Jun 1994)
//SELECT TO_CHAR(hire_date,'fmDAY ddthsp Mon YYYY') FROM employees;
// isci sinifindan ise girme tarihlerini gun ismi gun rakamini yaz ayi 3 isimli ve yili getirecektir (Tuesday seventh Jun 1994)
//SELECT TO_CHAR(hire_date,'fmDAY ddthsp "of" Month Year') FROM employees;
//isci sinifindan ise girme tarihlerin su sekilde getiricek (Tuesday seventh of June Nineteen Ninety-Four)
//SELECT TO_CHAR(hire_date,'hh:mm') FROM dual; 
//saat ve dakikayi hangi zaman diliminde ise  getirecektir (11.03)
//SELECT TO_CHAR(hire_date,'hh:mm:ss pm')FROM dual;
//saat dakika ve saniyeyi getirecektir (11.03.08 am)

//Number Conversion to Character Data (VARCHAR2)

//TO_CHAR(number column name,'formad model')
9 = sayilarin nasil durmasi gerektigini gosterir bicim modelinigosterir yani
0= 0 gosterir 
$= dolar simgesi 
L=degisken para birimi simgeis 
.= belirlenen konuma ondalik koyma 
,=ondalik sayilari gosterirken kullanilir 
MI= negatif sayilari gosterirken kullanilir sayinin sagin konulur 
PR= negatif sayilari paranteze alir 
EEEE=bilimsel gosterimde kullanilir 
V= verilen numarayi 10n kez carpma demek 
B= 0 degerlerini 0 olarak degil bos gosterir 

//SELECT TO_CHAR(3000,'$99999.99') FROM dual;
//yukaridaki ifadeyi karsilayan sayiyi dondurur 9 sayi yerini tutar kac basamakli ise ona gore yerlestirilir  $3000.00 cikti verir 
//SELECT TO_CHAR(4500,'99,999') FROM dual;
// 4,500 olarak getirir 
SELECT TO_CHAR(9000,'99,999.99') FROM dual;
//9,000.00 olarak getirir 
//SELECT TO_CHAR(4422,'0009999') FROM dual;
//0004422 olarak getirir 

//Charachter Conversion to Number 

//TO_NUMBER(charachter string,'format model')

//SELECT TO_NUMBER('5,320', '9,999') AS "NUMBER" FROM dual;
//5320 cikti
//SELECT LAST_NAME , TO_NUMBER(BONUS, '9999') FROM EMPLOYEES WHERE DEPARTMENT_ID=80;
//isci sinifindan departman idsi 80 olalardan bonuslari 4 rakamdan olusanlari getirecektir 

//Character Conversion to Date 

//TO_DATE('character string', 'format model')
fx= karakter degiskeni ile format modeli icin tam eslesmeyi belirtir 
//SELECT TO_DATE('Sep 07,1965','fxMon dd,YYYY') AS "DATE" FROM dual;
// verilen tarih degiskeni nasil yazildiysa onun fx modelide ayni olmali 
//cikti 07-Sep-1965
//SELECT TO_DATE('July312004','fxMonthDDYYYY') AS "DATE" FROM dual;
//cikti 31-Jul-2004
//SELECT TO_DATE('June 19, 1990','fxMonth dd, YYYY') AS "DATE" FROM dual;
//cikti 19-Jun-1990

//YY=Cureent Year 
SELECT TO_DATE('27-Oct-95','DD-Mon-YY') AS "DATE" FROM dual;
//cikti 27-Oct-2095 YY 20 ci yillar anlamina gelir 

//RR= 19 year 
SELECT TO_DATE('27-Oct-95','DD-Mon-RR') AS "DATE" FROM dual;
//cikti 27-Oct-1995 RR 19 yillar anlamina geliyor 

//SAYFA 33 ANLASILMADI!!!


SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YY') AS "hire_date" FROM employees WHERE hire_date< TO_DATE('01-Jan-90','DD-Mon-YY');
//burada ise alma karakterini tarihe ceviriyorum ve usteki de ise alma karakterilerini tarihe ceviriyor 2090 dan once olanlari gosterecektir 


//5-2

//How Functions are Evaluated

//SELECT TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date,6),'FRIDAY'),'fmDay, Month ddth, YYYY')AS "Next Evaluation" FROM employees WHERE employee_id=100;
Step1: 6 ay eklenecek ise alma gunune 
Step2: adim birde yapilan islemi takip eden ilk cuma belirlenecek 
Step3: adim 2 uygulanan formatta okunacak ve gorunecek tarih ve onu gun ay gun numarasi ve yill seklinde okuyacaktir 
//cikti Friday, December 18th, 1987

//NVL Functions

//NVL(expression 1 value that may contain a null , expression 2 value to substitute(yedek) for null)

//sayfa 11 de sorun olustu 
//SELECT last_name, NVL(commission_pct, 0 ) FROM employees WHERE department_id IN(80,90);
// NVL(commission_pct, 0 ) sayesinde null olan degerlere 0 yazicaktir departman id 80 ve 90 olan icilerin isimlerini ve comission pct sini getirecektir 
//SELECT NVL(date_of_independence, 'No date' ) FROM wf_countries;
//wf-countriesden tarihleri alir ama null olan tarihlerede No date yazar 
//SELECT last_name, NVL(commission_pct, 0)*250 AS "Commission" FROM employees WHERE department_id IN(80,90);
// commision_pct null var ise onlari 0 yapti sonra hesaplama yapti nvl fonsiyon sayesinde 

//NVL2

//NVL2(expression 1 value that may contain a null , expression 2 value to return if expression 1 is not null, expression 3 value to replace if expression 1 is null)

//SELECT last_name , salary , NVL2(commission_pct, salary +(salary*commission_pct),salary) AS income FROM employees WHERE department_id IN(80,90);
//NVL2 fonksiyonu sayesinde eger commission_pct degeri null ise 2 yedek deger 2 yedek degerde null ise 3 yedek deger income degeri olarak getirildi 

//NULLIF

//NULLIF(expression 1 , expression 2 ) 
//iki ifadede esit ise null donecek esit degil ise expression 1 donecektir 

//SELECT first_name, LENGTH(first_name) AS "Length FN", last_name, LENGTH(last_name) AS "Length LN", NULLIF(LENGTH(first_name),LENGTH(last_name)) AS "Compare Them" FROM employees;
// employee sinifindan first name ve last name degerlerinin uzunlugunu alicak ve NULLIF fonksiyonu ile bu iki uzunlugu kiyasliyacaktir eger esit ise bu iki uzunluk degeri null donucek eger esit degil ise ifade 1 yani first name uzunlugunu alacaktir 

//COSLESCE

//COALESCE(expression1,expression2,expression3,....expression n)
//eger ilk ifade null ise fonksiyon null olmayan bir ifade bulana kadar satirda devam edecektir 
//eger ilk ifade null degil ise fonksiyon ilk ifadeyi dondurecektir ve fonksiyonu durdurucaktir 

//SELECT last_name, COALESCE(commission_pct, salary, 10 ) AS "Comm" FROM employees ORDER BY commission_pct;
//isci sinifindan soy ismi getirecek ve coalesce fonksiyonu comission_pct null degil ise onun degerii getirecek ama eger null ise  salary degerini getirecek salary degeride null ise 10 yazisini getiricektir null ifadelere 

//5-3

//Conditional Expressions
//Note: case is ANSI/ISO 99 SQL 99 compliant statement 
//Note: decode is oracle proprietary statement

//CASE

//CASE expr WHEN comparison_expr1 THEN return_expr1 [WHEN comparison_expr2 THEN return_expr2 WHEN comparison_exprn THEN return_exprn ELSE else_expr] END 
//SELECT last_name, CASE department_id 
WHEN 90 THEN 'Management'
WHEN 80 THEN 'Sales'
WHEN 60 THEN 'It'
ELSE 'Other dept.'
END AS "Department"
FROM employees;
// isci sinifindan soy ismi ve case fonksiyonu ile departman idsi 90 olanlar management yazicak 
80 olursa eger sales yazicak 60 olursa it yazicak eger hic biri olmaz ise other dep. yazacaktir 


//DECODE

//DECODE(column1 |expression , search1 , result1 [,search2 ,result2,....,][,default])
// eger default deger yok ise ve arastirma degerleri hic bir deger ile eslesmiyor ise nul donecektir 

//SELECT last_name,
DECODE(department_id,
90,'Management',
80,'Sales',
60,'It',
'Other dept.')
AS "Department"
FROM employees;
// case fonksiyonu ile ayni seyi dondurecektir ama farkli yazma modeli kullandik
