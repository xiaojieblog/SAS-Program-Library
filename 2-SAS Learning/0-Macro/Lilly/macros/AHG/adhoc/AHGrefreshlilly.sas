%macro AHGrefreshlilly(refreshnet=0,lib=,proj=0,files=);
		%let kanbox=d:\newsas;
    data _null_;
      filename pip pipe "dir ""&kanbox\core\*.sas "" /b";
      infile pip;
      length file $100 com $300;
      input file ;
      if index(file,'refreshmac.sas') then return;
      if ("&files" ne '') and (not index(upcase("&files"),trim(upcase(file)))) then return;
      com=("%include ""&kanbox\core\"||file||'";');
      put com=;
      call execute(com);
    run;
    
    data _null_;
      filename pip pipe "dir ""&kanbox\inter\*.sas "" /b";
      infile pip;
      length file $100 com $300;
      input file ;
      if index(file,'refreshmac.sas') then return;
      if ("&files" ne '') and (not index(upcase("&files"),trim(upcase(file)))) then return;
      com=("%include ""&kanbox\inter\"||file||'";');
      put com=;
      call execute(com);
    run;    

 
    %local macbackup;
    %let SAdrive=\\gh3nas01\gh3nas_sales.grp\LCDDMAC\STATS\SA;
    %let macbackup=&sadrive\Macro library\Macro learning tool\sas7bcat\mac;
    
    libname netmac "&macbackup";
    %local mydt;
    %AHGdateandtime(mydt);
    %AHGpm(mydt);
    
        x mkdir "&macbackup&mydt";   
        x copy  "&macbackup\*.*" "&macbackup&mydt\";    
        proc datasets lib=work;
          copy out=netmac memtype=catalog;
        run;
        quit;

%mend;

%AHGrefreshlilly;


