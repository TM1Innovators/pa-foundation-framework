﻿601,100
602,"SUB.List.String.Add"
562,"NULL"
586,
585,
564,
565,"fEB^aRaKqeVskXOvnsE=Zu5C7sA;vBS_[V`u^u`iiz0mEHj:uhPx_8H=98:5uouPaUC<WIU;\^mPTOS8uevGGk\dD5MOvw;WQrEjD`N\wQ6I9NiStBmYzVbIot16BbFS^>C\`p9H?2iL1_Q?SrpAR6j9FviBQcYAkq_OxX7Nkj^TqbjL5F>6jjZT_HUXFy4q0uJXA_MS"
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
560,6
pItemList
pItemIndex
pItemSeparator
pItemQuoteCharacterStart
pItemQuoteCharacterEnd
pNewItem
561,6
2
1
2
2
2
2
590,6
pItemList,""
pItemIndex,0
pItemSeparator,","
pItemQuoteCharacterStart,""""
pItemQuoteCharacterEnd,""
pNewItem,""
637,6
pItemList,""
pItemIndex,""
pItemSeparator,""
pItemQuoteCharacterStart,""
pItemQuoteCharacterEnd,""
pNewItem,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,45

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputItemList');

StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemLocation');

vProcessName = GetProcessName();

IF(pItemList @= '');
	OutputItemList = pNewItem;
	OutputItem = pNewItem;
	OutputItemLocation = 1;
	ProcessBreak;
ENDIF;

vItemSeparatorLength = LONG(pItemSeparator);

vItemQuoteCharacterStart = pItemQuoteCharacterStart;
IF(pItemQuoteCharacterEnd @= '');
	vItemQuoteCharacterEnd = vItemQuoteCharacterStart;
ELSE;
	vItemQuoteCharacterEnd = pItemQuoteCharacterEnd;
ENDIF;

vItemQuoteCharacterStartLength = LONG(vItemQuoteCharacterStart);
vItemQuoteCharacterEndLength = LONG(vItemQuoteCharacterEnd);

IF(SCAN(pItemSeparator, pNewItem) <> 0);
	vNewItem = vItemQuoteCharacterStart | pNewItem | vItemQuoteCharacterEnd;
ELSE;
	vNewItem = pNewItem;
ENDIF;

ExecuteProcess('SUB.List.String.Read', 'pItemList', pItemList, 'pItemSeparator', pItemSeparator, 'pItemQuoteCharacterStart', pItemQuoteCharacterStart, 'pItemQuoteCharacterEnd', pItemQuoteCharacterEnd, 'pItemIndex', pItemIndex);

IF(OutputItemLocation >= LONG(pItemList));
	OutputItemList = SUBST(pItemList, 1, OutputItemLocation) | pItemSeparator | vNewItem;
ELSE;
	OutputItemList = SUBST(pItemList, 1, OutputItemLocation - 1) | vNewItem | pItemSeparator | SUBST(pItemList, OutputItemLocation, 99999);
ENDIF;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,5

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
