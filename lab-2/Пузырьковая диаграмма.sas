/*
 *
 * Код задачи, сгенерированный в SAS Studio 3.8 
 *
 * Время генерации '15.03.20, 18:12' 
 * Кем сгенерирован 'u47238095' 
 * Сгенерирован на сервере 'IP-10-0-0-102.EU-WEST-1.COMPUTE.INTERNAL' 
 * Сгенерирован на платформе SAS 'Linux LIN X64 3.10.0-1062.4.3.el7.x86_64' 
 * Сгенерирован с SAS версии '9.04.01M6P11072018' 
 * Браузер 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36' 
 * Веб-клиент 'https://odamid-euw1.oda.sas.com/SASStudio/main?locale=ru_RU&zone=GMT%252B03%253A00&https%3A%2F%2Fodamid-euw1.oda.sas.com%2FSASStudio%2F=' 
 *
 */

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=SASHELP.AIRLINE;
	bubble x=AIR y=DATE size=AIR/ bradiusmin=7 bradiusmax=14;
	xaxis grid;
	yaxis grid;
run;

ods graphics / reset;