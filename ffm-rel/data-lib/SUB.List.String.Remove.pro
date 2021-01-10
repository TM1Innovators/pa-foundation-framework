601,100
602,"SUB.List.String.Remove"
562,"NULL"
586,
585,
564,
565,"n55ykqTn2Yry2eadUb7_89FW<]Pbd:3SJiTLLR?EcmQ[CR>ZSx:i66thSKpA_CiOjCz2AM:=QCObe6]B1CLq=aP>E^NfmDFpsI0111r^X1]M0p<?^gvxo8v`DhXuVF71o<Fn7ZjJKnUUbZ:kB;fUZoFO2I1>PAhK[7PoY;yYyfSGHSgFKYZGIMH5Co`8?<s4_k_asWjp"
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
pItemList
pItemIndex
pItemSeparator
pItemQuoteCharacterStart
pItemQuoteCharacterEnd
561,5
2
1
2
2
2
590,5
pItemList,"A, B, C, D"
pItemIndex,4
pItemSeparator,","
pItemQuoteCharacterStart,""""
pItemQuoteCharacterEnd,""
637,5
pItemList,""
pItemIndex,""
pItemSeparator,""
pItemQuoteCharacterStart,""
pItemQuoteCharacterEnd,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,41

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputItemList');

StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemLocation');

sProcessName = GetProcessName();

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

nItemSeparatorLength = LONG(pItemSeparator);

sItemQuoteCharacterStart = pItemQuoteCharacterStart;
IF(pItemQuoteCharacterEnd @= '');
	sItemQuoteCharacterEnd = sItemQuoteCharacterStart;
ELSE;
	sItemQuoteCharacterEnd = pItemQuoteCharacterEnd;
ENDIF;

nItemQuoteCharacterStartLength = LONG(sItemQuoteCharacterStart);
nItemQuoteCharacterEndLength = LONG(sItemQuoteCharacterEnd);

ExecuteProcess(sListStringReadProcessName, 'pItemList', pItemList, 'pItemSeparator', pItemSeparator, 'pItemQuoteCharacterStart', pItemQuoteCharacterStart, 'pItemQuoteCharacterEnd', pItemQuoteCharacterEnd, 'pItemIndex', pItemIndex);
sOutputItem = OutputItem;
nOutputItemLocation = OutputItemLocation;

IF(nOutputItemLocation >= LONG(pItemList));
	OutputItemList = SUBST(pItemList, 1, nOutputItemLocation - 1);
ELSE;
	OutputItemList = SUBST(pItemList, 1, nOutputItemLocation - 1) | SUBST(pItemList, nOutputItemLocation + LONG(sOutputItem) + nItemSeparatorLength, 99999);
ENDIF;
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
1217,1
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
