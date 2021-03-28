601,100
602,"Cub.Data Load SYS Calendar Public Holidays"
562,"CHARACTERDELIMITED"
586,"C:\TM1Servers\ffm-dev\source\data\australian_public_holidays.csv"
585,"C:\TM1Servers\ffm-dev\source\data\australian_public_holidays.csv"
564,
565,"gt8X04Pa50:yXZ8YNTwyY3[?yS3c>u9>bCLiyLfh\^^Ucj>BlpaV?0<zj\X5kNFc>_A?2A0pzSB^mY\O3g>I\HZfV2@Grr77[UkN]HsGBfqhRy5aZD>f^aP@:6IgHIbBWs\FjttrDN1>rXBIfWQ:5Vum1iWXGxP3;FM>iv[oCamTPn5aeR@0@MEFl<=NAA9LPPV[L`p]"
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
589,","
568,""""
570,
571,
569,1
592,0
599,1000
560,1
pCreateLocations
561,1
2
590,1
pCreateLocations,"No"
637,1
pCreateLocations,""
577,5
vDate
vHolidayName
vHolidayDescription
vHolidayLink
vLocation
578,5
2
2
2
2
2
579,5
1
2
3
4
5
580,5
0
0
0
0
0
581,5
0
0
0
0
0
582,11
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarName=vDimDateVarType=32ColType=827VarFormula=vDimDate = SUBST( vDate, 1, 4 ) | '-' | SUBST( vDate, 5, 2 ) | '-' | SUBST( vDate, 7, 2 );:VarFormulaDestination=BOTH
VarName=vDimLocationVarType=32ColType=827VarFormula=vDimLocation = UPPER( vLocation );:VarFormulaDestination=BOTH
VarName=vDataHolidayFlagVarType=33ColType=827VarFormula=vDataHolidayFlag = 1;:VarFormulaDestination=BOTH
VarName=vDataHolidayNameVarType=32ColType=827VarFormula=vDataHolidayName = vHolidayName;:VarFormulaDestination=BOTH
VarName=vDataHolidayDescriptionVarType=32ColType=827VarFormula=vDataHolidayDescription = vHolidayDescription;:VarFormulaDestination=BOTH
VarName=vConsolLocationVarType=32ColType=827VarFormula=vConsolLocation = 'Total Location';:VarFormulaDestination=BOTH
603,0
572,35

#****Begin: Generated Statements***
#****End: Generated Statements****

NumericGlobalVariable('OutputItemCount');
StringGlobalVariable('OutputItem');
StringGlobalVariable('OutputItemList');
NumericGlobalVariable('OutputItemIndex');
NumericGlobalVariable('OutputItemLocation');
NumericGlobalVariable('OutputSearchItemIndex');

sList_Add_Process_Name = 'SUB.List.String.Add';
sList_Count_Process_Name = 'SUB.List.String.Count';
sList_Find_Process_Name = 'SUB.List.String.Find';
sList_Read_Process_Name = 'SUB.List.String.Read';
sList_Remove_Process_Name = 'SUB.List.String.Remove';
sList_Replace_Process_Name = 'SUB.List.String.Replace';

sView_Zero_Process_Name = 'SYS.Cube.Data.Clear';
sLoad_Weekends_Process_Name = 'Cub.Data Load SYS Calendar Weekends';

sTarget_Cube_Name = 'SYS Calendar';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';
sDate_Dimension_Name = 'GBL Date';
sLocation_Dimension_Name = 'SYS Calendar Location';
sLocation_Hierarchy_Name = 'SYS Calendar Location';

CubeSetLogChanges( sTarget_Cube_Name, 0 );

sCreate_Locations = LOWER( SUBST( pCreateLocations, 1, 1));

ExecuteProcess( sView_Zero_Process_Name
	,'pCubeName', sTarget_Cube_Name
	,'pSubsetTypeList', 'A,A,E'
	,'pSubsetElementList', ',,Holiday' );
573,33

#****Begin: Generated Statements***
vDimDate = SUBST( vDate, 1, 4 ) | '-' | SUBST( vDate, 5, 2 ) | '-' | SUBST( vDate, 7, 2 );
vDimLocation = UPPER( vLocation );
vDataHolidayFlag = 1;
vDataHolidayName = vHolidayName;
vDataHolidayDescription = vHolidayDescription;
vConsolLocation = 'Total Location';
#****End: Generated Statements****


IF( sCreate_Locations @= 'y' );

	sCurrent_Item_List = vDimLocation;

	ExecuteProcess( sList_Count_Process_Name, 'pItemList', vDimLocation, 'pItemSeparator', '|' );
	nItem_Count = OutputItemCount;

	nCurrent_Item_Index = 1;
	sCurrent_Item = '';

	WHILE(nCurrent_Item_Index <= nItem_Count);

		ExecuteProcess( sList_Read_Process_Name, 'pItemList', sCurrent_Item_List, 'pItemIndex', nCurrent_Item_Index, 'pItemSeparator', '|');
		sCurrent_Item = OutputItem;

		HierarchyElementInsert( sLocation_Dimension_Name, sLocation_Hierarchy_Name, '', vConsolLocation, 'c');
		HierarchyElementInsert( sLocation_Dimension_Name, sLocation_Hierarchy_Name, '', sCurrent_Item, 'n');
		HierarchyElementComponentAdd( sLocation_Dimension_Name, sLocation_Hierarchy_Name, vConsolLocation, sCurrent_Item, 1 );

		nCurrent_Item_Index = nCurrent_Item_Index + 1;
	END;
ENDIF;
574,36

#****Begin: Generated Statements***
vDimDate = SUBST( vDate, 1, 4 ) | '-' | SUBST( vDate, 5, 2 ) | '-' | SUBST( vDate, 7, 2 );
vDimLocation = UPPER( vLocation );
vDataHolidayFlag = 1;
vDataHolidayName = vHolidayName;
vDataHolidayDescription = vHolidayDescription;
vConsolLocation = 'Total Location';
#****End: Generated Statements****


IF( DIMIX( sDate_Dimension_Name, vDimDate ) <> 0 );

	sCurrent_Item_List = vDimLocation;

	ExecuteProcess( sList_Count_Process_Name, 'pItemList', vDimLocation, 'pItemSeparator', '|' );
	nItem_Count = OutputItemCount;

	nCurrent_Item_Index = 1;
	sCurrent_Item = '';

	WHILE(nCurrent_Item_Index <= nItem_Count);

		ExecuteProcess( sList_Read_Process_Name, 'pItemList', sCurrent_Item_List, 'pItemIndex', nCurrent_Item_Index, 'pItemSeparator', '|');
		sCurrent_Item = OutputItem;

		IF( DIMIX( sLocation_Dimension_Name, sCurrent_Item ) <> 0 );

			CellPutN( vDataHolidayFlag, sTarget_Cube_Name, vDimDate, sCurrent_Item, 'Holiday' );
			CellPutS( vDataHolidayName, sTarget_Cube_Name, vDimDate, sCurrent_Item, 'Holiday Name' );
			CellPutS( vDataHolidayDescription, sTarget_Cube_Name, vDimDate, sCurrent_Item, 'Holiday Description' );
		ENDIF;

		nCurrent_Item_Index = nCurrent_Item_Index + 1;
	END;
ENDIF;
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

CubeSetLogChanges( sTarget_Cube_Name, 1 );
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
