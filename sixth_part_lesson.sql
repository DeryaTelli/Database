//6-1
//ANSI , SQL 

//NATURAL JOIN
//doğal bir birleştirme, aynı ada sahip iki tablodaki tüm sütunları temel alır ve eşleşen tüm sütunlarda eşit değerlere sahip iki tablodan satırları seçer

//note:doğal birleştirmede, tabloların aynı adlara ancak farklı veri türlerine sahip sütunları varsa, birleştirme bir hataya neden olur 

//SELECT first_name , last_name ,job_id , job_title FROM employees NATURAL JOIN jobs WHERE department_id>80;
//isciler sinifina dogal katilim ile ileride ekledik ve departman idsi 80 den buyuk olan ilk ismi soy ismi is idsi ce is unvanini getirecektir

//SELECT department_name , city FROM departments NATURAL JOIN locations;
// departman ve lokasyon tablolarinin her ikisindede birlestirmek icin onlari location_id sutunu vardir 

//CROS JOIN
//bir tablodaki her satırı diğer tablodaki her satırla çapraz birleştirir 

//SELECT last_name , department_name FROM employees CROSS JOIN departments;
//employee tablosu 20 satir departman tablosu 8 satir iceriyor cross join ile 160 tane satir donecektir capraz birlestirme yapilirsa 

//6-2

//Neden kullaniyoruz??
//USING CLAUSE (NATURAL JOIN)
//natural join ile ayni ozellikleri icerir tek var asagidaki ozelliktir 
//ayni isme sahip farkli veri tutan sutunlari using ile kullanabiliriz 

//SELECT first_name , last_name , department_id, department_name FROM employees JOIN departments USING (department_id);
//deparment_id ye gore birlesme gereceklesecektir 

using cümlesi, bir veya her iki tablodaki satırları kısıtlamak için where kullanmamıza olanak tanır 
//SELECT first_name,last_name ,department_id, department_name FROM employees JOIN departments USING (department_id) WHERE last_name='Higgins';

//ON CLAUSE 
//farkli sutun ismi ve ve esit olmayan karsilastirma operatorleri ( < > Between) using join kullanamayiz onun yerine on clause kullanmaliyiz 

//SELECT last_name, job_title FROM employees e JOIN jobs j ON (e.job_id=j.job_id);
//job_id ye gore birlestirme gerceklestirilmistir 
ortak sutunlar iki tabloda farkli isimlere sahip ise on clause ile birlestirme yapilabilir bu sekilde 
yeni isim vermek yerine employees.job_id=jobs.jobs_id diyebiliriz

//SELECT last_name , job_title FROM employees e JOIN jobs j ON (e.job_id=j.job_id) WHERE last_name LIKE 'H%';
//ayni sorguyu where ile sinirladik, h ile baslayan soy isimlerini getirecektir 

// On clause with non-equality operator 
// ayni sutuna sahip degilse kullaniliyor 
//SELECT last_name, salary, grade_level , lowest_sal , highest_sal FROM employees JOIN job_grades ON (salary BETWEEN lowest_sal AND highest_sal);
//job grade tablosundaki belirli bir ucret araligina dahil olup olmadigini kontrol eder yani bir calisanin maasi ilgili is derecesinin en dusuk ve yuksek ucret araligina dahil ise 
//bu calisan ve is derecesi  birlestirme sonucuna dhil edilir 

//Join Three Table Example 
SELECT last_name ,department_name AS "Department", city FROM employees JOIN departments USING (department_id) JOIN locations USING (location_id);
//3 tablodaki istedigim sutunlari birlestirdim 

//6-3

//INNER Join 
//yalnızca eşleşen satırları döndüren bir veya daha fazla tablonun birleştirilmesine iç birleştirme denir 
//bir biri ile esit olan  ayni ortak tablodaki verileri dondurecektir asagidaki ornekte daha iyi anlayacaksiniz 

//ikisindede es olan department_id dir 

employee_id | first_name | last_name | department_id
1           | John       | Doe       | 1
2           | Jane       | Smith     | 2
3           | Emily      | Johnson   | 1

department_id | department_name
1             | Sales
2             | Marketing
3             | HR

//inner join ile birlesme sonrasi 
employee_id | first_name | last_name | department_name
1           | John       | Doe       | Sales
2           | Jane       | Smith     | Marketing
3           | Emily      | Johnson   | Sales



//OUTER Join
//eslesen satirlarin yani sira eslesmeyen satirlarida donuyorsa buna dis katilim denir  
// dis katilim bu terimleri  kullanir "left , full and right "
// bu terimler siralama ile ilgilidir 

//LEFT OUTER JOIN 
//sol tablodaki tum satirlari icerir ve sag tablo ile eslesen satirlari getirir eslesme olmayan sag tablo satirlari icin null deger verir 

