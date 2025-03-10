%macro AHGindent(file);

%local ori ;
%AHGgettempname(ori);


%AHGreadline(file=&file,out=&ori);

data _null_;
  file "&file..indent.sas";
  retain write 1 indent 0 null 0;
  set &ori;
  if lowcase(line)=:'data deletefromithere' then write=0;
  if lowcase(line)=:'data _null_' then null=1;
  if not index(line,'\\') and( lowcase(line)=:'data ' or lowcase(line)=:'proc ')  then indent=1;
  else if  indent and not (lowcase(line)=:'run;' ) then put '  '@;
  
  
  if write and not null then put line; 
  if     lowcase(line)=:'run;' or  lowcase(line)=:'quit;' then 
  do;indent=0; put;end;
  if lowcase(line)=:'data writetofilefromithere' then write=1;
  if lowcase(line)=:'run;' then null=0;

run;
%mend;
