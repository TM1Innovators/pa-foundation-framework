601,100
602,"Sub.Text.Filter_Chars"
562,"NULL"
586,
585,
564,
565,"n;6dfxp\0J1=oCa6HEy4zwuR:q`VLLCf@nTKW<CrH\fR`TcW`2biClCVB82:VhIoEOjP<VWA4WI]VUy@`nyuuIWyyYDp^VNpmrc7\Hd[4>:wsL6A@TSVhMG?CHd`q5xx<7^NWm1tEGetRe;H]<5<6kq:8]_4_85<@eoGQGwn;Bd_Ipm?iKPlm?09j@_V\FG0u@akGa9m"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,5
pInputText
pValidCharacters
pReplaceInvalidWith
pReplaceLeadingCharacters
pReplaceTrailingCharacters
561,5
2
2
2
2
2
590,5
pInputText,""
pValidCharacters,"}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-."
pReplaceInvalidWith,"_"
pReplaceLeadingCharacters,"No"
pReplaceTrailingCharacters,"No"
637,5
pInputText,"pInputText: the text on which to base the filtered string."
pValidCharacters,"pValidCharacters: A string containing all the valid characters allowed to remain in the pInputText."
pReplaceInvalidWith,"pReplaceInvalidWith: Text with which to replace invalid characters."
pReplaceLeadingCharacters,"pReplaceLeadingCharacters: Set to No if you'd rather remove invalid characters from the start of the string without substituting."
pReplaceTrailingCharacters,"pReplaceTrailingCharacters: Set to No if you'd rather remove invalid characters from the end of the string without substituting."
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,47

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputFilteredText');

sValidCharacters = pValidCharacters;
sReplaceInvalidWith = pReplaceInvalidWith;
sReplaceLeadingCharacters = LOWER(SUBST(pReplaceLeadingCharacters, 1, 1));
sReplaceTrailingCharacters = LOWER(SUBST(pReplaceTrailingCharacters, 1, 1));

nCharCount = LONG( pInputText );

IF(nCharCount = 0);
	ItemReject('Zero length string provided');
	ProcessQuit;
ENDIF;

sFilteredString = '';
sCurrentChar = '';

nValidLeadingChar = 0;
nCharIndex = 1;
nReplaced = IF( sReplaceLeadingCharacters @= 'y', 0, 1);

WHILE(nCharIndex <= nCharCount);
	sCurrentChar = SUBST(pInputText, nCharIndex, 1);

	IF(SCAN(sCurrentChar, sValidCharacters) <> 0);
		sFilteredString = sFilteredString | sCurrentChar;
		nReplaced = 0;
	ELSE;
		sFilteredString = sFilteredString | IF(nReplaced = 1, '', sReplaceInvalidWith);
		nReplaced = 1;
	ENDIF;

	nCharIndex = nCharIndex + 1;
END;


IF( sReplaceTrailingCharacters @<> 'y' );
	sLastCharacter = SUBST( sFilteredString, LONG( sFilteredString ), 1);
	sFilteredString = IF( sLastCharacter @= sReplaceInvalidWith, SUBST( sFilteredString, 1, LONG( sFilteredString ) - 1 ), sFilteredString );
ENDIF;

OutputFilteredText = sFilteredString;
# ASCIIOUTPUT('..\Temp\Filtered.txt', sFilteredString);
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
