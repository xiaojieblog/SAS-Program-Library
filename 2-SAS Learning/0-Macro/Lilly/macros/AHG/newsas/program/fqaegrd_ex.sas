%macro fqaegrd_ex;

%ahgfreqcore(adsl,trtpn,keep=value frequency,out=bigN);

proc transpose data=bigN out=bigNline;
  var frequency;
  id value;
run;

data bigNline(drop=_name_);
  format frequency $200.;
  set bigNline;
run;


%AHGmergedsn(adsl,adae,adae,by=subjid,joinstyle=full );


data adae  patient(  keep=subjid &TEAEflag trtpn fasfl);
  set  adae;
  if missing(&aeterm) ne missing(&socterm) then put "Warning not missing both term" &aeterm= &socterm= ;
  if not missing(aeterm) and missing(&aeterm) then &aeterm='Uncoded';
  if not missing(aeterm) and missing(&socterm) then &socterm='Uncoded';

run;
  
proc sql;
  create table TEAEdsn AS
  select distinct subjid,trtpn,put('',$200.) as &socterm,put('Patients with >=1 TEAEs',$200.) as &aeterm,max(&TEAEflag)>'' as aeyn
  from patient
  group by subjid
  ;
  quit;




****************************************************************;

proc sql;
  create table nodup as
  select distinct &socterm
  from adae
  where not missing(&socterm)
  ;
  create table allsys as
  select subjid, &socterm,trtpn
  from nodup, adsl
  ;

  create table justSys as
  select distinct subjid, &socterm,put('',$200.) as &aeterm,1 as aeyn
  from adae
  where not missing(&socterm)
  ;
quit;

%AHGmergedsn(justsys,allsys,alljustsys,by=subjid &socterm,joinstyle=full/*left right full matched*/);



/*******************************/

proc sql;
  create table noduppt as
  select distinct &socterm,&aeterm
  from adae
  where not missing(&aeterm)
  ;
  create table allpt as
  select subjid, &socterm,&aeterm,trtpn
  from nodupPT, adsl
  ;

  create table justPT as
  select distinct subjid, &socterm,&aeterm,max(aetoxgr) as aetoxgr,1 as aeyn
  from adae
  where not missing(&aeterm)
  group by subjid, &socterm,&aeterm
  ;
quit;

%AHGmergedsn(justPT,allPT,alljustPT,by=subjid &socterm &aeterm,joinstyle=full/*left right full matched*/);


data alljustPT(rename=(newaeterm=&aeterm));
  set alljustPT;
  if missing(aeyn) then aeyn=0;
  newaeterm=&aeterm;
  output;
  if &aeterm>'0' then
    do;
    do loop=1 to 5;
      newaeterm=trim(&aeterm)||'@  Grade '||left(put(loop,best.));
      if loop=input(aetoxgr,best.) then  
        do;
        aeyn=1;output;
        end;
      else
        do;
        aeyn=0;output;
        end;
    end;
    newaeterm=trim(&aeterm)||'@  Grade _3/4/5';
    if 3<=input(aetoxgr,best.)<=5 then  
        do;
        aeyn=1;output;
        end;
    else
        do;
        aeyn=0;output;
        end;
    end;
  drop &aeterm;
run;


data everything;
  set alljustPT alljustsys TEAEdsn;
  if missing(aeyn) then aeyn=0;
run;

%AHGdatasort(data =everything , out =everything , by =&socterm &aeterm trtpn );

%macro newfreq(dsn,var,out=,by=);
  %ahgfreqcore(&dsn,&var,out=&out,by=&by);
  data &out;
    set &out;
    percentstr='('||put(round(percent,0.1),5.1)||')';
    valuestr=catx(' ',frequency,percentstr);
    if missing(valuestr) then valuestr='0';
    keep value  valuestr &BY ;
  run;
%mend;


%newfreq(everything,aeyn,by=&socterm &aeterm trtpn,out=bigone);

data bigone;
  set bigone;
  by &socterm &aeterm trtpn value;
  if value=1 then OUTPUT;
  if last.trtpn and value=0 then
  do;
  value=1;valuestr='0';output;
  end;
run;

PROC TRANSPOSE data=bigone out=bigout(drop=_NAME_) prefix=pct ; 
  BY &socterm &aeterm;  
  ID trtpn;  
  VAR valuestr;
run;

data bigout;
  set bigout;
  array allpct pct:;
  do over allpct;
  if missing(allpct) then allpct='0';
  end;
  if missing(&aeterm) and not (&aeterm='Patients with >=1 TEAEs') then &aeterm=&socterm;
  else &aeterm='  '||&aeterm;
  count=input(scan(pct4,1),best.);
  if &aeterm=&socterm then count=99999;
run;


%AHGrenamekeep(bigout,out=renameDSN,pos=,names=
soc term st1  st2 st3 stALL count,keep=1);

data newrenameDSN;
  set renameDSN;
  ordterm=scan(term,1,'@');
  if scan(term,2,'@')>'' then ordnum=rank(substr(scan(term,2,'@'),9,1));
  count=input(scan(stAll,1),best.);
  if index(term,'@') then term=scan(term,2,'@');
  term=tranwrd(term,'_3/4/5','3/4/5');
  if term=soc then level=0;
  else level=1;
run;

proc sql;
  create table renameDSN as
  select *,max(count) as maxcount
  from newrenameDSN
  group by soc,ordterm

  ;
  quit;
%AHGdatasort(data=renameDSN , out =ord , by =soc level descending maxcount ordterm ordnum);



%AHGordvar(ord,term st1 st2 st3 stALL,out=ord,keepall=0);

%AHGsetprint(bigNline ord,out=ord,print=0);

%toRTF;

%AHGreportby(ord,0,which=2 3 4 5,flow=flow,whichlength=12 12 12 12,sort=0,groupby=0,groupto=0,topline=,showby=0,option=%str(nowd split='^') ,labelopt=%str(option label;));



%mend;


