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

/* Вычислить диапазоны осей */
proc means data=SASHELP.CLASSFIT noprint;
	class Weight / order=data;
	var Age predict;
	output out=_BarLine_(where=(_type_ > 0)) mean(Age predict)=resp1 resp2;
run;

/* Вычислить минимальные и максимальные значения отклика (включить 0 в вычисления) */
data _null_;
	retain respmin 0 respmax 0;
	retain respmin1 0 respmax1 0 respmin2 0 respmax2 0;
	set _BarLine_ end=last;
	respmin1=min(respmin1, resp1);
	respmin2=min(respmin2, resp2);
	respmax1=max(respmax1, resp1);
	respmax2=max(respmax2, resp2);

	if last then
		do;
			call symputx ("respmin1", respmin1);
			call symputx ("respmax1", respmax1);
			call symputx ("respmin2", respmin2);
			call symputx ("respmax2", respmax2);
			call symputx ("respmin", min(respmin1, respmin2));
			call symputx ("respmax", max(respmax1, respmax2));
		end;
run;

/* Определить макрос для смещения */
%macro offset ();
	%if %sysevalf(&respmin eq 0) %then
		%do;
			offsetmin=0 %end;

	%if %sysevalf(&respmax eq 0) %then
		%do;
			offsetmax=0 %end;
%mend offset;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=SASHELP.CLASSFIT nocycleattrs;
	vbar Weight / response=Age stat=mean;
	vline Weight / response=predict stat=mean y2axis;
	yaxis grid min=&respmin1 max=&respmax1 %offset();
	y2axis min=&respmin2 max=&respmax2 %offset();
	keylegend / location=outside;
run;

ods graphics / reset;

proc datasets library=WORK noprint;
	delete _BarLine_;
	run;