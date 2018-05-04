%MACRO Freq1Way(indsn,var1,by,where,outdsn);

  %******************************************************************************;
  %*                          PAREXEL INTERNATIONAL LTD                          ;
  %*                                                                             ;
  %* CLIENT:            PAREXEL                                                  ;
  %*                                                                             ;
  %* PROJECT:           Freq1Way [One way frequency count macro]                 ;
  %*                                                                             ;
  %* TIMS CODE:         68372                                                    ;
  %*                                                                             ;
  %* SOPS FOLLOWED:     1213                                                     ;
  %*                                                                             ;
  %******************************************************************************;
  %*                                                                             ;
  %* PROGRAM NAME:      freq1way.sas                                             ;
  %*                                                                             ;
  %* PROGRAM LOCATION:  /opt/pxlcommon/stats/macros/sas/code/freq1way/ver002     ;
  %*                                                                             ;
  %******************************************************************************;
  %*                                                                             ;
  %* USER REQUIREMENTS: Macro to perform a frequency count on a dataset          ;
  %*                                                                             ;
  %* TECHNICAL          The macro is programmed to perform a PROC FREQ on the    ;
  %* SPECIFICATIONS:    input dataset, based on arguments passed as parameters   ;
  %*                    in the macro call.                                       ;
  %*                                                                             ;
  %* INPUT:             Macro Parameters:                                        ;
  %*                    INDSN  = input dataset name                              ;
  %*                    VAR1   = input variable                                  ;
  %*                    BY     = by variable (must be by, followed by variables) ;
  %*                    WHERE  = where statement                                 ;
  %*                    OUTDSN = output dataset name                             ;
  %*                                                                             ;
  %* OUTPUT:            N/A                                                      ;
  %*                                                                             ;
  %* PROGRAMS CALLED:   N/A                                                      ;
  %*                                                                             ;
  %* ASSUMPTIONS/       None                                                     ;
  %* REFERENCES                                                                  ;
  %*                                                                             ;
  %*                                                                             ;
  %******************************************************************************;
  %*                                                                             ;
  %* MODIFICATION HISTORY                                                        ;
  %*-----------------------------------------------------------------------------;
  %* VERSION:           1                                                        ;
  %* AUTHOR:            Kerri McCaul (RTP) 05/05/2003                            ;
  %* QC BY:             N/A                                                      ;
  %*                                                                             ;
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
  %*                    2) No changes to code required.                          ;
  %*                                                                             ;
  %* TESTING            Peer code review and review of test output created by    ;
  %* METHODOLOGY:       Q:\Programming Steering Committee\SoftwareValidation\    ;
  %*                    Software\SASMacros\Freq1Way\Freq1Way_val.sas             ;
  %*                                                                             ;
  %* DEVELOPER:         Kerri McCaul                      Date : 05/05/2003      ;
  %*                                                                             ;
  %* SIGNATURE:         ................................  Date : ............... ;
  %*                                                                             ;
  %* CODE REVIEWER:     Phil Riley                        Date : 03/03/2005      ;
  %*                                                                             ;
  %* SIGNATURE:         ................................  Date : ............... ;
  %*                                                                             ;
  %* USER:              Phil Riley                        Date : 03/03/2005      ;
  %*                                                                             ;
  %* SIGNATURE:         ................................  Date : ............... ;
  %*                                                                             ;
  %******************************************************************************;
  %* Tested on UNIX platform:-                                                   ;
  %*                                                                             ;
  %* USER:              Dan Higgins                       Date : 14/07/2005      ;
  %*                                                                             ;
  %* SIGNATURE:         ................................  Date : ............... ;
  %*                                                                             ;
  %******************************************************************************;

  %local indsn var1 by where outdsn;

  proc freq data=&indsn noprint;
          tables &var1 /noprint list out=&outdsn;
          &by;
          &where;
  run;

%mend Freq1Way;