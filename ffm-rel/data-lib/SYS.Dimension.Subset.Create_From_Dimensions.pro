601,100
602,"SYS.Dimension.Subset.Create_From_Dimensions"
562,"NULL"
586,
585,
564,
565,"zo]XY;o6[8Y]CUHJ@k3O2KUyr<a79K_DbPnESd2dZXs`UW^`Xbqw4v_JsWe<>9wNqu9nh`<e`WB8=LX8xV<=Y<:a89X\KAfZ]17EEV0Mz[^X@KtmTE;LDRYyeFJeOVCIoO^?Si]kg\]@?LvrBsz<tfvmr[dA?^OJF>uOyEEfBhyOSOB10WazFf<@39]rjyt4;;BmnP?;"
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
560,20
pTargetDimension
pTargetHierarchy
pIteratorDimension1
pIteratorHierarchy1
pIteratorSubsetName1
pIteratorDimension2
pIteratorHierarchy2
pIteratorSubsetName2
pIteratorDimension3
pIteratorHierarchy3
pIteratorSubsetName3
pSubsetNameTemplate
pElementNameTemplate
pTextValueTemplate
pMDXQueryTemplate
pDisplayAlias
pExpandType
pSubsetType
pSortType
pSortDirection
561,20
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
590,20
pTargetDimension,""
pTargetHierarchy,""
pIteratorDimension1,""
pIteratorHierarchy1,""
pIteratorSubsetName1,""
pIteratorDimension2,""
pIteratorHierarchy2,""
pIteratorSubsetName2,""
pIteratorDimension3,""
pIteratorHierarchy3,""
pIteratorSubsetName3,""
pSubsetNameTemplate,""
pElementNameTemplate,""
pTextValueTemplate,""
pMDXQueryTemplate,""
pDisplayAlias,""
pExpandType,""
pSubsetType,""
pSortType,""
pSortDirection,""
637,20
pTargetDimension,""
pTargetHierarchy,""
pIteratorDimension1,""
pIteratorHierarchy1,""
pIteratorSubsetName1,""
pIteratorDimension2,""
pIteratorHierarchy2,""
pIteratorSubsetName2,""
pIteratorDimension3,""
pIteratorHierarchy3,""
pIteratorSubsetName3,""
pSubsetNameTemplate,""
pElementNameTemplate,""
pTextValueTemplate,""
pMDXQueryTemplate,""
pDisplayAlias,""
pExpandType,""
pSubsetType,""
pSortType,""
pSortDirection,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,118

#****Begin: Generated Statements***
#****End: Generated Statements****

nError_Occurred = 0;
sError_Message = '';

sDimension_Name = pTargetDimension;
sHierarchy_Name = IF( pTargetHierarchy @= '', sDimension_Name, pTargetHierarchy );

sDimension1 = pIteratorDimension1;
sHierarchy1 = IF( pIteratorHierarchy1 @= '', sDimension1, pIteratorHierarchy1 );
sSubsetName1 = pIteratorSubsetName1;

sDimension2 = pIteratorDimension2;
sHierarchy2 = IF( pIteratorHierarchy2 @= '', sDimension2, pIteratorHierarchy2 );
sSubsetName2 = pIteratorSubsetName2;

sDimension3 = pIteratorDimension3;
sHierarchy3 = IF( pIteratorHierarchy3 @= '', sDimension3, pIteratorHierarchy3 );
sSubsetName3 = pIteratorSubsetName3;

sDisplay_Alias = pDisplayAlias;
sExpand_Type = pExpandType;
sSubset_Type = pSubsetType;

sSort_Type = pSortType;
sSort_Direction = pSortDirection;

IF( sDimension1 @= '' );
	nError_Occurred = 1;
	sError_Message = 'The pIteratorDimension1 parameter was not specified. You must provide at least one iterator dimension. Aborting process.';
	ProcessBreak;
ENDIF;

