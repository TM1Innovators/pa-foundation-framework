601,100
602,"SYS.Cube.View.Create_Temp"
562,"NULL"
586,
585,
564,
565,"v3WiYDchQ[b:t\bZcnbIHwaLQy9\oAw>so\j97o:_2T2a;QMUS24kTK`ZGxa;mk8kzkk8]Jw4\;31G`VSCAlIYAiOxqt6QQ;pmQgp:QhffoMic[qMWAkjMe?[aWjNtcUhVtd=z40DDOucv6[p;kCM5n4V11;7hQC0M=lm>:g6udFFK>meC8:jl4AeA?Nv[<FB^IT0Rl0"
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
560,9
pCubeName
pViewName
pSubsetName
pSubsetTypeList
pSubsetElementList
pSkipZero
pSkipConsolidated
pSkipCalculated
pOverwriteView
561,9
2
2
2
2
2
1
1
1
1
590,9
pCubeName,""
pViewName,""
pSubsetName,""
pSubsetTypeList,""
pSubsetElementList,""
pSkipZero,1
pSkipConsolidated,1
pSkipCalculated,1
pOverwriteView,0
637,9
pCubeName,""
pViewName,""
pSubsetName,""
pSubsetTypeList,""
pSubsetElementList,""
pSkipZero,""
pSkipConsolidated,""
pSkipCalculated,""
pOverwriteView,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,131

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputItem');
StringGlobalVariable('OutputTempName');
StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
StringGlobalVariable('OutputDimensionList');
NumericGlobalVariable('OutputItemCount');

sProcessName = GetProcessName();

sGetDimensionListProcessName = 'SUB.Cube.Dimension.Get_List';
sViewCreateProcessName = 'SYS.Cube.View.Create';
sCreate_Subset_Type_Process_Name = 'SYS.Dimension.Subset.Create_From_Subset_Type';

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

sUniqueStringCreateProcessName = 'SUB.Text.String.Create_Unique';

sSubsetTypeDimensionName = CellGetS('SYS Control', 'Current Environment', 'Subset Type Dimension');
sSubsetTypeDimensionName = IF(sSubsetTypeDimensionName @<> '', sSubsetTypeDimensionName, 'SYS Subset Type');

ExecuteProcess(sGetDimensionListProcessName, 'pCubeName', pCubeName);
sDimensionList = OutputDimensionList;

ExecuteProcess(sListStringCountProcessName, 'pItemList', sDimensionList);
nDimensionCount = OutputItemCount;

sViewName = '';
IF(pViewName @<> '');
	sViewName = pViewName;
ELSE;
	ExecuteProcess(sUniqueStringCreateProcessName);
	sViewName = OutputTempName;
ENDIF;

sSubsetName = '';
IF(pSubsetName @<> '');
	sSubsetName = pSubsetName;
ELSE;
	ExecuteProcess(sUniqueStringCreateProcessName);
	sSubsetName = OutputTempName;
ENDIF;

IF( ViewExists( pCubeName, sViewName)= 1 & pOverwriteView <> 0 );
	ViewDestroy( pCubeName, sViewName);
ENDIF;

sTitleDimensionList = '';
sColumnDimensionList = '';
sRowDimensionList = '';
sTitleSubsetList = '';
sColumnSubsetList = '';
sRowSubsetList = '';

nCurrentDimensionIndex = 1;

WHILE(nCurrentDimensionIndex <= nDimensionCount);

	ExecuteProcess(sListStringReadProcessName, 'pItemList', sDimensionList, 'pItemIndex', nCurrentDimensionIndex, 'pTrimQuoteCharacters', 1);
	sCurrentDimensionName = OutputItem;

	ExecuteProcess(sListStringReadProcessName, 'pItemList', pSubsetTypeList, 'pItemIndex', nCurrentDimensionIndex, 'pTrimQuoteCharacters', 1);
	sCurrentSubsetTypeName = OutputItem;

	ExecuteProcess(sListStringReadProcessName, 'pItemList', pSubsetElementList, 'pItemIndex', nCurrentDimensionIndex, 'pTrimQuoteCharacters', 1);
	sCurrentSubsetElementName = OutputItem;

	## Create a subset based on the current SubsetType
	ExecuteProcess( sCreate_Subset_Type_Process_Name
		,'pSubsetType', sCurrentSubsetTypeName
		,'pDimensionName', sCurrentDimensionName
		,'pSelectionElement', sCurrentSubsetElementName
		,'pSubsetName', sSubsetName
		,'pOverwrite', 1 );

	IF(nCurrentDimensionIndex <= nDimensionCount - 2);
		sTitleDimensionList = sTitleDimensionList | sCurrentDimensionName | ',';
		sTitleSubsetList = sTitleSubsetList | sSubsetName | ',';
	ELSEIF(nCurrentDimensionIndex = nDimensionCount - 1);
		sRowDimensionList = sRowDimensionList | sCurrentDimensionName | ',';
		sRowSubsetList = sRowSubsetList | sSubsetName | ',';
	ELSEIF(nCurrentDimensionIndex = nDimensionCount);
		sColumnDimensionList = sColumnDimensionList | sCurrentDimensionName | ',';
		sColumnSubsetList = sColumnSubsetList | sSubsetName | ',';
	ENDIF;

	nCurrentDimensionIndex = nCurrentDimensionIndex + 1;
END;


IF(sTitleDimensionList @<> '');
	sTitleDimensionList = SUBST(sTitleDimensionList, 1, LONG(sTitleDimensionList) -1);
	sTitleSubsetList = SUBST(sTitleSubsetList, 1, LONG(sTitleSubsetList) -1);
ENDIF;

IF(sColumnDimensionList @<> '');
	sColumnDimensionList = SUBST(sColumnDimensionList, 1, LONG(sColumnDimensionList) -1);
	sColumnSubsetList = SUBST(sColumnSubsetList, 1, LONG(sColumnSubsetList) -1);
ENDIF;

IF(sRowDimensionList @<> '');
	sRowDimensionList = SUBST(sRowDimensionList, 1, LONG(sRowDimensionList) -1);
	sRowSubsetList = SUBST(sRowSubsetList, 1, LONG(sRowSubsetList) -1);
ENDIF;

OutputViewName = sViewName;
OutputSubsetName = sSubsetName;

ExecuteProcess(sViewCreateProcessName, 
	'pCubeName', pCubeName, 
	'pViewName', sViewName, 
	'pTitleDimensionList', sTitleDimensionList, 
	'pTitleSubsetList', sTitleSubsetList,
	'pColumnDimensionList', sColumnDimensionList,
	'pColumnSubsetList', sColumnSubsetList,
	'pRowDimensionList', sRowDimensionList,
	'pRowSubsetList', sRowSubsetList,
	'pSkipZero', pSkipZero,
	'pSkipConsolidated', pSkipConsolidated,
	'pSkipCalculated', pSkipCalculated,
	'pOverwriteView', pOverwriteView);
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
