601,100
602,"SUB.Dimension.Subset.Resolve_Subset_Type"
562,"NULL"
586,
585,
564,
565,"jVi?g_LbHTaWBO34]G<TBid209_ypJTvjAK@a]S_uU_UW1G6Mwenn^1Pzi@t1vG2s44dPRXU4@U>[v2;KBZ;?PwX4JfA7n`H32y1OQa;AS5bo0`x6jDB5>qviKJ0^wc6LrU7mycGv>\VTYQ3@Bgjg]2ODEt]4YqoyPW5So^6_Zws96>\DY1Vx`QF4fvLbWxcj_<K8c:z"
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
560,3
pSubsetType
pDimensionName
pSelectionElement
561,3
2
2
2
590,3
pSubsetType,""
pDimensionName,""
pSelectionElement,""
637,3
pSubsetType,""
pDimensionName,""
pSelectionElement,""
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

StringGlobalVariable('OutputElementName');

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

sSelectionType = ATTRS(sSubsetTypeDimensionName, pSubsetType, 'Selection Type');

IF( sSelectionType @<> 'Single' );
	OutputElementName = '';
	ProcessBreak;
ENDIF;

ExecuteProcess(sUniqueStringCreateProcessName);
sSubsetName = OutputTempName;


573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,27

#****Begin: Generated Statements***
#****End: Generated Statements****

SubsetCreate(pDimensionName, sSubsetName, 1);

IF(pSubsetType @<> '');

	sDimension_Name = pDimensionName;
	sElement_Name = pSelectionElement;
	sMDX = ATTRS(sSubsetTypeDimensionName, pSubsetType, 'MDX');

	SubsetMDXSet(sDimension_Name, sSubsetName, EXPAND(sMDX));
	SubsetMDXSet(sDimension_Name, sSubsetName, '');
ELSE;
	IF(pSelectionElement @<> '');
		SubsetElementInsert(pDimensionName, sSubsetName, pSelectionElement, 1);
	ELSE;
		SubsetIsAllSet(pDimensionName, sSubsetName, 1);
	ENDIF;
ENDIF;

OutputElementName = SubsetGetElementName( pDimensionName, sSubsetName, 1 );

# ASCIIOUTPUT( '..\temp\Resolved.txt', OutputElementName );

SubsetDestroy(pDimensionName, sSubsetName);
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
