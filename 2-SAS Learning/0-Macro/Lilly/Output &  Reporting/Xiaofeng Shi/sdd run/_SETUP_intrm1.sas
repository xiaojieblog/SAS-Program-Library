/*soh*************************************************************************
Eli Lilly and Company - Global Statistical Sciences
CODE NAME                 : _SETUP_intrm1.SAS
CODE TYPE                 : Limited-use Module
PROJECT NAME (optional)   : Standard output macro for Lilly China internal use

DESCRIPTION               : This code is used to set up the programming
                            environment for the output generation programs.                            

SOFTWARE/VERSION#         : SAS/Version 9.2
INFRASTRUCTURE            : SDD version 3.5

LIMITED-USE MODULES       : n/a

BROAD-USE MODULES         : n/a
INPUT                     : n/a
OUTPUT                    : n/a
 
VALIDATION LEVEL          : 3
REQUIREMENTS              : n/a
ASSUMPTIONS               : Prior to using this macro, users need to check if
                            the folders are set up
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
BROAD-USE MODULE/LIMITED-USE MODULE SPECIFIC INFORMATION: n/a

BROAD-USE MODULE TEMPORARY OBJECT PREFIX: n/a

PARAMETERS:

Name          Type         Default            Description and Valid Values
---------     ------------ ------------------ ----------------------------------

USAGE NOTES:
   Users may call the _setup macro to set up the programming environment. But this macro
   could be modified to change the output status after DBL. In addition, this macro should
   be called at the begining of the outputs generating programs.

TYPICAL WAYS TO EXECUTE THIS CODE AND DESCRIPTION, if applicable:

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
REVISION HISTORY SECTION:

     Author &
Ver# Peer Reviewer        Code History Description
---- ----------------     ------------------------------------------------
1.0   Xiaofeng Shi        Original version of the code
      Xiang Liu
**eoh************************************************************************/

%***************************************************************************;
%*** Set up directory macro variables and the libraries;
%***************************************************************************;

/*The base path will be changed when prd data is ready*/
%let dir_root=lillyce;
%let dev_phase=qa; /*need to change after prd data is ready*/
%let compound=ly2439821;
%let study=i1f_je_rhat;
%let analy_phase=intrm1; /*need to change when starting another interim lock*/ 
%let referenc=TDTM; /*need to change after prd data is ready*/

libname arcmeta "&arcmeta";
libname rptlib "&rptlib";

%***************************************************************************;
%*** Set up the study programming environment;
%***************************************************************************;

%let ls=133;
%let ps=47;

options ls=&ls ps=&ps;
options sasautos=("&lum_path" "&bum_path" sasautos) mautosource;  
options errorcheck=strict serror mprint mlogic mlogicnest symbolgen notes source nosource2 nocenter nodate nonumber fmtsearch=(work);

%let studyid=LY2439821;
%let trt1=Plaque Ps;
%let trt2=Erythrodermic Ps;
%let trt3=Pustular Ps;
%let trt4=PsA;
%let trt5=Total;

%***************************************************************************;
%*** Include the formats;
%***************************************************************************;

