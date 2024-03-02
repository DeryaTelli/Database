SELECT * FROM <table name>; //tablodaki tum satirlari dondurecektir 
SELECT <column name 1 , colum nam 2 , etc> FROM <table name> WHERE <condition>; //condition verilen yerdeki tablo isminden isteneden sutun isimlerini getirecektir 
   //SELECT first_name,last_name,job_id FROM employees WHERE job_id = 'SA_REP';
SELECT * |column|expr[AS alias], ..... FROM table; // tablodaki sutun ismini degistirme islemini yapar 
    //SELECT last_name AS name, commission_pct AS comm FROM employees; // employees deki  last name name olarak commission pct com olarak degistiricektir 