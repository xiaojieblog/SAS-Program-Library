%macro AHGalltonum(dsn,out=%AHGbasename(&dsn),rename=,zero=0,width=100);
%local i varlist informat nobs varinfo  %AHGwords(cmd,100);
%AHGgettempname(varinfo);
%AHGvarinfo(&dsn,out=&varinfo,info= name  type  length num);
data _null_;
	set &varinfo;
	format cmd $200.;
	if type='C' then cmd='input( '||name||',best. ) as '||name;
	else cmd=name ;
    call symput('cmd'||left(_n_),cmd);
	call symput('nobs',_n_);
run;

%AHGdatadelete(data=&varinfo);

proc sql noprint;
	create table &out(drop= AHGdrop) as
	select ' ' as AHGdrop 
    %do i=1 %to &nobs;
    %local zeroI;
    %if &zero %then %let zeroI=%AHGzero(&i,z&zero.);
    %else %let zeroI=&i;
	,&&cmd&i %if not %AHGblank(&rename) %then as &rename&zeroI;
	%end;
	from &dsn
	;quit;

%mend;




