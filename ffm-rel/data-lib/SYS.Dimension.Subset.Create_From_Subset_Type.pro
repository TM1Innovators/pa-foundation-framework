﻿601,100
602,"SYS.Dimension.Subset.Create_From_Subset_Type"
562,"NULL"
586,
585,
564,
565,"qQOHWH`T6lH3WvI@1a`4[M8P:XI3Tl509ONRCfUw2vBcaSGLLbj5I:njHoV:LClHzcdWtjns]?WEv59BngueX^rj64lkOyCPxc97\Du[<\9K_yDwBZe7zpVEbuHI=;c0xpXx`creL1W^l;SseHEZA]A5uWbtG0TT\CNC@1xsUYaJezW[9FN3DoO]eHxo3X7RERVe>3mv"
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
pSubsetType
pDimensionName
pSelectionElement
pSelectionText
pSubsetName
pOverwrite
561,6
2
2
2
2
2
1
590,6
pSubsetType,""
pDimensionName,""
pSelectionElement,""
pSelectionText,""
pSubsetName,""
pOverwrite,1
637,6
pSubsetType,""
pDimensionName,""
pSelectionElement,""
pSelectionText,""
pSubsetName,""
pOverwrite,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,69

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputSubsetName');

StringGlobalVariable('OutputItem');
StringGlobalVariable('OutputTempName');
StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
StringGlobalVariable('OutputDimensionList');
NumericGlobalVariable('OutputItemCount');

sProcessName = GetProcessName();

sGetDimensionListProcessName = 'SUB.Cube.Dimension.Get_List';
sViewCreateProcessName = 'SYS.Cube.View.Create';

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

sUniqueStringCreateProcessName = 'SUB.Text.String.Create_Unique';

sControlCubeName = 'SYS Control';

sSubsetTypeDimensionName = CellGetS(sControlCubeName, 'Current Environment', 'Subset Type Dimension');
sSubsetTypeDimensionName = IF(sSubsetTypeDimensionName @<> '', sSubsetTypeDimensionName, 'SYS Subset Type');

sSubsetName = '';
IF(pSubsetName @<> '');
	sSubsetName = pSubsetName;
ELSE;
	ExecuteProcess(sUniqueStringCreateProcessName);
	sSubsetName = OutputTempName;
ENDIF;

IF(pOverwrite = 1 & SubsetExists(pDimensionName, sSubsetName) = 1);
	SubsetDestroy(pDimensionName, sSubsetName);
ENDIF;

SubsetCreate(pDimensionName, sSubsetName);

IF(pSubsetType @<> '');

	sDimension_Name = pDimensionName;
	sElement_Name = pSelectionElement;
	sText_Value = pSelectionText;
	sMDX = ATTRS(sSubsetTypeDimensionName, pSubsetType, 'MDX');

	SubsetMDXSet(sDimension_Name, sSubsetName, EXPAND(sMDX));

	IF( pSubsetType @= 'Static');
		SubsetMDXSet(sDimension_Name, sSubsetName, '');
	ENDIF;
ELSE;
	IF(pSelectionElement @<> '');
		SubsetElementInsert(pDimensionName, sSubsetName, pSelectionElement, 1);
	ELSE;
		SubsetIsAllSet(pDimensionName, sSubsetName, 1);
	ENDIF;
ENDIF;

OutputSubsetName = sSubsetName;
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
