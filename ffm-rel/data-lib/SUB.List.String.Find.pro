601,100
602,"SUB.List.String.Find"
562,"NULL"
586,
585,
564,
565,"vh0F`OsG?8pk;umssbSnbeauX[t`]kKdiRtFCA<Mu0zd>gZsz7P\4I]e0>XqcnDyzEcpX?Mgip8Gi]krpArfWsAn2s<eT8=JvcXVXdJFt_o32P9sy@C0]OqK<kXfPr_Sp2hw@FpaeYZ2ha91rFsz]FnCYiySfZS8mZZR\[zhcc[:c>C@BE[7P6SunLRS3FYB?M?Lk8P="
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
pSearchItem
pItemSeparator
pItemQuoteCharacterStart
pItemQuoteCharacterEnd
561,5
2
2
2
2
2
590,5
pItemList,"A, B, C, D"
pSearchItem,"D, E"
pItemSeparator,","
pItemQuoteCharacterStart,""""
pItemQuoteCharacterEnd,""
637,5
pItemList,""
pSearchItem,""
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
572,56

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

NumericGlobalVariable('OutputSearchItemIndex');

StringGlobalVariable('OutputItemList');
StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemIndex');
NumericGlobalVariable('OutputItemLocation');

sList_Add_Process_Name = 'SUB.List.String.Add';
sList_Count_Process_Name = 'SUB.List.String.Count';
sList_Find_Process_Name = 'SUB.List.String.Find';
sList_Read_Process_Name = 'SUB.List.String.Read';
sList_Remove_Process_Name = 'SUB.List.String.Remove';
sList_Replace_Process_Name = 'SUB.List.String.Replace';

vProcessName = GetProcessName();
vItemSeparatorLength = LONG(pItemSeparator);

vItemQuoteCharacterStart = pItemQuoteCharacterStart;
IF(pItemQuoteCharacterEnd @= '');
	vItemQuoteCharacterEnd = vItemQuoteCharacterStart;
ELSE;
	vItemQuoteCharacterEnd = pItemQuoteCharacterEnd;
ENDIF;

vItemQuoteCharacterStartLength = LONG(vItemQuoteCharacterStart);
vItemQuoteCharacterEndLength = LONG(vItemQuoteCharacterEnd);

IF(SCAN(pItemSeparator, pSearchItem) <> 0);
	vSearchItem = vItemQuoteCharacterStart | pSearchItem | vItemQuoteCharacterEnd;
ELSE;
	vSearchItem = pSearchItem;
ENDIF;

vCurrentItemIndex = 1;
vCurrentItem = '?';
vSearchItemIndex = 0;

WHILE(vCurrentItem @<> '' & vSearchItemIndex = 0);

	ExecuteProcess( sList_Read_Process_Name, 'pItemList', pItemList, 'pItemIndex', vCurrentItemIndex);
	vCurrentItem = OutputItem;

	IF(vCurrentItem @= vSearchItem);
		vSearchItemIndex =  vCurrentItemIndex;
	ENDIF;

	vCurrentItemIndex = vCurrentItemIndex + 1;
END;

OutputSearchItemIndex = vSearchItemIndex;
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
