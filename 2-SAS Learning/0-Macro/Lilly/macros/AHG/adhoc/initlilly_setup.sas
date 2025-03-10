%macro initlilly_setup(phase2=qa,ref=TDTM,PorV=programs_stat);
%initlilly;
%global os sep drive_root dir_root dev_phase dev_phase2 compound study analy_phase referenc pgm_dir
        studyid trt1 trt2 trt3 trt4 trt5;
%if %upcase(&sysscp) = WIN %then 
  %do;
  %let os = %lowcase(&sysscp);
  %let sep=\;
  /*Set up directory macro variables and the libraries*/
  %let drive_root=%scan(&pathroot,1,&sep); /*Drive*/
  %let dir_root=%scan(&pathroot,2,&sep); /*root directory*/
  %let dev_phase=%scan(&pathroot,3,&sep);/*development phase before DBL*/
  %let dev_phase2=&phase2;/*development phase after DBL*/
  %let compound=%scan(&pathroot,4,&sep); /*compound name*/
  %let study=%scan(&pathroot,5,&sep); /*study name*/
  %let analy_phase=%scan(&pathroot,6,&sep); /*need to change when starting another interim lock*/ 
  %let referenc=&ref; /*need to change after prd data is ready*/
  %let pgm_dir=&porv;/*program location*/

  libname arcmeta "&drive_root\&dir_root\&dev_phase\&compound\&study\&analy_phase\data\shared\arc_reporting_metadata"; /*location of arc tool metadata*/
  libname rptlib "&drive_root\&dir_root\&dev_phase\&compound\&study\&analy_phase\&pgm_dir\tfl_output"; /*location of outputs*/
  libname sdtm "&drive_root\&dir_root\&dev_phase\&compound\&study\&analy_phase\data\shared\sdtm" access=readonly;
  libname adam "&drive_root\&dir_root\&dev_phase\&compound\&study\&analy_phase\data\shared\adam" access=readonly;

  /*options errorcheck=strict serror mprint mlogic mlogicnest symbolgen notes source nosource2 nocenter nodate nonumber fmtsearch=(work);*/

  /*Include output formatting*/
  %include "&drive_root\&dir_root\&dev_phase\&compound\&study\&analy_phase\programs_stat\format_hhbh.sas";
  %end;
%else 
  %do;
  %let os = unix;
  %let sep=%str(/);

libname arcmeta "&arcmeta"; /*location of arc tool metadata*/
libname rptlib "&rptlib"; /*location of outputs*/
libname rptlibv "&rptlibv"; /*location of independent programming outputs*/

/*Set up the study programming environment*/
options sasautos=("&dev_path" "&val_path" "&bum_path" sasautos) mautosource;
/*options errorcheck=strict serror mprint mlogic mlogicnest symbolgen notes source nosource2 nocenter nodate nonumber fmtsearch=(work);*/

/*Include output formatting*/
%include &format_intrm1;
%end;
%let studyid=%upcase(&compound);


%mend;