%include &format_rhat;
/******PACMAN****** DO NOT EDIT BELOW THIS LINE ******PACMAN******/
/*<?xml version="1.0" encoding="UTF-8"?>*/
/*<process sessionid="3f3835db:1400acab633:-e10" sddversion="3.5" cdvoption="N" parseroption="B">*/
/* <parameters>*/
/*  <parameter userdefined="B" obfuscate="N" usecdv="N" id="BASE_1" canlinktobasepath="N" cdvenable="N" protect="N" label="Base path for relative paths" order="1" processid="P9" dependsaction="ENABLE" usecdvpath="N" cdvrequired="N" resolution="INPUT"*/
/*   advanced="N" required="N" enable="N" type="BASEPATH" tabname="Parameters">*/
/*   <basepath system="SDD" source="DOMAIN" displaypath="/lillyce/qa/ly2439821" displayname="i1f_je_rhat" id="/lillyce/qa/ly2439821/i1f_je_rhat" itemtype="Container" fileinfoversion="3.0">*/
/*   </basepath>*/
/*   <description>*/
/*   </description>*/
/*  </parameter>*/
/*  <parameter dependsaction="ENABLE" obfuscate="N" label="SAS log" systemtype="&star;LOG&star;" tabname="System Files" baseoption="A" advanced="N" order="2" id="&star;LOG&star;" canlinktobasepath="Y" protect="N" userdefined="S" filetype="LOG"*/
/*   processid="P9" required="N" resolution="INPUT" enable="N" type="LOGFILE">*/
/*  </parameter>*/
/*  <parameter dependsaction="ENABLE" obfuscate="N" label="SAS output" systemtype="&star;LST&star;" tabname="System Files" baseoption="A" advanced="N" order="3" id="&star;LST&star;" canlinktobasepath="Y" protect="N" userdefined="S" filetype="LST"*/
/*   processid="P9" required="N" resolution="INPUT" enable="N" type="LSTFILE">*/
/*  </parameter>*/
/*  <parameter dependsaction="ENABLE" obfuscate="N" label="Process parameter values" systemtype="SDDPARMS" tabname="System Files" baseoption="A" advanced="N" order="4" id="SDDPARMS" canlinktobasepath="Y" protect="N" userdefined="S" filetype="SAS7BDAT"*/
/*   processid="P9" required="N" resolution="INPUT" enable="N" type="PARMFILE">*/
/*  </parameter>*/
/*  <parameter dependsaction="ENABLE" obfuscate="N" label="SAS program" systemtype="&star;PGM&star;" tabname="System Files" baseoption="A" advanced="N" order="5" id="&star;PGM&star;" canlinktobasepath="Y" protect="N" userdefined="S" filetype="SAS"*/
/*   processid="P9" required="N" resolution="INPUT" enable="N" type="PGMFILE">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="6" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="DIR_ROOT" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="7" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="DEV_PHASE" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="8" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="COMPOUND" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="9" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="ANALY_PHASE" maxlength="256"*/
/*   tabname="Parameters" processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="10" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="REFERENC" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter obfuscate="N" id="ARCMETA" canlinktobasepath="Y" expandfiletypes="N" protect="N" label="Folder" order="11" processid="P9" dependsaction="ENABLE" baseoption="A" resolution="INPUT" advanced="N" required="N" readfiles="Y" enable="N"*/
/*   type="FOLDER" base="BASE_1" writefiles="Y" tabname="Parameters">*/
/*   <fileset setType="0">*/
/*    <sourceContainer system="RELATIVE" source="RELATIVE" displaypath="intrm1/data/shared" displayname="arc_reporting_metadata" id="intrm1/data/shared/arc_reporting_metadata" itemtype="Container" fileinfoversion="3.0">*/
/*    </sourceContainer>*/
/*    <filterList>*/
/*     <item name="ALL">*/
/*     </item>*/
/*    </filterList>*/
/*   </fileset>*/
/*   <description>*/
/*   </description>*/
/*  </parameter>*/
/*  <parameter obfuscate="N" id="LUM_PATH" canlinktobasepath="Y" expandfiletypes="N" protect="N" label="Folder" order="12" processid="P9" baseoption="A" resolution="INPUT" advanced="N" required="N" readfiles="Y" enable="N" type="FOLDER" base="BASE_1"*/
/*   tabname="Parameters" writefiles="N">*/
/*   <fileset setType="0">*/
/*    <sourceContainer system="RELATIVE" source="RELATIVE" displayname="lums" id="lums" itemtype="Container" fileinfoversion="3.0">*/
/*    </sourceContainer>*/
/*    <filterList>*/
/*     <item name="ALL">*/
/*     </item>*/
/*    </filterList>*/
/*   </fileset>*/
/*   <description>*/
/*   </description>*/
/*  </parameter>*/
/*  <parameter tabname="Parameters" id="BUM_PATH" expandfiletypes="N" obfuscate="N" label="Folder" required="N" order="13" baseoption="A" processid="P9" type="FOLDER" enable="N" canlinktobasepath="Y" readfiles="Y" protect="N" advanced="N"*/
/*   dependsaction="ENABLE" writefiles="N" resolution="INPUT">*/
/*   <fileset setType="1">*/
/*    <sourceContainer system="SDD" source="DOMAIN" displaypath="/lillyce/prd/general/bums" displayname="macro_library" id="/lillyce/prd/general/bums/macro_library" itemtype="Container" fileinfoversion="3.0">*/
/*    </sourceContainer>*/
/*    <fileInfoList>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="am_catpvalue_bb.sas" id="am_catpvalue_bb.sas" itemtype="Item" type="sas" version="5" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="am_contstats.sas" id="am_contstats.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="am_count.sas" id="am_count.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="am_count_bb.sas" id="am_count_bb.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="am_kmsummary.sas" id="am_kmsummary.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_ae_rb.sas" id="ar_ae_rb.sas" itemtype="Item" type="sas" version="5" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_aeoverview_rb.sas" id="ar_aeoverview_rb.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_aexover_rb.sas" id="ar_aexover_rb.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_contstats.sas" id="ar_contstats.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_shift.sas" id="ar_shift.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_teabn.sas" id="ar_teabn.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ar_teaebytime_rb.sas" id="ar_teaebytime_rb.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="BUM Central" id="BUM Central" itemtype="Item" type="" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_basepost.sas" id="dt_basepost.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_copy_headers.sas" id="dt_copy_headers.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_deidentify.sas" id="dt_deidentify.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_ecg.sas" id="dt_ecg.sas" itemtype="Item" type="sas" version="5" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_excel2sas.sas" id="dt_excel2sas.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_kmsummary_post.sas" id="dt_kmsummary_post.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_kmsummary_pre.sas" id="dt_kmsummary_pre.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_labcoll.sas" id="dt_labcoll.sas" itemtype="Item" type="sas" version="5" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_labs.sas" id="dt_labs.sas" itemtype="Item" type="sas" version="13" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_labs_crf.sas" id="dt_labs_crf.sas" itemtype="Item" type="sas" version="6" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_make_decodes.sas" id="dt_make_decodes.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_map.sas" id="dt_map.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_map_columns.sas" id="dt_map_columns.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_map_values.sas" id="dt_map_values.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_mixed_pre.sas" id="dt_mixed_pre.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_opps_line_listing.sas" id="dt_opps_line_listing.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_repsubj.sas" id="dt_repsubj.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_repvals.sas" id="dt_repvals.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_repvalsdep.sas" id="dt_repvalsdep.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_scramsubj.sas" id="dt_scramsubj.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_scramvals.sas" id="dt_scramvals.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_seqvis.sas" id="dt_seqvis.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_thin2wide.sas" id="dt_thin2wide.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_title_fnote.sas" id="dt_title_fnote.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_trtasgn.sas" id="dt_trtasgn.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_trtdspn.sas" id="dt_trtdspn.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="dt_wide2thin.sas" id="dt_wide2thin.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_atribs.sas" id="md_atribs.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_build_columns_param.sas" id="md_build_columns_param.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_freqvals.sas" id="md_freqvals.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_mapget.sas" id="md_mapget.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_mkdsn.sas" id="md_mkdsn.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_pkey_relationships.sas" id="md_pkey_relationships.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="md_sort.sas" id="md_sort.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdbuild.sas" id="mdbuild.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdcpput.sas" id="mdcpput.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdmake.sas" id="mdmake.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdmoddt.sas" id="mdmoddt.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdorder.sas" id="mdorder.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdprint.sas" id="mdprint.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="mdshortlong.sas" id="mdshortlong.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk__readme.txt" id="parmchk__readme.txt" itemtype="Item" type="txt" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_default_if.sas7bdat" id="parmchk_default_if.sas7bdat" itemtype="Item" type="sas7bdat" version="17" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_general_info.sas7bdat" id="parmchk_general_info.sas7bdat" itemtype="Item" type="sas7bdat" version="16" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_invalid_if.sas7bdat" id="parmchk_invalid_if.sas7bdat" itemtype="Item" type="sas7bdat" version="16" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_parm_combos.sas7bdat" id="parmchk_parm_combos.sas7bdat" itemtype="Item" type="sas7bdat" version="16" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_parm_values.sas7bdat" id="parmchk_parm_values.sas7bdat" itemtype="Item" type="sas7bdat" version="16" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_parms.sas7bdat" id="parmchk_parms.sas7bdat" itemtype="Item" type="sas7bdat" version="16" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_required_input.sas7bdat" id="parmchk_required_input.sas7bdat" itemtype="Item" type="sas7bdat" version="18" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="parmchk_special.sas7bdat" id="parmchk_special.sas7bdat" itemtype="Item" type="sas7bdat" version="16" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_aeout_bb.sas" id="rp_aeout_bb.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_arc.sas" id="rp_arc.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_forestplot.sas" id="rp_forestplot.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_opps_line_listing.sas" id="rp_opps_line_listing.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_sarc.sas" id="rp_sarc.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_sarc.sas7bdat" id="rp_sarc.sas7bdat" itemtype="Item" type="sas7bdat" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="rp_sarc.xls" id="rp_sarc.xls" itemtype="Item" type="xls" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="tfldef__readme.txt" id="tfldef__readme.txt" itemtype="Item" type="txt" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="tfldef_colheaders.sas7bdat" id="tfldef_colheaders.sas7bdat" itemtype="Item" type="sas7bdat" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_age_years.sas" id="ut_age_years.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_chk_ds.sas" id="ut_chk_ds.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_chk_var.sas" id="ut_chk_var.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_contentest.sas" id="ut_contentest.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_dupword.sas" id="ut_dupword.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_errmsg.sas" id="ut_errmsg.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_find_decodes.sas" id="ut_find_decodes.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_find_long_chars.sas" id="ut_find_long_chars.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_findvar.sas" id="ut_findvar.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_htmlhead.sas" id="ut_htmlhead.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_logical.sas" id="ut_logical.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_marray.sas" id="ut_marray.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_numobs.sas" id="ut_numobs.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_numwords.sas" id="ut_numwords.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_os.sas" id="ut_os.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_pairpval.sas" id="ut_pairpval.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_parmcheck.sas" id="ut_parmcheck.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_parmdef.sas" id="ut_parmdef.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_printest.sas" id="ut_printest.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_putfile.sas" id="ut_putfile.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_quote_token.sas" id="ut_quote_token.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_restore_env.sas" id="ut_restore_env.sas" itemtype="Item" type="sas" version="4" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_saslogcheck.sas" id="ut_saslogcheck.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_select_exclude.sas" id="ut_select_exclude.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_titlstrt.sas" id="ut_titlstrt.sas" itemtype="Item" type="sas" version="3" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_truncate_long_chars.sas" id="ut_truncate_long_chars.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_varlist.sas" id="ut_varlist.sas" itemtype="Item" type="sas" version="2" fileinfoversion="3.0">*/
/*     </file>*/
/*     <file system="RELATIVE" source="RELATIVE" displayname="ut_xpt2ds.sas" id="ut_xpt2ds.sas" itemtype="Item" type="sas" version="1" fileinfoversion="3.0">*/
/*     </file>*/
/*    </fileInfoList>*/
/*    <filterList>*/
/*     <item name="ALL">*/
/*     </item>*/
/*    </filterList>*/
/*   </fileset>*/
/*   <description>*/
/*   </description>*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="14" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="STUDYID" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="15" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="TRT1" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="16" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="TRT2" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="17" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="TRT3" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="18" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="TRT4" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="19" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="TRT5" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter filetype="SAS" tabname="Parameters" id="FORMAT_RHAT" writefile="Y" obfuscate="N" label="Input file" required="N" order="20" baseoption="A" processid="P9" type="INFILE" enable="N" canlinktobasepath="Y" protect="N" advanced="N"*/
/*   base="BASE_1" dependsaction="ENABLE" resolution="INPUT">*/
/*   <default>*/
/*    <file system="RELATIVE" source="RELATIVE" displaypath="intrm1/programs_stat" displayname="format_rhat.sas" id="intrm1/programs_stat/format_rhat.sas" itemtype="Item" type="sas" fileinfoversion="3.0">*/
/*    </file>*/
/*   </default>*/
/*   <description>*/
/*   </description>*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="21" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="STUDY" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="22" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="LS" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter label="Text field" protect="N" obfuscate="N" cdvenable="Y" order="23" cdvrequired="N" enable="N" resolution="INPUT" required="N" canlinktobasepath="N" advanced="N" dependsaction="ENABLE" id="PS" maxlength="256" tabname="Parameters"*/
/*   processid="P9" type="TEXT">*/
/*  </parameter>*/
/*  <parameter obfuscate="N" id="RPTLIB" canlinktobasepath="Y" expandfiletypes="N" protect="N" label="Folder" order="24" processid="P9" dependsaction="ENABLE" baseoption="A" resolution="INPUT" advanced="N" required="N" readfiles="Y" enable="N"*/
/*   type="FOLDER" base="BASE_1" writefiles="Y" tabname="Parameters">*/
/*   <fileset setType="0">*/
/*    <sourceContainer system="RELATIVE" source="RELATIVE" displaypath="intrm1/programs_stat" displayname="tfl_output" id="intrm1/programs_stat/tfl_output" itemtype="Container" fileinfoversion="3.0">*/
/*    </sourceContainer>*/
/*    <filterList>*/
/*     <item name="ALL">*/
/*     </item>*/
/*    </filterList>*/
/*   </fileset>*/
/*   <description>*/
/*   </description>*/
/*  </parameter>*/
/* </parameters>*/
/*</process>*/
/**/
/******PACMAN******************************************PACMAN******/