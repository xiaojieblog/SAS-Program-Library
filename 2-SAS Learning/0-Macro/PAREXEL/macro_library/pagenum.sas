%macro pagenum (dir=p:\stat\output, ext=lst, file=, center=Y);
%******************************************************************************;
%*                          PAREXEL INTERNATIONAL LTD                          ;
%*                                                                             ;
%* CLIENT:            PAREXEL                                                  ;
%*                                                                             ;
%* PROJECT:           PAGENUM macro                                            ;
%*                                                                             ;
%* TIMS CODE:         68372                                                    ;
%*                                                                             ;
%* SOPS FOLLOWED:     1213                                                     ;
%*                                                                             ;
%******************************************************************************;
%*                                                                             ;
%* PROGRAM NAME:      pagenum.SAS                                              ;
%*                                                                             ;
%* PROGRAM LOCATION:  /opt/pxlcommon/stats/macros/sas/code/pagenum/ver004      ;
%*                                                                             ;
%******************************************************************************;
%*                                                                             ;
%* USER REQUIREMENTS: 1)Applies the correct page number to an output file      ;
%*                                                                             ;
%* TECHNICAL          Changes (Page xxx of yyy) within an output file and      ;
%* SPECIFICATIONS:    inserts real page numbers                                ;
%*                                                                             ;
%* INPUT:             Macro Parameters:                                        ;
%*                     DIR - specifies the directory which contains the output ;
%*                           files (p:\stat\output is default)                 ;
%*                     EXT - specifies the extension of the output files       ;
%*                           (.LST is default)                                 ;
%*                     FILE - if a single file is in need of change then give  ;
%*                            file name excluding extension. If all files are  ;
%*                            required leave this parameter blank              ;
%*                     CENTER - states whether the numbering should be centered;
%*                              or non centered. Y = centered, N = non centered;
%*                             (Y is default )                                 ;
%*                                                                             ;
%* OUTPUT:                                                                     ;
%*                                                                             ;
%*                                                                             ;
%* PROGRAMS CALLED:   N/A                                                      ;
%*                                                                             ;
%* ASSUMPTIONS/      Assumes Page xxx of yyy is currently on the file.         ;
%* REFERENCES:       If the macro parameter CENTER = Y (default) then it is    ;
%*                   assumed that the global macro parameter LS is already     ;
%*                   defined.                                                  ;
%*                   Assumes that the justification of page xxx of yyy is not  ;
%*                   dealt with within this macro                              ;
%*                                                                             ;
%******************************************************************************;
%*                                                                             ;
%* MODIFICATION HISTORY                                                        ;
%*-----------------------------------------------------------------------------;
%* VERSION:           1                                                        ;
%* AUTHOR:            Chris Bachelor [Sheffield/Biostats and Programming]      ;
%* QC BY:             N/A                                                      ;
%*-----------------------------------------------------------------------------;
%* VERSION:           2                                                        ;
%*                                                                             ;
%* RISK ASSESSMENT                                                             ;
%* Business:          High   [X]: System has direct impact on the provision of ;
%*                                business critical services either globally   ;
%*                                or at a regional level.                      ;
%*                    Medium [ ]: System has direct impact on the provision of ;
%*                                business critical services at a local level  ;
%*                                only.                                        ;
%*                    Low    [ ]: System used to indirectly support the        ;
%*                                provision of a business critical service or  ;
%*                                operation at a global, regional or local     ;
%*                                level.                                       ;
%*                    None   [ ]: System has no impact on the provision of a   ;
%*                                business critical service or operation.      ;
%*                                                                             ;
%* Regulatory:        High   [X]: System has a direct impact on GxP data and/  ;
%*                                or directly supports a GxP process.          ;
%*                    Medium [ ]: System has an indirect impact on GxP data    ;
%*                                and supports a GxP process.                  ;
%*                    Low    [ ]: System has an indirect impact on GxP data or ;
%*                                supports a GxP process.                      ;
%*                    None   [ ]: System is not involved directly or           ;
%*                                indirectly with GxP data or a GxP process.   ;
%*                                                                             ;
%* REASON FOR CHANGE: 1) Validation of program to standards required by        ;
%*                       WSOP 1213.                                            ;
%*                    2) <indicate if no changes have been made to the code>   ;
%*                    3) <brief description of change(s) made to program, and  ;
%*                       reason why change(s) made.>                           ;
%*                                                                             ;
%* TESTING            <method of testing used to validate the program          ;
%* METHODOLOGY:        (e.g. peer code review and review of the test output).> ;
%*                                                                             ;
%* DEVELOPER:         Chris Bachelor                    Date : Unknown         ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%* CODE REVIEWER:     Helen Orange                      Date : 10 March 2005   ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%* USER:              Helen Orange                      Date : 10 March 2005   ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%******************************************************************************;
%* VERSION:           3                                                        ;
%*                                                                             ;
%* RISK ASSESSMENT                                                             ;
%* Business:          As per Version 2                                         ;
%* Regulatory:        As per Version 2                                         ;
%*                                                                             ;
%* REASON FOR CHANGE: Updated to run on Unix platform                          ;
%*                                                                             ;
%* TESTING            Peer code review and testing using pagenum_val.sas       ;
%* METHODOLOGY:                                                                ;
%*                                                                             ;
%* DEVELOPER:         Dan Higgins                       Date : 19/07/2005      ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%* CODE REVIEWER:                                       Date :                 ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%* USER:                                                Date :                 ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%******************************************************************************;
%* VERSION:           4                                                        ;
%*                                                                             ;
%* RISK ASSESSMENT                                                             ;
%* Business:          As per Version 2                                         ;
%* Regulatory:        As per Version 2                                         ;
%*                                                                             ;
%* REASON FOR CHANGE: Updated to deal with both upcase and lowcase of "XXX"    ;
%*                    and "YYY". Use of global macro variable &_divider rather ;
%*                    than '/' or  '\'.                                        ;
%*                                                                             ;
%* TESTING            Peer code review and testing using pagenum_val.sas       ;
%* METHODOLOGY:                                                                ;
%*                                                                             ;
%* DEVELOPER:         karl neufeldt                     Date : 23-AUG-2007     ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%* CODE REVIEWER:     michael cartwright                Date : 23-AUG-2007     ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%* USER:              michael cartwright                Date : 23-AUG-2007     ;
%*                                                                             ;
%* SIGNATURE:         ................................  Date : ............... ;
%*                                                                             ;
%******************************************************************************;

   %*** obtain the file in which page xxx of yyy is to be applied ***;;
   %if &file= %then %do;

        data _null_;
          call system ("ls &dir.&_divider.*.&ext > &dir.&_divider.list.tmp");
        run;
        filename all "&dir.&_divider.list.tmp";
        data pn1 (where=(lowcase(test) contains lowcase(".&ext")));
          infile all length=len pad truncover print;
          length list test $200;
          input test $varying200. len;
          l=len;
          list=trim(left(tranwrd(test,"&dir","")));
          list=trim(left(tranwrd(list,".&ext","")));
        run;
        data _null_;
           call system ("rm &dir.&_divider.list.tmp");
        run;
  %end;
  %else %do;
     data pn1;
       list="&file";
     run;
  %end;

  data _null_;
    set pn1 (keep = list);
    call symput ("_file"||compress(put(_n_,8.)),compress(list));
    call symput ("_numfile",compress(put(_n_,8.)));
  run;

  %do _fil=1 %to &_numfile;

     filename _file "&dir.&&_file&_fil...&ext";

     data pn2;
       infile _file length=len pad truncover print;
       length text $200;
       input text $varying200. len;
       l=len;
       ord+1;
     run;

   %*** Determine the correct numbers to replace xxx and yyy ***;;
     data pn3;
       set pn2;
       if index(compress(lowcase(text)),"pagexxxofyyy") then _page+1;
       call symput ("_numpage",compress(put(_page,8.)));
     run;

   %*** replace xxx and yyy with correct numbers ***;;
     data pn4;
       set pn3;

       if index(compress(text),"xxxofyyy") then do;
         text2a=tranwrd(tranwrd(text,"xxx",compress(put(_page,8.))),"yyy",compress(put(&_numpage,8.)));

          %if %lowcase(&center)=y %then %do;
             text2=repeat(" ",(int((&ls-(length(left(text2a))))/2)-1))||left(text2a);
          %end;
          %else %if %lowcase(&center)=n %then %do;
             text2=text2a;
          %end;
       end;

       else if index(compress( upcase( text)),"XXXOFYYY") then do;
         text2a=tranwrd(tranwrd(text,"XXX",compress(put(_page,8.))),"YYY",compress(put(&_numpage,8.)));

          %if %lowcase(&center)=y %then %do;
             text2=repeat(" ",(int((&ls-(length(left(text2a))))/2)-1))||left(text2a);
          %end;
          %else %if %lowcase(&center)=n %then %do;
             text2=text2a;
          %end;
       end;

       else do;
          text2=text;
       end;
     run;

     data _null_;
       set pn4 (keep = text2 l);
       file _file pad print notitles;
       put text2 $varying200. l;
     run;

  %end;

  %*** delete datasets used in this macro ***;;


  proc datasets nolist lib=work memtype=data;
  delete pn1-pn4;
  quit;

%mend pagenum;
