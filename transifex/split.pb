F$=ProgramParameter(0)
RootDir$=GetCurrentDirectory()
;Debug F$
If ReadFile(1,F$)
  tf$=""
  While Eof(1) = 0    ; Loop until EOF
    L$=ReadString(1)
    If Left(L$,4)="##@@"
      ; New output file
      If tf$<>""
        CloseFile(2)
      EndIf
      tf$=Trim(L$,"#")
      tf$=Trim(tf$,"@")
      tf$=LTrim(tf$,"\")
      ;Debug tf$
      PathLen = CountString(tf$,"\")
      For i = 1 To PathLen
        CreateDirectory(StringField(tf$,i,"\"))
        SetCurrentDirectory(StringField(tf$,i,"\"))
      Next
      SetCurrentDirectory(RootDir$)
      CreateFile(2,tf$)
    Else
      WriteStringN(2,L$)
    EndIf
  Wend
  CloseFile(2)
  CloseFile(1)
EndIf 

; IDE Options = PureBasic 5.41 LTS (Windows - x86)
; CursorPosition = 2
; EnableUnicode
; EnableXP
; Executable = N:\Dropbox\Public\Palemoon\betatest\split.exe
; CommandLine = en-GB.properties
; CurrentDirectory = e:\1