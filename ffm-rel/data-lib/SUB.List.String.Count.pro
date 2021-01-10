601,100
602,"SUB.List.String.Count"
562,"NULL"
586,
585,
564,
565,"u^0mp0uzIS;i89dTZ0>l>ahL`4[`PJI0en>65^E<;AyGM\]sEAEyxWa?CmS3=vH>\dRFS>omEZavqSC:tzz7sfeyaF7lzQr;zzFlVptbTnnc<J;:dsoc1\WLAKvVGfRii9R9b4wPHrH>=N>CImCGmNL;<Ze>\Ns8>BbGaEucJgCi09nAKPngnbWuRaAbbyG\kkq:Qb<Q"
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
560,4
pItemList
pItemSeparator
pItemQuoteCharacterStart
pItemQuoteCharacterEnd
561,4
2
2
2
2
590,4
pItemList,"A, B, C, D"
pItemSeparator,","
pItemQuoteCharacterStart,""""
pItemQuoteCharacterEnd,""
637,4
pItemList,""
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
572,37

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputItemList');
NumericGlobalVariable('OutputItemCount');

StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemIndex');
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

ExecuteProcess(sListStringReadProcessName, 'pItemList', pItemList, 'pItemSeparator', pItemSeparator, 'pItemQuoteCharacterStart', pItemQuoteCharacterStart, 'pItemQuoteCharacterEnd', pItemQuoteCharacterEnd, 'pItemIndex', 99999);

OutputItemCount = OutputItemIndex;
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
