601,100
602,"SYS.Dimension.Subset.Create_From_Subset_Type"
562,"NULL"
586,
585,
564,
565,"ptGFQc7N>jMYMjd]a4\F8v63E0UM1O2>OweH[5>pXWtv_Y\2Ts4sSf`V_v=mkd>]JMk<OG`naBQ7AqP@KdSp_BVikEBC6hLE7ww41bvq3C78>=J7C13z\n]mUyEQVerCGeomL<8:xNpPz;\mua`PHrVho8aoJozR5^Axj]YWszw5i`k4gMPoIqVNl3l9s5::29XfCkbr"
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
560,8
pElementType
pDimensionName
pHierarchyName
pSelectionElement
pSelectionText
pSubsetName
pSubsetType
pOverwrite
561,8
2
2
2
2
2
2
2
1
590,8
pElementType,""
pDimensionName,""
pHierarchyName,""
pSelectionElement,""
pSelectionText,""
pSubsetName,""
pSubsetType,"pSubsetType: ""Static"" or ""Dynamic"""
pOverwrite,1
637,8
pElementType,""
pDimensionName,""
pHierarchyName,""
pSelectionElement,""
pSelectionText,""
pSubsetName,""
pSubsetType,""
pOverwrite,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,79

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

sSubsetTypeDimensionName = CellGetS( sControlCubeName, 'Current Environment', 'Subset Type Dimension' );
sSubsetTypeDimensionName = IF( sSubsetTypeDimensionName @<> '', sSubsetTypeDimensionName, 'SYS Subset Type' );

sSubsetName = '';
IF(pSubsetName @<> '');
	sSubsetName = pSubsetName;
ELSE;
	ExecuteProcess(sUniqueStringCreateProcessName);
	sSubsetName = OutputTempName;
ENDIF;


sDimension_Name = pDimensionName;
sHierarchy_Name = IF( pHierarchyName @<> '', pHierarchyName, sDimension_Name );

IF( HierarchySubsetExists( sDimension_Name, sHierarchy_Name, sSubsetName) = 1);
	IF( pOverwrite = 1 );
	 	HierarchySubsetMDXSet( sDimension_Name, sHierarchy_Name, sSubsetName, '' );
		HierarchySubsetDeleteAllElements( sDimension_Name, sHierarchy_Name, sSubsetName );
	ELSE;
		ItemReject( 'The subset already exists. To overwrite the subset, set the pOverwrite parameter to 1. Exiting process.' );
		ProcessError;
	ENDIF;
ELSE;
	HierarchySubsetCreate( sDimension_Name, sHierarchy_Name, sSubsetName );
ENDIF;


IF(pElementType @<> '');

	sElement_Name = pSelectionElement;
	sText_Value = pSelectionText;
	sMDX = ATTRS( sSubsetTypeDimensionName, pElementType, 'MDX' );

	HierarchySubsetMDXSet( sDimension_Name, sHierarchy_Name, sSubsetName, EXPAND( sMDX ));

	IF( pSubsetType @<> 'Dynamic');
		HierarchySubsetMDXSet( sDimension_Name, sHierarchy_Name, sSubsetName, '' );
	ENDIF;
ELSE;
	IF(pSelectionElement @<> '');
		HierarchySubsetElementInsert(pDimensionName, sHierarchy_Name, sSubsetName, pSelectionElement, 1);
	ELSE;
		HierarchySubsetIsAllSet(pDimensionName, sHierarchy_Name, sSubsetName, 1);
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