//SELECT e.last_name, d.department_id, d.department_name FROM employees e LEFT OUTER JOIN departments d ON(e.department_id=d.department_id);
//bu sorguda "left outer join " sorgusunun yaninda kalan emoloyees e ifadesine dikkatli baktigimizda tabloda gorunecek en sol sutun tablosu oldugunu gorebilirz 
// isci ve departman idleri ayni olan isci soy isimlerini departmanin departman idsini ve departman ismini getirecektir isci ve departman siniflarindan 
// bu sorgu bir departmana atanmis ve atanmamis her kesin soy adlarini getirecektir 
//SELECT last_name , e.job_id AS "JOB" , jh.job_id AS "OLD JOB", end_date FROM employees e LEFT OUTER JOIN job_history jh ON (e.employee_id=jh.employee_id);
// left outer join sorgusundan once gelen employee olduguna gore eski isi olsun olmasin tum iscilerin is_idlerini getirecektir 



//RIGHT OUTER JOIN 
//sag tablodaki tum satirlari icerir ve sol tablo ile eslesen satirlari getirir eslesme olmayan sol tablo satirlari icin null degerleri kullanir 

//SELECT e.last_name, d.department_id, d.department_name FROM employees e RIGHT OUTER JOIN departments d ON (e.department_id=d.department_id);
//islerin soy ismi olsada olmasada tum departman idsini ve departman ismini dondurecektir 

//FULL OUTER JOIN 
//eslesmis ve eslesmemis tum satirlari katilimini saglar 
//sol dis birlestirmeden gelen satirlari ve sag dis birlestirmeden gelen satirlari cogalma olmadan birlestrir 

//SELECT e.last_name, d.department_id, d.department_name FROM employees e FULL OUTER JOIN 
departments d ON (e.department_id=d.department_id);
//ise girmis ve girmemis bir isci ve  iscisi olsada olmasa tum departman isimlerlerini ve idlerini gosterecektir 
//bu katilma sol ve sag katilmanin birlesimidir 


//6-4

//SELF JOIN 
//SELECT worker.last_name || ' works for ' || manager.last_name AS "Works for " FROM employees worker JOIN employees manager ON (worker.manager_id=manager.employee_id);
//iscilerdeki worker ve manager larda ortak olarak employee_id vardir bunlari iliskilendirmek icin relationship alias beliryoruz oda work for dur 

//SELECT worker.last_name, worker.manager_id, manager.last_name AS "Manager Name" FROM employees worker JOIN employees manager ON (worker.manager_id=manager.employee_id); 
// employees workerdan manager_id esit ise employee managerdaki employee_id esit ise bunlarin workerin last name ve manager idsini , managerinda last nameini birlestirecektir 

//HIERARCHICAL QUERIES 

//START WITH (ROOT) 
//CONNECT BY PRIOR 
// ic satir katiliminin nasil yapildigini aciklar 
//LEVEL 
//sozde satir yani 
//agacin kac dal derinlige inecegini belirler 

//SELECT employee_id, last_name , job_id, manager_id FROM employees START WITH employee_id=100 CONNECT BY PRIOR employee_id=manager_id;
// isci id ile manage idsi esit olanlat birbiri ile ic satir kalitimi yapiyor yani birbirleri ile iliskililer employee id 100 olan ise root 

//SELECT last_name || ' reports to '|| PRIOR last_name AS "WALK TOP DOWN" FROM employees 
START WITH last_name='King'
CONNECT BY PRIOR employee_id=manager_id;
// bu ornekde daha iyi anlicaz 
// employee idsi ile manager ids  esit olanlar biri birine rapor veriyor root ise kimse rapor vermiyor 
//cikti :
King reports to
Kochhar reports to King
Whalen reports to Kochhar
Higgins reports to Kochhar

//SELECT LEVEL, last_name || ' reports to ' || PRIOR last_name AS "Walk Top Down" FROM employees START WITH last_name='King' CONNECT BY PRIOR employee_id=manager_id;
// bu koddaki level sozde sutun olusturarak agacin derinligini gosterecektir 

//LPAD FUNCTIONS 
//eger herbir girintiyi gostermek istiyorsan kullanabilirsin 
SELECT LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_') AS "Org Chart" FROM employees 
START WITH last_name='King' 
CONNECT BY PRIOR employee_id=manager_id;
//her ismin basina girintili ifade eklenecektir LENGTH(last_name)+(LEVEL*2)-2,'_' buradaki islme  gore 

//BOTTOM UP HIERARCHICAL 
SELECT LPAD(last_name , LENGTH(last_name)+(LEVEL*2)-2,'_') AS ORG_CHART FROM employees START WITH last_name='Grant' 
CONNECT BY employee_id = PRIOR manager_id;
// asagidan yukariya hiyerarsik sorgu bu seilde yapilmaktadir  

//HIERARCHICAL QUERIES PRUNING 
//sadece tek bir satir isiminden kurtulmak istiyorsan where kullanmalisin 
// eger sen bir satir ve onun tum alt satirlarindan kurtulmak istiyorsan connect by kullanmalisin 
// WHERE clause kulanirsak sadece satir ismi haric tutulur ama CONNECT BY PRIOR kullanirsak tum dallar haric tutulur 

//SELECT last_name FROM employees WHERE last_name!='Higgins'
START WITH last_name='Kochhar'
CONNECT BY PRIOR employee_id=manager_id;
//sadece higgins gidecektir 

SELECT last_name FROM employees START WITH last_name='Kochhar'
CONNECT BY PRIOR employee_id=manager_id AND last_name!='Higgins';
// higgins ve tum alt satirlari gidecektir 