; 如果 INI 檔未定義用此檔來取代
; 用法: ${ReadINIStrWithDefault} OUTPUT_VALUE INI_FILENAME SECTION_NAME ENTRY_NAME DEFAULT_VALUE
; ================================================================================================

Function ReadINIStrWithDefault
	;開始
	ClearErrors
	
	;Get our parameters
	Exch $0 ;DEFAULT_VALUE
	Exch
	Exch $1 ;ENTRY_NAME
	Exch 2
	Exch $2 ;SECTION_NAME
	Exch  3
	Exch $3 ;INI_FILENAME
	Push $4 ;OUTPUT_VALUE
	
	;從 INI 讀取
	ReadINIStr $4 $3 $2 $1
	IfErrors 0 +3
		StrCpy $4 $0
		ClearErrors

	;保留最後的變數
	StrCpy $0 $4
	
	;清除堆疊
	Pop $4
	Pop $3
	Exch 2
	Pop $2
	Pop $1
	
	;重設最後的變數並留下結果
	Exch $0
FunctionEnd

!macro ReadINIStrWithDefault OUTPUT_VALUE INI_FILENAME SECTION_NAME ENTRY_NAME DEFAULT_VALUE
  Push `${INI_FILENAME}`
  Push `${SECTION_NAME}`
  Push `${ENTRY_NAME}`
  Push `${DEFAULT_VALUE}`
  Call ReadINIStrWithDefault
  Pop `${OUTPUT_VALUE}`
!macroend

!define ReadINIStrWithDefault '!insertmacro "ReadINIStrWithDefault"'