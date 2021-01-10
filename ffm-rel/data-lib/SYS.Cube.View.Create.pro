601,100
602,"SYS.Cube.View.Create"
562,"NULL"
586,
585,
564,
565,"sTWRWbN5H7uzpEm[BbeagwVNeJ\CA8o0BV5=wfHx>00[p=?V93N8oCoNFg6<d^Nh_9:^O:AHAx;MOaDdX_l@OCVzMvTjXeyWB\nrbRta95ukrlh>@rRUb:rLYv5XqMAbe_;v;dzQ:3[@rz6qsk3MfDLee;<?I^qdMp<Zh2jj@^GoUHF2;7ZyVCqA?_Pm=hErjoy1h`_F"
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
560,15
pCubeName
pViewName
pTitleDimensionList
pTitleSubsetList
pColumnDimensionList
pColumnSubsetList
pRowDimensionList
pRowSubsetList
pSuppressZero
pSkipZero
pSkipConsolidated
pSkipCalculated
pOverwriteView
pListSeparator
pQuoteCharacter
561,15
2
2
2
2
2
2
2
2
1
1
1
1
1
2
2
590,15
pCubeName,""
pViewName,""
pTitleDimensionList,""
pTitleSubsetList,""
pColumnDimensionList,""
pColumnSubsetList,""
pRowDimensionList,""
pRowSubsetList,""
pSuppressZero,0
pSkipZero,1
pSkipConsolidated,1
pSkipCalculated,1
pOverwriteView,0
pListSeparator,","
pQuoteCharacter,""""
637,15
pCubeName,""
pViewName,""
pTitleDimensionList,""
pTitleSubsetList,""
pColumnDimensionList,""
pColumnSubsetList,""
pRowDimensionList,""
pRowSubsetList,""
pSuppressZero,""
pSkipZero,""
pSkipConsolidated,""
pSkipCalculated,""
pOverwriteView,""
pListSeparator,""
pQuoteCharacter,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,99

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputItem');
StringGlobalVariable('OutputItemList');

sProcessName = GetProcessName;

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

IF(pOverwriteView = 1);
	ViewDestroy(pCubeName, pViewName);
ENDIF;

## Create the view
ViewCreate(pCubeName, pViewName);

## Set the title dimensions
DimensionListString = pTitleDimensionList;
SubsetListString = pTitleSubsetList;

WHILE(DimensionListString @<> '');
	ExecuteProcess(sListStringReadProcessName, 'pItemList', DimensionListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter, 'pTrimWhitespace', 1);
	DimensionString = OutputItem;
	ExecuteProcess(sListStringRemoveProcessName, 'pItemList', DimensionListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter);
	DimensionListString = OutputItemList;

	IF(DimensionString @<> '');
		ViewTitleDimensionSet(pCubeName, pViewName, DimensionString);
	ENDIF;

	ExecuteProcess(sListStringReadProcessName, 'pItemList', SubsetListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter, 'pTrimWhitespace', 1);
	SubsetString = OutputItem;
	ExecuteProcess(sListStringRemoveProcessName, 'pItemList', SubsetListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter);
	SubsetListString = OutputItemList;

	IF(SubsetExists(DimensionString, SubsetString) = 1);
		ViewSubsetAssign(pCubeName, pViewName, DimensionString, SubsetString);
	ENDIF;
END;

## Set the column dimensions
DimensionListString = pColumnDimensionList;
SubsetListString = pColumnSubsetList;

WHILE(DimensionListString @<> '');
	ExecuteProcess(sListStringReadProcessName, 'pItemList', DimensionListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter, 'pTrimWhitespace', 1);
	DimensionString = OutputItem;
	ExecuteProcess(sListStringRemoveProcessName, 'pItemList', DimensionListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter);
	DimensionListString = OutputItemList;

	IF(DimensionString @<> '');
		ViewColumnDimensionSet(pCubeName, pViewName, DimensionString,99);
	ENDIF;

	ExecuteProcess(sListStringReadProcessName, 'pItemList', SubsetListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter, 'pTrimWhitespace', 1);
	SubsetString = OutputItem;
	ExecuteProcess(sListStringRemoveProcessName, 'pItemList', SubsetListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter);
	SubsetListString = OutputItemList;

	IF(SubsetExists(DimensionString, SubsetString) = 1);
		ViewSubsetAssign(pCubeName, pViewName, DimensionString, SubsetString);
	ENDIF;
END;

## Set the row dimensions
DimensionListString = pRowDimensionList;
SubsetListString = pRowSubsetList;

WHILE(DimensionListString @<> '');
	ExecuteProcess(sListStringReadProcessName, 'pItemList', DimensionListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter, 'pTrimWhitespace', 1);
	DimensionString = OutputItem;
	ExecuteProcess(sListStringRemoveProcessName, 'pItemList', DimensionListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter);
	DimensionListString = OutputItemList;

	IF(DimensionString @<> '');
		ViewRowDimensionSet(pCubeName, pViewName, DimensionString,99);
	ENDIF;

	ExecuteProcess(sListStringReadProcessName, 'pItemList', SubsetListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter, 'pTrimWhitespace', 1);
	SubsetString = OutputItem;
	ExecuteProcess(sListStringRemoveProcessName, 'pItemList', SubsetListString, 'pItemIndex', 1, 'pItemSeparator', pListSeparator, 'pItemQuoteCharacterStart', pQuoteCharacter, 'pItemQuoteCharacterEnd', pQuoteCharacter);
	SubsetListString = OutputItemList;

	IF(SubsetExists(DimensionString, SubsetString) = 1);
		ViewSubsetAssign(pCubeName, pViewName, DimensionString, SubsetString);
	ENDIF;
END;

ViewSuppressZeroesSet(pCubeName, pViewName, pSuppressZero);
ViewExtractSkipCalcsSet(pCubeName, pViewName, pSkipConsolidated);
ViewExtractSkipZeroesSet(pCubeName, pViewName, pSkipZero);
ViewExtractSkipRuleValuesSet(pCubeName, pViewName, pSkipCalculated);
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
