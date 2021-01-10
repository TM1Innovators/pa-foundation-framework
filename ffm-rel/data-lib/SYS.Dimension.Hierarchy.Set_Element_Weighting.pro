601,100
602,"SYS.Dimension.Hierarchy.Set_Element_Weighting"
562,"NULL"
586,"BLD Dimension List"
585,"BLD Dimension List"
564,
565,"xyErk0T32J[C7kFcF5c3TxPpaPH\:^JhVN>pnQ:IiRrXe__kRuc?[E5uaIUi]RZQMXD4]DwxJT\rCeopi=Ms2H\Zmux<<t71V;_nuO:OLp99@DZSD`G3oP\7q1Nv@UIToG?TI\7UEoznE8Z2_yFGyAPxL7OhN[>P>uzq:NsmvzQdc_7[7e7]gylWjWg]YAbra2?^3buX"
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
571,Default
569,0
592,0
599,1000
560,5
pTargetDimensionName
pTargetHierarchyName
pTargetTotalElement
pTargetHierarchyLevel
pWeightingType
561,5
2
2
2
1
2
590,5
pTargetDimensionName,""
pTargetHierarchyName,""
pTargetTotalElement,""
pTargetHierarchyLevel,0
pWeightingType,""
637,5
pTargetDimensionName,""
pTargetHierarchyName,""
pTargetTotalElement,""
pTargetHierarchyLevel,""
pWeightingType,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,112

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputSubsetName');

sSubset_Create_Process_Name = 'SYS.Dimension.Subset.Create_By_MDX';

sDimension_Name = pTargetDimensionName;
sHierarchy_Name = pTargetHierarchyName;

IF(sHierarchy_Name @= '');
	sHierarchy_Name = sDimension_Name;
ENDIF;

sTarget_Root_Element = pTargetTotalElement;
nTarget_Hierarchy_Level = pTargetHierarchyLevel;


## Create an MDX String to select consolidated elements of the correct level

sMDX_Parent = EXPAND( '{ TM1FILTERBYLEVEL( { TM1DRILLDOWNMEMBER( { [%sDimension_Name%].[%sTarget_Root_Element%] }, ALL, RECURSIVE ) }, %nTarget_Hierarchy_Level%) }' );

## Create static subset from the MDX and set to source of process.

ExecuteProcess( sSubset_Create_Process_Name
	,'pTargetDimension', sDimension_Name
	,'pTargetHierarchy', sHierarchy_Name
	,'pMDXQuery', sMDX_Parent );

sParent_Subset_Name = OutputSubsetName;

## Loop through all the elements in the parent subset

nParent_Element_Index = 1;
nParent_Element_Count = HierarchySubsetGetSize( sDimension_Name, sHierarchy_Name, sParent_Subset_Name );

WHILE( nParent_Element_Index <= nParent_Element_Count );

	IF( sDimension_Name @<> sHierarchy_Name );
		sParent_Element_Name = HierarchySubsetGetElementName( sDimension_Name, sHierarchy_Name, sParent_Subset_Name, nParent_Element_Index );
	ELSE;
		sParent_Element_Name = SubsetGetElementName( sDimension_Name, sParent_Subset_Name, nParent_Element_Index );
	ENDIF;

	## Loop through all the children of the current parent element

	sMDX_Child = EXPAND( '{ EXCEPT({ DRILLDOWNMEMBER( { [%sDimension_Name%].[%sParent_Element_Name%] }, { [%sDimension_Name%].[%sParent_Element_Name%] } ) }, { [%sDimension_Name%].[%sParent_Element_Name%] } )}' );

	ExecuteProcess( sSubset_Create_Process_Name
		,'pTargetDimension', sDimension_Name
		,'pTargetHierarchy', sHierarchy_Name
		,'pMDXQuery', sMDX_Child );

	sChild_Subset_Name = OutputSubsetName;

	nChild_Element_Index = 1;
	nChild_Element_Count = HierarchySubsetGetSize( sDimension_Name, sHierarchy_Name, sChild_Subset_Name );

	WHILE( nChild_Element_Index <= nChild_Element_Count );

		IF( sDimension_Name @<> sHierarchy_Name );
			sChild_Element_Name = HierarchySubsetGetElementName( sDimension_Name, sHierarchy_Name, sChild_Subset_Name, nChild_Element_Index );
		ELSE;
			sChild_Element_Name = SubsetGetElementName( sDimension_Name, sChild_Subset_Name, nChild_Element_Index );
		ENDIF;

		# IF( nChild_Element_Index = 1 );
		# 	ASCIIOUTPUT( '../temp/weightings.txt', sParent_Element_Name );
		# ENDIF;
		# ASCIIOUTPUT( '../temp/weightings.txt', '        ' | sChild_Element_Name );

		## Set the weight of the element depending on the pWeightingType parameter
		## pWeightingType values: '1', '0', 'Average', 'First', 'Last'

		IF( pWeightingType @= '1');
			nCurrent_Element_Weight = 1;
		ENDIF;

		IF( pWeightingType @= '0');
			nCurrent_Element_Weight = 0;
		ENDIF;

		IF( pWeightingType @= 'Average');
			nCurrent_Element_Weight = 1 / nChild_Element_Count;
		ENDIF;

		IF( pWeightingType @= 'First');
			nCurrent_Element_Weight = IF(nChild_Element_Index = 1, 1, 0);
		ENDIF;

		IF( pWeightingType @= 'Last');
			nCurrent_Element_Weight = IF(nChild_Element_Index = nChild_Element_Count, 1, 0);
		ENDIF;

		HierarchyElementComponentDelete( sDimension_Name, sHierarchy_Name, sParent_Element_Name, sChild_Element_Name);
		HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sParent_Element_Name, sChild_Element_Name, nCurrent_Element_Weight );

		nChild_Element_Index = nChild_Element_Index + 1;
	END;

	HierarchySubsetDestroy( sDimension_Name, sHierarchy_Name, sChild_Subset_Name);

	nParent_Element_Index = nParent_Element_Index + 1;
END;





573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

HierarchySubsetDestroy( sDimension_Name, sHierarchy_Name, sParent_Subset_Name);
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
