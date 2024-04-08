//7-1 

//oracle proprietary join    ansi/iso sql 1999 equivalent
Cartesian Product            Cross join
Equijoin                     Natural join , join using clause , join on clause (esitlik operatoru kullanilirsa)
Non-equijoin                 On clause 

//ORacle proprietary Joins 
// where clause kullanilarak birden fazla tablodaki verilerin katilim kosullarini 
//SELECT table1.column, table2.column FROM table1, table2 WHERE table1.column1=table2.column2;
//tablo adı ve sütun adı kombinasyonu, yedek tablolar aynı sütun adına sahip bir sütun içerdiğinde belirsiz adları ortadan kaldırmaya yardımcı olur
//sutunlari nitelemek icin gorundugu gibi tablo isimleri kullanilmis table1.collumn1

//EQUIJOIN 
equijoin, belirtilen sütunlar için aynı değerlere sahip satırları birleştiren bir tablo birleştirme işlemidir
-natural join 
-join using 
-join on (= kosulunu kullandugumuz zaman )

//SELECT employees.last_name , employees.job_id, jobs.job_title FROM employees , jobs WHERE employees.job_id=jobs.job_id;
//iscilerin job idsi islerin is idsi esit olanlari aldim isci ve is den sonra onlardan iscilerin soy ismini is idsini ve islerin is titleni yazdi 

//SELECT employees.last_name , departments.department_name FROM employees , departments WHERE employees.department_id=departments.department_id;
// department ve employees deki department_idleri ayni onlari

//TABLE ALIASES 
SELECT last_name , e.job_id , job_title FROM employees e , jobs j WHERE e.job_id=j.job_id AND department_id=80;
// table aliases ornegi yukaridaki burada aliases yapmistur employees e ve jobs j

//SELECT last_name, employees.job_id, job_title FROM employees e, jobs j WHERE e.job_id=j.job_id AND department_id=80;
//eger from clausede aliases tanimlamissak ve select clauseda aliases yerine tablo ismini kullanmissak hata aliriz  

//CARTESIAN PRODUCT JOIN 
//Bir birleştirme sorgusundaki iki tablo WHERE cümlesinde belirtilen bir birleştirme koşuluna sahip değilse veya birleştirme koşulu geçersizse, oracle sunucusu iki tablonun kartezyen çarpımını döndürür 
//this is combination of each row of one table with each row of the other 
-cross join 
//kartezyen carpimdan kacinmak icin where caluse herzaman gecerli join condition icermeli 

//SELECT employees.last_name, departments.departments_name FROM employees, departments;
//join condition atlandi 

//Restricting rows in a join (where clause kullanarak kisitlama saglayabiliriz) 
//SELECT employees.last_name , employees.job_id, jobs.job_title FROM employees, jobs WHERE employees.job_id=jobs.job_id AND employees.department_id=80;
// where clauseda and operatorunu kullanarak join kistiladigini gorebiliyoruz

// 3 tane tablo join katilim 
//SELECT last_name , city FROM employees e , departments d, locations l WHERE e.department_id=d.department_id AND d.location_id=l.location_id;
// 3 tabloda join katilim ve and ile kisitlama gerceklestirdik 


//7-2

//NONEQUIJOIN 
//yaygin olmayan iki farkli tablodan bir tablo uretmemize izin veriyor 
//ornegin her bir iscinin maaslarinin grade_level olarak bilmek istiyorum ama bu cok yaygin bir tablo degil isci tablolari icin iste bunu yapmamiza izin veriyor nonequijoin 
//burada esitlik operatorlerini kullanamazsin 
-Between and 
- <= , >= 
//kullanabilirsin 
//syntax kurallari

//SELECT table1.column , table2.column FROM taable1 , table2 WHERE table1.column = table2.column(+); 
//bu kullanimi left outer join ilede yapabilirsin 

//SELECT table1.column , table2.column FROM taable1 , table2 WHERE table1.column(+)= table2.column; 
//bu kullanimi right outer join ilede yapabilirsin 

//SELECT table1.column , table2.column FROM taable1 , table2 WHERE table1.column(+)= table2.column(+); 
//bu kullanimi full outer join ile yapamazsin kullanimin kendiside yanlistir


//SELECT last_name, salary , grade_level , lowest_sal, highest_sal FROM employees , job_grades WHERE (salary BETWEEN lowest_sal AND highest_sal)
// isci ve job_grade arasinda bir es durum yok ama grade_level gormek istedigimiz icin maaslara gore nonequijoin bu olayi gerceklestirmemize izin veriyor 

//asagidaki islem left outer join kullanilarakda gerceklestirilebilir bu bir nonequijoin ornegi
//SELECT e.last_name ,d.department_id, d.department_name FROM employees e , departments d WHERE e.department_id=d.department_id(+);
// sag tarafda olan deparmandan aldgi bolumler bos gelse bile isci tablosundan aldigi sutunlarin hepsini getirecektir bu sorgu 
//left ise sag tarafa yazilan islemin bos gelsede calisacagini beirtiyor yani sol taraf hep dolu gelecektir hic bos gelmiyecektir 
//LEFT OUTER JOIN ile yapilmis hali 
//SELECT e.last_name ,d.department_id, d.department_name FROM employees e LEFT OUTER JOIN departments d ON (e.department_id=d.department_id);



//asagidaki islem right outer join kullanilarakda yapilabilirdi 
//SELECT e.last_name , d.department_id, d.department_name FROM employees e, departments d WHERE e.department_id(+)=d.department_id;
//sol tarafta olan iscinin aldigi bolumler bos gelse bile sag tarafda kalan departmanin getirdigi sutun toplalari asla bos olmayacaktir  
// sol taraf yazilan tablo elemanlari bos gelse bile sag taraf elemanlari asla bos gelmeyecektir 
//RIGHT OUTHER JOIN ile yapilmis hali
//SELECT e.last_name , d.department_id, d.department_name FROM employees e RIGHT OUTER JOIN  departments d ON (e.department_id=d.department_id);


//++++onemli+++=
//SELECT e.last_name, d.department_id, d.department_name FROM employees e , departments d WHERE e.department_id(+)=d.department_id(+);
//bu durum mumkun degildir full outer join kullanilmaz ve + isareti iki yene konulamaz denersek hata aldigimizi gorecegiz 


