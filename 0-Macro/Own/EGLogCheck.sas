options nosource nonotes;
proc printto;
run;
** Input log file **;
/* filename LogFile "&LogFile"; */
data _check_a;
    infile LogFile truncover lrecl=30000;
    input;
    length content$30000;
    content=_infile_;
    /* Change ERROR \d-\d to ERROR: */
    content = prxchange('s/ERROR( +\d+-\d+: +)/ERROR:\1/o', 1,content);
    keep content;
run;

** Clean log file **;
data _check_b;
    set _check_a;
    length num num_last $20 content_last $30000;
    retain num ;
    if prxmatch('/^(\d+)\D+.+/o',content) then num= prxchange('s/^(\d+)\D+.+/$1/o',1,content);
    if prxmatch('/^(NOTE:|WARNING:|ERROR:?) /o', content) or prxmatch('/^\d+!? +/o', content) then isline = 'Y';
    num_last     = lag(num);
    content_last = lag(content);
    N + 1;
run;
proc sort; by descending N; run;
data _check_c;
    set _check_b;
    by descending N;
    length txt $30000;
    retain txt;
    txt = catx(byte(255),content,txt);
    if isline = 'Y' then do;
        Output;
        txt = '';
    end;
run;
proc sort;by N; run;

** Define Log check content **;
%let __NOTE_CHECK__ =is uninitialized|Invalid|MERGE statement has more than one data set|values have been converted|Input data set is empty|W.D format|Missing values were generated|Unknown|will be overwritten by|Division by zero|Format was to small;

data _check_d;
    set _check_c;
    length CheckContent PutContent  $200;
    pattern = prxparse("/(?<=^NOTE:).+\b(&__NOTE_CHECK__)\b/o");

    if prxmatch('/(?<=^ERROR).+/o', txt) then do;
        CheckContent = 'ERROR';
        PutContent   = 'ERROR';
    end;
    if prxmatch('/(?<=^WARNING:).+/o', txt) then do;
        CheckContent = 'WARNING';
        PutContent   = 'WARNING';
    end;
    if prxmatch(pattern, txt) then do;
        CheckContent = prxposn(pattern, 1, txt);
        PutContent   = 'WARNING';
        txt = prxchange('s/^NOTE: /WARNING: /o',1,strip(txt));
    end;

    if missing(PutContent) and prxmatch('/^(NOTE: )/o', content) then PutContent = 'NOTE';
    else if missing(PutContent) and ^missing(num) then PutContent = 'PROGRAM';
run;
data a;
    set a;
    format a b.;
run;
*------------------- Put: Log --------------------;
options notes;
data _null_;
    set _check_d;
    number = count(txt, byte(255));
    length log $500;
    do i = 1 to number + 1;
        log = scan(txt, i, byte(255), 'MO');
        if i ne 1 and PutContent = 'NOTE' then putlog 'NOTE-' log;
        else if log = 'NOTE:' then putlog " ";
        else putlog log;
        Output;
    end;
run;
options nonotes;

*------------------- Put: Warning --------------------;
data _check_d;
    set _check_d(where=(^missing(CheckContent)));
    num_1 = num + 1;
    CheckContent_lag = lag(CheckContent);
    num_lag          = lag(num);
    num_last_lag     = lag(num_last);
    if CheckContent = CheckContent_lag and num = num_lag and num_last = num_last_lag then delete;
    keep CheckContent num num_1 num_last;
run;
** Output Log message **;
data _null_;
    if 0 then set _check_d nobs=n;
    if n ne 0 then set _check_d;
    if _n_ =1 and n ne 0 then do;
        putlog @10'-------------------------------------------------------------------------------------------';
        putlog @10'| The following suspicious lines were found when scanning the log:                        |';
        putlog @10'-------------------------------------------------------------------------------------------';
        putlog @10' ';

    end;
    if n ne 0 and missing(num) and missing(num_last) then putlog 'WARNING:' @20 CheckContent @60 '[ Occured on Set-Up]' ;
    if n ne 0 and ^missing(num) then putlog 'WARNING:' @20 CheckContent @60 '[ Occured Between Line ' num '-' num_1 ']';
    if n eq 0 then do;
        putlog /@10'-----------------------------------------------------';
        putlog @10'| No suspicious lines were discovered in the log.  |';
        putlog @10'----------------------------------------------------';
    end;
run;
** Clean library **;
/* proc datasets nolist lib=work memtype=data ;
    delete _check_a _check_b _check_c _check_d ;
run; */
quit;
options source notes;