IF( sDimension1 @<> '' & HierarchyExists( sDimension1, sHierarchy1 ) = 0);
	nError_Occurred = 1;
	sError_Message = 'The specified hierarchy [' | sDimension1 | '].[' | sHierarchy1 | '] provided in the pIteratorDimension1 and pIteratorHierarchy1 parameters does not exist. Aborting process.';
	ProcessBreak;
ENDIF;

IF( sDimension2 @<> '' & HierarchyExists( sDimension2, sHierarchy2 ) = 0);
	nError_Occurred = 1;
	sError_Message = 'The specified hierarchy [' | sDimension2 | '].[' | sHierarchy2 | '] provided in the pIteratorDimension2 and pIteratorHierarchy2 parameters does not exist. Aborting process.';
	ProcessBreak;
ENDIF;

IF( sDimension3 @<> '' & HierarchyExists( sDimension3, sHierarchy3 ) = 0);
	nError_Occurred = 1;
	sError_Message = 'The specified hierarchy [' | sDimension3 | '].[' | sHierarchy3 | '] provided in the pIteratorDimension3 and pIteratorHierarchy3 parameters does not exist. Aborting process.';
	ProcessBreak;
ENDIF;

sElement1 = '';
sElement2 = '';
sElement3 = '';

nElement1_Count = 1;
nElement2_Count = 1;
nElement3_Count = 1;

IF(sDimension1 @<> '');
	nElement1_Count = HierarchySubsetGetSize(sDimension1, sHierarchy1, sSubsetName1);
ENDIF;

IF(sDimension2 @<> '');
	nElement2_Count = HierarchySubsetGetSize(sDimension2, sHierarchy2, sSubsetName2);
ENDIF;

IF(sDimension3 @<> '');
	nElement3_Count = HierarchySubsetGetSize(sDimension3, sHierarchy3, sSubsetName3);
ENDIF;

nElement1_Index = 1;

WHILE( nElement1_Index <= nElement1_Count );

	sElement1 = IF( LOWER(sDimension1) @<> LOWER(sHierarchy1), HierarchySubsetGetElementName(sDimension1, sHierarchy1, sSubsetName1, nElement1_Index), SubsetGetElementName(sDimension1, sSubsetName1, nElement1_Index));
	nElement2_Index = 1;

	WHILE( nElement2_Index <= nElement2_Count);

		IF( sDimension2 @<> '' & sHierarchy2 @<> '' &  sSubsetName2 @<> '');
			sElement2 = IF( LOWER(sDimension2) @<> LOWER(sHierarchy2), HierarchySubsetGetElementName(sDimension2, sHierarchy2, sSubsetName2, nElement2_Index), SubsetGetElementName(sDimension2, sSubsetName2, nElement2_Index));
		ENDIF;

		nElement3_Index = 1;

		WHILE( nElement3_Index <= nElement3_Count );

			IF( sDimension3 @<> '' & sHierarchy3 @<> '' &  sSubsetName3 @<> '');
				sElement3 = IF( LOWER(sDimension3) @<> LOWER(sHierarchy3), HierarchySubsetGetElementName(sDimension3, sHierarchy3, sSubsetName3, nElement3_Index), SubsetGetElementName(sDimension3, sSubsetName3, nElement3_Index));
			ENDIF;

			sSubset_Name = EXPAND( pSubsetNameTemplate );
			sElement_Name = EXPAND( pElementNameTemplate );
			sText_Value = EXPAND( pTextValueTemplate );
			sMDX_Query = EXPAND( pMDXQueryTemplate );

			ExecuteProcess( 'SYS.Dimension.Subset.Create_By_MDX'
				,'pTargetDimension', sDimension_Name
				,'pTargetHierarchy', sHierarchy_Name
				,'pSubsetName', sSubset_Name
				,'pMDXQuery', sMDX_Query
				,'pDisplayAlias', sDisplay_Alias
				,'pExpandType', sExpand_Type
				,'pSubsetType', sSubset_Type
				,'pSortType', sSort_Type
				,'pSortDirection', sSort_Direction );

			nElement3_Index = nElement3_Index + 1;
		END;

		nElement2_Index = nElement2_Index + 1;
	END;

	nElement1_Index = nElement1_Index + 1;
END;
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
