%macro AHGvarinfo(dsn,out=varinfoout,info= name  type  length num fmt);
%local i ahg3allinfo;
%let ahg3allinfo=name  type   length  format  informat label ;     

data &out(keep=&info);
length dsn $40 name $32  type $4  length 8 format $12  informat $10 label $50  num 8 superfmt fmt $12;
tableid=open("&dsn",'i');
varlist=' ';
dsn="&dsn";
do i=1 to  attrn(tableid,'nvars');
   %do i=1 %to %AHGcount(&ahg3allinfo);
   %if %scan(&ahg3allinfo,&i) ne num 
    and %scan(&ahg3allinfo,&i) ne fmt 
    and %scan(&ahg3allinfo,&i) ne superfmt 
    %then  %scan(&ahg3allinfo,&i)= var%scan(&ahg3allinfo,&i)(tableid,i);;
   %end;
   num=varnum(tableid,varname(tableid,i)) ;
   if type='C' then fmt='$'||compress(put(length,best.))||'.';
   else fmt=compress(put(length,best.))||'.';
   superfmt=format;
   if missing(superfmt) then superfmt=fmt;
   output;
end;
rc=close(tableid);
run;   

%mend;
