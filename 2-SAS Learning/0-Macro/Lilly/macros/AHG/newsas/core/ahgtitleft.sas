%macro AHGtitleft(prefix,ls=223);
%if %AHGblank(&prefix) %then %let prefix=AHG;
%local i;
%do i=1 %to 10;
%global &prefix.title&i &prefix.ft&i;
%if not %AHGblank(%bquote(&&&prefix.title&i)) %then title&i justify=left "%AHGapplyls(%bquote(&&&prefix.title&i),&ls)";
%else title&i;
;
%if not %AHGblank(%bquote(&&&prefix.ft&i)) %then footnote&i justify=left "%AHGapplyls(%bquote(&&&prefix.ft&i),&ls)";
%else footnote&i ;
; 
%end;
%mend;
