File adhoc\AHGrtftotxtold.sas:
  %if %AHGblank(&txt) %then %let txt=&localtemp\____SDD_OUTPUT.txt;
File adhoc\AWE_initlilly.sas:
%global ls ps localtemp statdrive SAdrive  ;
%let localtemp=d:\temp;
File adhoc\initlilly.sas:
%global ls ps localtemp statdrive SAdrive  ;
%let localtemp=d:\temp;
File adhoc\initlilly_new.sas:
%global ls ps localtemp statdrive SAdrive  ;
%let localtemp=d:\temp;
File adhoc\mysdd.sas:
	%if %AHGblank(&pre) %THEN %let pre=substr(&localtemp,1,2);
File adhoc\openSDDlink.sas:
%let urlfile=&localtemp\temp\url%sysfunc(normal(0)).url;
File adhoc\overviewex.sas:
  %if %AHGblank(&txt) %then %let txt=&localtemp\____SDD_OUTPUT.txt;
