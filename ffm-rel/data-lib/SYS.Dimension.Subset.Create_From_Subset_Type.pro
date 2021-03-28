601,100
602,"SYS.Dimension.Subset.Create_From_Subset_Type"
562,"NULL"
586,
585,
564,
565,"vfSmAVLTIz^^[ky6sfMqY5apMCunAwk8v\w@]Jvlt\4GrIowk5H2B@c>cDR9eDiN5t1=pfL?s_bpzD=I;c=Y44k4_wx2ri@C7wLdAl67SW_fst3a8@vD]qg=mglg9q^uZ[F7e]=y<r3y@fEWh5yflWULTt7swyRogasIhRG0c[0cF6t\NfAJBifCZ:xaVrZdlxO_QxzL"
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
560,7
pSubsetType
pDimensionName
pHierarchyName
pSelectionElement
pSelectionText
pSubsetName
pOverwrite
561,7
2
2
2
2
2
2
1
590,7
pSubsetType,""
pDimensionName,""
pHierarchyName,""
pSelectionElement,""
pSelectionText,""
pSubsetName,""
pOverwrite,1
637,7
pSubsetType,""
pDimensionName,""
pHierarchyName,""
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


IF(pSubsetType @<> '');

	sElement_Name = pSelectionElement;
	sText_Value = pSelectionText;
	sMDX = ATTRS( sSubsetTypeDimensionName, pSubsetType, 'MDX' );

	HierarchySubsetMDXSet( sDimension_Name, sHierarchy_Name, sSubsetName, EXPAND( sMDX ));

	IF( pSubsetType @= 'Static');
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
