%macro _sysin (_message=%str(not_available)); 

%******************************************************************************;
%*                          PAREXEL INTERNATIONAL                              ;
%*                                                                             ;
%* CLIENT:            PAREXEL                                                  ;
%*                                                                             ;
%* PROJECT:           _sysin macro                                             ;
%*                                                                             ;
%* TIMS CODE:         68372                                                    ;
%*                                                                             ;
%* SOPS FOLLOWED:     1213                                                     ;
%*                                                                             ;
%******************************************************************************;
%*                                                                             ;
%* PROGRAM NAME:      _sysin.sas                                               ;
%*                                                                             ;
%* PROGRAM LOCATION:  \opt\pxlcommon\stats\macros\sas\code\_sysin\ver001       ;
%*                                                                             ;
%******************************************************************************;
%*                                                                             ;
%* USER REQUIREMENTS: Create platform-independent macro variables containing   ;
%*                    pathname of current directory location with program name ;
%*                    and also program name alone.                             ;
%*                                                                             ;
%* TECHNICAL          Must be initiated after %def_os (setup.sas)              ;
%* SPECIFICATIONS:    Refer to comments in code.                               ;
%*                                                                             ;
%* INPUT:             Macro parameter definition:                              ;
%*                                                                             ;
%*                    _comment = optionally configurable message to appear in  ;
%*                               values of aforementioned macro variables when ;
%*                               run in PC SAS.  This macro is for VMS and     ;
%*                               Unix use - PC studies employ different        ;
%*                               methodologies.                                ;
%*                                                                             ;
%*                    Example macro calls...                                   ;
%*                                                                             ;
%*                    %_sysin                                                  ;
%*                    %_sysin (_message=%str(please use excel application))    ;
%*                                                                             ;
%* OUTPUT:            Two global macro variables for use within current SAS    ;
%*                    program.  Results are written to SAS log file.           ;
%*                                                                             ;
%* PROGRAMS CALLED:   <path><name>.<extension>                                 ;
%*                                                                             ;
%* ASSUMPTIONS/       <any relevant information not contained elsewhere in the ;
%* REFERENCES:         program.>                                               ;
%*                                                                             ;
%******************************************************************************;
*                                                                             ;
* MODIFICATION HISTORY                                                        ;
*-----------------------------------------------------------------------------;
* VERSION:           1                                                        ;
*                                                                             ;
* RISK ASSESSMENT                                                             ;
* Business:          High   [ ]: System has direct impact on the provision of ;
*                                business critical services either globally   ;
*                                or at a regional level.                      ;
*                    Medium [X]: System has direct impact on the provision of ;
*                                business critical services at a local level  ;
*                                only.                                        ;
*                    Low    [ ]: System used to indirectly support the        ;
*                                provision of a business critical service or  ;
*                                operation at a global, regional or local     ;
*                                level.                                       ;
*                    None   [ ]: System has no impact on the provision of a   ;
*                                business critical service or operation.      ;
*                                                                             ;
* Regulatory:        High   [ ]: System has a direct impact on GxP data and/  ;
*                                or directly supports a GxP process.          ;
*                    Medium [X]: System has an indirect impact on GxP data    ;
*                                and supports a GxP process.                  ;
*                    Low    [ ]: System has an indirect impact on GxP data or ;
*                                supports a GxP process.                      ;
*                    None   [ ]: System is not involved directly or           ;
*                                indirectly with GxP data or a GxP process.   ;
*                                                                             ;
* TESTING            Peer code review and review of program execution.        ;
* METHODOLOGY:                                                                ;
*                                                                             ;
*                                                                             ;
* DEVELOPER:         Stephen Lyons                     Date : Oct 20, 2005    ;
*                                                                             ;
* SIGNATURE:         ................................  Date : ............... ;
*                                                                             ;
* CODE REVIEWER:     Dan Higgins                       Date : 20/10/2005      ;
*                                                                             ;
* SIGNATURE:         ................................  Date : ............... ;
*                                                                             ;
* USER:              Dan Higgins                       Date : 20/10/2005      ;
*                                                                             ;
* SIGNATURE:         ................................  Date : ............... ;
*                                                                             ;
******************************************************************************;

*************************************************************;
*** %_SYSIN MACRO DEFINITION                              ***;
***                                                       ***;
*** FUNCTION (VMS and Unix only):                         ***;
***    Retreive information about location of SAS program ***;
***    in current study area.                             ***;
***                                                       ***;
*** REQUIREMENTS:                                         ***;
***    Must be initiated after %def_os to pick up correct ***;
***    value of &_suffix.                                 ***;
***                                                       ***;
*** GLOBAL MACRO VARIABLES CREATED:                       ***;
***    _sysin - SAS program location and name.            ***;
***    _pgm   - SAS program name.                         ***;
*************************************************************;

  %global _sysin _pgm;
  %if &sysscp=WIN
  %then %do;
        %let _sysin = &_message;
        %let _pgm   = &_message;
        %end;
  %else %do;
        %if (&sysver=6.12 and &sysscp=VMS_AXP)
        %then %let _sysin = &vmssasin;
        %else %let _sysin = %scan(%sysfunc(getoption(SYSIN)),1,";");
        data _null_;
          call symput("_pgm",scan(reverse(scan(reverse("&_sysin"),1,"&_suffix")),1,"."));
        run;
        %end;
  %put (&sysscp environment, SAS version &sysver);
  %put NOTE: Current program path (_SYSIN) : &_sysin;
  %put NOTE: Program name (_PGM)           : &_pgm;
%mend _sysin;
