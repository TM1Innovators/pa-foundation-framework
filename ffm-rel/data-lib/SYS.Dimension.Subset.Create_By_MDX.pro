601,100
602,"SYS.Dimension.Subset.Create_By_MDX"
562,"NULL"
586,
585,
564,
565,"oyzegHnbm\5Fp5>a4KVbUywd9hr1POo]o:Bzbc_cRm8IPMdj`jhT9WU[C>gBN5tBXjVWHb0lVOUwA^xJT<q98[Qfz?_23yQihV[LWoMepUeuTEF=uZ\K[rzRP4H7EAOHT2d_rb\3Xjz86Vi^0jP;hvNaGzTkFPZE49I8ESAQM82Q>BO[PlRrVgia6j9iwDHvKjvzLZ=y"
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
pTargetDimension
pTargetHierarchy
pSubsetName
pMDXQuery
pDisplayAlias
pExpandType
pSubsetType
pSortType
pSortDirection
561,9
2
2
2
2
2
2
2
2
2
590,9
pTargetDimension,""
pTargetHierarchy,""
pSubsetName,""
pMDXQuery,""
pDisplayAlias,""
pExpandType,"Below"
pSubsetType,"Static"
pSortType,""
pSortDirection,"ASC"
637,9
pTargetDimension,""
pTargetHierarchy,""
pSubsetName,""
pMDXQuery,""
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
572,50

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputTempName');
StringGlobalVariable('OutputSubsetName');

sCreate_Unique_String_Process_Name = 'SUB.Text.String.Create_Unique';

sDimension_Name = pTargetDimension;
sHierarchy_Name = IF( pTargetHierarchy @= '', sDimension_Name, pTargetHierarchy );

sSubset_Name = '';
IF( TRIM(pSubsetName) @<> '' );
	sSubset_Name = pSubsetName;
ELSE;
	ExecuteProcess( sCreate_Unique_String_Process_Name );
	sSubset_Name = OutputTempName;
ENDIF;

sDisplay_Alias = pDisplayAlias;
sExpand_Type = pExpandType;
sSubset_Type = pSubsetType;
sMDX_Query = pMDXQuery;
sSort_Type = pSortType;
sSort_Direction = pSortDirection;

sMDX_Sorted = sMDX_Query;
IF( sSort_Type @<> '' & sSort_Direction @<> '' );
	sMDX_Sorted = EXPAND( ATTRS('SYS MDX Sort Type', sSort_Type, 'MDX') );
ENDIF;

IF( HierarchySubsetExists( sDimension_Name, sHierarchy_Name, sSubset_Name ) = 0 );
	HierarchySubsetCreate( sDimension_Name, sHierarchy_Name, sSubset_Name );
ENDIF;

HierarchySubsetMDXSet( sDimension_Name, sHierarchy_Name, sSubset_Name, sMDX_Sorted);

IF(sSubset_Type @= 'Static');
	HierarchySubsetMDXSet(sDimension_Name, sHierarchy_Name, sSubset_Name, '');
ENDIF;

IF( sDisplay_Alias @<> '');
	## Note: cannot pass the dimension name as the hierarchy name here. This is probably a bug, but easy to work around
	HierarchySubsetAliasSet( sDimension_Name, IF( LOWER(sHierarchy_Name) @= LOWER(sDimension_Name), '', sHierarchy_Name ), sSubset_Name, sDisplay_Alias );
ENDIF;

#HierarchyExpandAboveSet( sDimension_Name, sHierarchy_Name, sSubset_Name, IF( sExpand_Type @= 'Below', 0, 1) );

OutputSubsetName = sSubset_Name;
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
