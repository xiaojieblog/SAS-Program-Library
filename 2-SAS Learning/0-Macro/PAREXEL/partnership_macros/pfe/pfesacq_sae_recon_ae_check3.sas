/*-----------------------------------------------------------------------------<
  PAREXEL INTERNATIONAL LTD
 
  Sponsor / Protocol No: PFE / Macro and Application Development committee
  PXL Study Code:        N/A - Data Exchange Team for Pfizer Partnership
 
  SAS Version:           9.2 and above
  Operating System:      UNIX
  Example Call:          Note: Part of program: pfesacq_sae_recon 
               
                         Call from parent submacro pfesacq_sae_recon.sas:
                         %pfesacq_sae_recon_ae_check3();

-------------------------------------------------------------------------------
 
  Author:                Shiva Bhimreddy, $LastChangedBy: bhimres $
  Creation Date:         01JUN2015                       $LastChangedDate: 2015-10-01 17:22:10 -0400 (Thu, 01 Oct 2015) $
 
  Program Location/Name: $HeadURL: http://kennet.na.pxl.int:7070/svnrepo/LP_BLINDED_GLOBALMACROLIBARY_STATS/partnership_macros/pfe/pfesacq_sae_recon_ae_check3.sas $
 
  Files Created:         None
 
  Program Purpose:       Merge the EDC AE dataset with the safety (CSV/XLS) AE dataset
                         and see if there are any mismatches for the AE verbatim term.                      
 
                         This macro is PAREXEL's intellectual property and shall
                         not be used outside of contractual obligations without
                         written consent from PAREXEL's senior management.
 
                         This macro has been validated for use only in PAREXEL's
                         working environment.
 
  Macro Parameters:
 
  Macro Output:  

  Macro Dependencies:    Note: Part of program: pfesacq_sae_recon 

                         This is a submacro dependant on calling parent macro: 
                         pfesacq_sae_recon.sas

-------------------------------------------------------------------------------
MODIFICATION HISTORY: Subversion $Rev: 2284 $
  
-----------------------------------------------------------------------------*/

%macro pfesacq_sae_recon_ae_check3();
    %put ---------------------------------------------------------------------;
    %put NOTE:[PXL] PFESACQ_SAE_RECON_AE_CHECK3: Start of Submacro;
    %put ---------------------------------------------------------------------;
    %put ;

	*** Sort the 2 datasets by Study and Merge them to check if AE verbatim term mismatches exist ***;

	*** EDC ***;

	proc sort data=outdir.ae_crf out=edc;
		by subjid;
		where subjid ne '' and aeser in ('YES','Y');
	run;

	proc sort data=outdir.dm_crf out=dmedc nodupkey;
		by subjid;
	run;

	data edc;
		merge edc(in=a) dmedc(in=b);
		by subjid;
		if a;
	run;

	proc sort data=edc;
		by study subjid dob sex aeser aecaseid aedecd2 fromdate todate aepres aercaus aestdrg deathdt;
	run;

	*** Safety ***;

	proc sort data=outdir.aesafety out=safe;
		by subjid;
		where subjid ne '';
	run;

	proc sort data=outdir.dmsafety out=dmsafe nodupkey;
		by subjid;
	run;

	data safe;
		merge safe(in=a) dmsafe(in=b);
		by subjid;
		if a;
	run;

	proc sort data=safe;
		by study subjid dob sex aeser aecaseid aedecd2 fromdate todate aepres aercaus aestdrg deathdt;
	run;

	*** Create a dataset with AE verbatim term mismatches ***;

	data check1;
		length flag $40;
		merge edc(in=a  rename=(aeterm=clinterm)) 
			  safe(in=b rename=(aeterm=safeterm));
		by study subjid dob sex aeser aecaseid aedecd2 fromdate todate aepres aercaus aestdrg deathdt;

		if a and b and clinterm ne safeterm then flag = 'Verbatim Term mismatch';
		if flag ne '';

		if a=1 then do;
                      clinstudy=study;
					  clinsubj=subjid;
					  clindob=dob;
					  clinsex=sex;
					  clincase=aecaseid;
					  clindecd=aedecd2;
					  clinst=fromdate;
					  clinen=todate;
					  clinpres=aepres;
					  clinrel=aercaus;
					  clinacn=aestdrg;
					  clindth=deathdt;
					  clinser=aeser;
					end;

		if b=1 then do;
                      safestudy=study;
					  safesubj=subjid;
					  safedob=dob;
					  safesex=sex;
					  safecase=aecaseid;
					  safedecd=aedecd2;
					  safest=fromdate;
					  safeen=todate;
					  safepres=aepres;
					  saferel=aercaus;
					  safeacn=aestdrg;
					  safedth=deathdt;
					  safeser=aeser;
					end;

	run;


	data aecheck3;
		set check1;
	run;

	proc datasets lib=work;
		delete edc dmedc safe dmsafe check1;
	run;

    %macend:;
    %put ;
    %put ---------------------------------------------------------------------;
    %put NOTE:[PXL] PFESACQ_SAE_RECON_AE_CHECK3: End of Submacro;
    %put ---------------------------------------------------------------------;
    %put ;

%mend pfesacq_sae_recon_ae_check3;

*** Example macro call ***;

*%pfesacq_sae_recon_ae_check3();

