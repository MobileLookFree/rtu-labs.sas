/*
 *
 * Код задачи, сгенерированный в SAS Studio 3.8 
 *
 * Время генерации '09.04.20, 21:31' 
 * Кем сгенерирован 'u47238095' 
 * Сгенерирован на сервере 'ODAWS02-EUW1.ODA.SAS.COM' 
 * Сгенерирован на платформе SAS 'Linux LIN X64 3.10.0-1062.9.1.el7.x86_64' 
 * Сгенерирован с SAS версии '9.04.01M6P11072018' 
 * Браузер 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36' 
 * Веб-клиент 'https://odamid-euw1.oda.sas.com/SASStudio/main?locale=ru_RU&zone=GMT%252B03%253A00&https%3A%2F%2Fodamid-euw1.oda.sas.com%2FSASStudio%2F=' 
 *
 */

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=SASHELP.CLASSFIT;
	vbox Height / category=Age group=Sex;
	yaxis grid;
run;

ods graphics / reset;