601,100
602,"SYS.Cube.Data.Import_With_Transform"
562,"CHARACTERDELIMITED"
586,"D:\FFM\source\data\Dummy.csv"
585,"D:\FFM\source\data\Dummy.csv"
564,
565,"nv2R]P<_4nta[raZLQt>R_10DGWUw79SokQxtGE_begLf_pWNMTJ4D0mZ>LgIAyaw[q_0yZm@<KhHtfZG4F<A1l_UO7B357ur;WAvBc[moeyhMCDYZo8WF40?2_Qt?f_l497_kNgX0ZBQ6Ie3rabDA2CZ3TXnF`H4^OX;2lsgUf4GajP9_xmb8Vv<3qVhPh^fP_vPsrV"
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
560,9
pImportFilePath
pImportFileName
pCubeName
pTargetSubsetTypeList
pTargetSubsetElementList
pTransformDimension
pTransformColumnVariable
pHeaderRowCount
pClearData
561,9
2
2
2
2
2
2
2
1
1
590,9
pImportFilePath,"..\Import"
pImportFileName,""
pCubeName,""
pTargetSubsetTypeList,""
pTargetSubsetElementList,""
pTransformDimension,""
pTransformColumnVariable,""
pHeaderRowCount,1
pClearData,0
637,9
pImportFilePath,""
pImportFileName,""
pCubeName,""
pTargetSubsetTypeList,""
pTargetSubsetElementList,""
pTransformDimension,""
pTransformColumnVariable,"pTransformColumnVariable: EG: vSource_Element1"
pHeaderRowCount,""
pClearData,""
577,33
vSource_Element1
vSource_Element2
vSource_Element3
vSource_Element4
vSource_Element5
vSource_Element6
vSource_Element7
vSource_Element8
vSource_Element9
vSource_Element10
vSource_Element11
vSource_Element12
vSource_Element13
vSource_Element14
vSource_Element15
vSource_Element16
vSource_Element17
vSource_Element18
vSource_Element19
vSource_Element20
vSource_Element21
vSource_Element22
vSource_Element23
vSource_Element24
vSource_Element25
vSource_Element26
vSource_Element27
vSource_Element28
vSource_Element29
vSource_Element30
vSource_Element31
vSource_Element32
vValue
578,33
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
579,33
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
580,33
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
581,33
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
582,34
IgnoredInputVarName=CubeNameVarType=32ColType=1165
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,313

#****Begin: Generated Statements***
#****End: Generated Statements****

sProcessName = GetProcessName();

StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemCount');
StringGlobalVariable('OutputItemList');
sList_Count_Process_Name = 'SUB.List.String.Count';
sList_Read_Process_Name = 'SUB.List.String.Read';
sList_Add_Process_Name = 'SUB.List.String.Add';

StringGlobalVariable('OutputTempName');
StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
sCreate_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';
sCube_Data_Clear_Process_Name = 'SYS.Cube.Data.Clear';

StringGlobalVariable('OutputDimensionList');
StringGlobalVariable('OutputElementName');
sCube_Dimension_Get_List_Process_Name = 'SUB.Cube.Dimension.Get_List';
sSubset_Create_Process_Name = 'SYS.Dimension.Subset.Create_By_MDX';
sSubset_Resolve_Process_Name = 'SUB.Dimension.Subset.Resolve_Subset_Type';

sControl_Cube_Name = 'SYS Control';
sFormatSubsetName = CellGetS(sControl_Cube_Name, 'Current Environment', 'Subset Type Dimension');
sFormatSubsetName = IF(sFormatSubsetName @<> '', sFormatSubsetName, 'SYS Subset Type');

sProcess_Name = GetProcessName();
nRecord_Count = 0;

StringGlobalVariable('OutputDimensionList');
ExecuteProcess(sCube_Dimension_Get_List_Process_Name, 'pCubeName', pCubeName);
sDimension_List = OutputDimensionList;

ExecuteProcess(sList_Count_Process_Name, 'pItemList', sDimension_List);
nDimension_Count = OutputItemCount;

sImport_File_Name = pImportFIleName;
sFull_Import_File_Path = pImportFilePath | '\' | sImport_File_Name;

## Turn off change logging for the cube
CUBESETLOGCHANGES(pCubeName, 0);

ExecuteProcess(sCube_Dimension_Get_List_Process_Name, 'pCubeName', pCubeName);
sCube_Dimension_List = OutputDimensionList;

sDimension_Name1 = TabDim(pCubeName, 1);
sDimension_Name2 = TabDim(pCubeName, 2);
sDimension_Name3 = TabDim(pCubeName, 3);
sDimension_Name4 = TabDim(pCubeName, 4);
sDimension_Name5 = TabDim(pCubeName, 5);
sDimension_Name6 = TabDim(pCubeName, 6);
sDimension_Name7 = TabDim(pCubeName, 7);
sDimension_Name8 = TabDim(pCubeName, 8);
sDimension_Name9 = TabDim(pCubeName, 9);
sDimension_Name10 = TabDim(pCubeName, 10);
sDimension_Name11 = TabDim(pCubeName, 11);
sDimension_Name12 = TabDim(pCubeName, 12);
sDimension_Name13 = TabDim(pCubeName, 13);
sDimension_Name14 = TabDim(pCubeName, 14);
sDimension_Name15 = TabDim(pCubeName, 15);
sDimension_Name16 = TabDim(pCubeName, 16);
sDimension_Name17 = TabDim(pCubeName, 17);
sDimension_Name18 = TabDim(pCubeName, 18);
sDimension_Name19 = TabDim(pCubeName, 19);
sDimension_Name20 = TabDim(pCubeName, 20);
sDimension_Name21 = TabDim(pCubeName, 21);
sDimension_Name22 = TabDim(pCubeName, 22);
sDimension_Name23 = TabDim(pCubeName, 23);
sDimension_Name24 = TabDim(pCubeName, 24);
sDimension_Name25 = TabDim(pCubeName, 25);
sDimension_Name26 = TabDim(pCubeName, 26);
sDimension_Name27 = TabDim(pCubeName, 27);
sDimension_Name28 = TabDim(pCubeName, 28);
sDimension_Name29 = TabDim(pCubeName, 29);
sDimension_Name30 = TabDim(pCubeName, 30);
sDimension_Name31 = TabDim(pCubeName, 31);
sDimension_Name32 = TabDim(pCubeName, 32);

## Populate write element overrides and create subset element arrays for zero out view

sWrite_Element1 = '';
sWrite_Element3 = '';
sWrite_Element3 = '';
sWrite_Element4 = '';
sWrite_Element5 = '';
sWrite_Element6 = '';
sWrite_Element7 = '';
sWrite_Element8 = '';
sWrite_Element9 = '';
sWrite_Element10 = '';
sWrite_Element11 = '';
sWrite_Element12 = '';
sWrite_Element13 = '';
sWrite_Element14 = '';
sWrite_Element15 = '';
sWrite_Element16 = '';
sWrite_Element17 = '';
sWrite_Element18 = '';
sWrite_Element19 = '';
sWrite_Element20 = '';
sWrite_Element21 = '';
sWrite_Element22 = '';
sWrite_Element23 = '';
sWrite_Element24 = '';
sWrite_Element25 = '';
sWrite_Element26 = '';
sWrite_Element27 = '';
sWrite_Element28 = '';
sWrite_Element29 = '';
sWrite_Element30 = '';
sWrite_Element31 = '';
sWrite_Element32 = '';

sAttribute_Name1 = '';
sAttribute_Name2 = '';
sAttribute_Name3 = '';
sAttribute_Name4 = '';
sAttribute_Name5 = '';
sAttribute_Name6 = '';
sAttribute_Name7 = '';
sAttribute_Name8 = '';
sAttribute_Name9 = '';
sAttribute_Name10 = '';
sAttribute_Name11 = '';
sAttribute_Name12 = '';
sAttribute_Name13 = '';
sAttribute_Name14 = '';
sAttribute_Name15 = '';
sAttribute_Name16 = '';
sAttribute_Name17 = '';
sAttribute_Name18 = '';
sAttribute_Name19 = '';
sAttribute_Name20 = '';
sAttribute_Name21 = '';
sAttribute_Name22 = '';
sAttribute_Name23 = '';
sAttribute_Name24 = '';
sAttribute_Name25 = '';
sAttribute_Name26 = '';
sAttribute_Name27 = '';
sAttribute_Name28 = '';
sAttribute_Name29 = '';
sAttribute_Name30 = '';
sAttribute_Name31 = '';
sAttribute_Name32 = '';

sZero_Out_Subset_Element_List = '';
sZero_Out_Subset_Type_List = '';

nCurrent_Dimension_Index = 1;
WHILE(nCurrent_Dimension_Index <= nDimension_Count);

	ExecuteProcess(sList_Read_Process_Name, 'pItemList', sCube_Dimension_List, 'pItemIndex', nCurrent_Dimension_Index, 'pTrimQuoteCharacters', 1);
	sCurrent_Dimension_Name = OutputItem;

	ExecuteProcess(sList_Read_Process_Name, 'pItemList', pTargetSubsetTypeList, 'pItemIndex', nCurrent_Dimension_Index, 'pTrimQuoteCharacters', 1);
	sCurrent_Target_Subset_Type = OutputItem;

	ExecuteProcess(sList_Read_Process_Name, 'pItemList', pTargetSubsetElementList, 'pItemIndex', nCurrent_Dimension_Index, 'pTrimQuoteCharacters', 1);
	sCurrent_Target_Element_Name = OutputItem;

	sCurrent_Write_Element = '';
	sCurrent_Zero_Element = '';

	sCurrent_Selection_Type = IF(DIMIX(sFormatSubsetName, sCurrent_Target_Subset_Type) <> 0, ATTRS(sFormatSubsetName, sCurrent_Target_Subset_Type, 'Selection Type'), 'Multiple');

	IF(sCurrent_Selection_Type @= 'Single');

		sCurrent_Zero_Type = sCurrent_Target_Subset_Type;
		sCurrent_Zero_Element = sCurrent_Target_Element_Name;

		ExecuteProcess( sSubset_Resolve_Process_Name
			,'pSubsetType', sCurrent_Target_Subset_Type
			,'pDimensionName', sCurrent_Dimension_Name
			,'pSelectionElement', sCurrent_Target_Element_Name );

		sCurrent_Write_Element = OutputElementName;

		IF(nCurrent_Dimension_Index = 1); sWrite_Element1 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 2); sWrite_Element2 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 3); sWrite_Element3 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 4); sWrite_Element4 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 5); sWrite_Element5 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 6); sWrite_Element6 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 7); sWrite_Element7 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 8); sWrite_Element8 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 9); sWrite_Element9 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 10); sWrite_Element10 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 11); sWrite_Element11 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 12); sWrite_Element12 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 13); sWrite_Element13 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 14); sWrite_Element14 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 15); sWrite_Element15 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 16); sWrite_Element16 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 17); sWrite_Element17 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 18); sWrite_Element18 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 19); sWrite_Element19 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 20); sWrite_Element20 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 21); sWrite_Element21 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 22); sWrite_Element22 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 23); sWrite_Element23 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 24); sWrite_Element24 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 25); sWrite_Element25 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 26); sWrite_Element26 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 27); sWrite_Element27 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 28); sWrite_Element28 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 29); sWrite_Element29 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 30); sWrite_Element30 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 31); sWrite_Element31 = sCurrent_Write_Element; ENDIF;
		IF(nCurrent_Dimension_Index = 32); sWrite_Element32 = sCurrent_Write_Element; ENDIF;

	ELSEIF( sCurrent_Target_Subset_Type @<> 'T');

		sCurrent_Zero_Type = sCurrent_Target_Subset_Type;
		sCurrent_Zero_Element = sCurrent_Target_Element_Name;
		sCurrent_Write_Element = sCurrent_Target_Element_Name;

		IF(nCurrent_Dimension_Index = 1); sAttribute_Name1 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 2); sAttribute_Name2 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 3); sAttribute_Name3 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 4); sAttribute_Name4 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 5); sAttribute_Name5 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 6); sAttribute_Name6 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 7); sAttribute_Name7 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 8); sAttribute_Name8 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 9); sAttribute_Name9 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 10); sAttribute_Name10 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 11); sAttribute_Name11 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 12); sAttribute_Name12 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 13); sAttribute_Name13 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 14); sAttribute_Name14 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 15); sAttribute_Name15 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 16); sAttribute_Name16 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 17); sAttribute_Name17 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 18); sAttribute_Name18 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 19); sAttribute_Name19 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 20); sAttribute_Name20 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 21); sAttribute_Name21 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 22); sAttribute_Name22 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 23); sAttribute_Name23 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 24); sAttribute_Name24 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 25); sAttribute_Name25 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 26); sAttribute_Name26 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 27); sAttribute_Name27 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 28); sAttribute_Name28 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 29); sAttribute_Name29 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 30); sAttribute_Name30 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 31); sAttribute_Name31 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 32); sAttribute_Name32 = sCurrent_Target_Element_Name; ENDIF;
	ELSE;
		sCurrent_Zero_Type = 'A';
		sCurrent_Zero_Element = sCurrent_Target_Element_Name;
		sCurrent_Write_Element = sCurrent_Target_Element_Name;

		IF(nCurrent_Dimension_Index = 1); sTransform_Name1 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 2); sTransform_Name2 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 3); sTransform_Name3 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 4); sTransform_Name4 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 5); sTransform_Name5 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 6); sTransform_Name6 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 7); sTransform_Name7 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 8); sTransform_Name8 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 9); sTransform_Name9 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 10); sTransform_Name10 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 11); sTransform_Name11 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 12); sTransform_Name12 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 13); sTransform_Name13 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 14); sTransform_Name14 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 15); sTransform_Name15 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 16); sTransform_Name16 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 17); sTransform_Name17 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 18); sTransform_Name18 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 19); sTransform_Name19 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 20); sTransform_Name20 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 21); sTransform_Name21 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 22); sTransform_Name22 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 23); sTransform_Name23 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 24); sTransform_Name24 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 25); sTransform_Name25 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 26); sTransform_Name26 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 27); sTransform_Name27 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 28); sTransform_Name28 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 29); sTransform_Name29 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 30); sTransform_Name30 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 31); sTransform_Name31 = sCurrent_Target_Element_Name; ENDIF;
		IF(nCurrent_Dimension_Index = 32); sTransform_Name32 = sCurrent_Target_Element_Name; ENDIF;
	ENDIF;

	ExecuteProcess(sList_Add_Process_Name, 'pItemList', sZero_Out_Subset_Type_List, 'pNewItem', IF( sCurrent_Zero_Type@<> '', sCurrent_Zero_Type, '""'), 'pItemIndex', 999);
	sZero_Out_Subset_Type_List = OutputItemList;

	ExecuteProcess(sList_Add_Process_Name, 'pItemList', sZero_Out_Subset_Element_List, 'pNewItem', IF( sCurrent_Zero_Element@<> '', sCurrent_Zero_Element, '""'), 'pItemIndex', 999);
	sZero_Out_Subset_Element_List = OutputItemList;

	nCurrent_Dimension_Index = nCurrent_Dimension_Index + 1;
END;

IF( pClearData = 1 );
	### Create view on destination cube and zero out
	ExecuteProcess(sCube_Data_Clear_Process_Name, 'pCubeName', pCubeName, 'pSubsetTypeList', sZero_Out_Subset_Type_List, 'pSubsetElementList', sZero_Out_Subset_Element_List);
	# ASCIIOUTPUT('..\temp\Snapshot.txt', sZero_Out_Subset_Element_List);
ENDIF;

### Attach source file to process

DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = sFull_Import_File_Path;
DatasourceNameForClient = sFull_Import_File_Path;
DatasourceASCIIHeaderRecords = pHeaderRowCount;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,418

#****Begin: Generated Statements***
#****End: Generated Statements****

## If a single element name was specified for an 'E' type dimension, override the source element name with the specified element
IF(sWrite_Element1 @<> ''); vSource_Element1 = sWrite_Element1; ENDIF;
IF(sWrite_Element2 @<> ''); vSource_Element2 = sWrite_Element2; ENDIF;
IF(sWrite_Element3 @<> ''); vSource_Element3 = sWrite_Element3; ENDIF;
IF(sWrite_Element4 @<> ''); vSource_Element4 = sWrite_Element4; ENDIF;
IF(sWrite_Element5 @<> ''); vSource_Element5 = sWrite_Element5; ENDIF;
IF(sWrite_Element6 @<> ''); vSource_Element6 = sWrite_Element6; ENDIF;
IF(sWrite_Element7 @<> ''); vSource_Element7 = sWrite_Element7; ENDIF;
IF(sWrite_Element8 @<> ''); vSource_Element8 = sWrite_Element8; ENDIF;
IF(sWrite_Element9 @<> ''); vSource_Element9 = sWrite_Element9; ENDIF;
IF(sWrite_Element10 @<> ''); vSource_Element10 = sWrite_Element10; ENDIF;
IF(sWrite_Element11 @<> ''); vSource_Element11 = sWrite_Element11; ENDIF;
IF(sWrite_Element12 @<> ''); vSource_Element12 = sWrite_Element12; ENDIF;
IF(sWrite_Element13 @<> ''); vSource_Element13 = sWrite_Element13; ENDIF;
IF(sWrite_Element14 @<> ''); vSource_Element14 = sWrite_Element14; ENDIF;
IF(sWrite_Element15 @<> ''); vSource_Element15 = sWrite_Element15; ENDIF;
IF(sWrite_Element16 @<> ''); vSource_Element16 = sWrite_Element16; ENDIF;
IF(sWrite_Element17 @<> ''); vSource_Element17 = sWrite_Element17; ENDIF;
IF(sWrite_Element18 @<> ''); vSource_Element18 = sWrite_Element18; ENDIF;
IF(sWrite_Element19 @<> ''); vSource_Element19 = sWrite_Element19; ENDIF;
IF(sWrite_Element20 @<> ''); vSource_Element20 = sWrite_Element20; ENDIF;
IF(sWrite_Element21 @<> ''); vSource_Element21 = sWrite_Element21; ENDIF;
IF(sWrite_Element22 @<> ''); vSource_Element22 = sWrite_Element22; ENDIF;
IF(sWrite_Element23 @<> ''); vSource_Element23 = sWrite_Element23; ENDIF;
IF(sWrite_Element24 @<> ''); vSource_Element24 = sWrite_Element24; ENDIF;
IF(sWrite_Element25 @<> ''); vSource_Element25 = sWrite_Element25; ENDIF;
IF(sWrite_Element26 @<> ''); vSource_Element26 = sWrite_Element26; ENDIF;
IF(sWrite_Element27 @<> ''); vSource_Element27 = sWrite_Element27; ENDIF;
IF(sWrite_Element28 @<> ''); vSource_Element28 = sWrite_Element28; ENDIF;
IF(sWrite_Element29 @<> ''); vSource_Element29 = sWrite_Element29; ENDIF;
IF(sWrite_Element30 @<> ''); vSource_Element30 = sWrite_Element30; ENDIF;
IF(sWrite_Element31 @<> ''); vSource_Element31 = sWrite_Element31; ENDIF;
IF(sWrite_Element32 @<> ''); vSource_Element32 = sWrite_Element32; ENDIF;

## If an attribute name was specified for an 'S' type dimension, override the source element name with the attribute lookup
IF(sAttribute_Name1 @<> ''); vSource_Element1 = ATTRS(sDimension_Name1, vSource_Element1, sAttribute_Name1); ENDIF;
IF(sAttribute_Name2 @<> ''); vSource_Element2 = ATTRS(sDimension_Name2, vSource_Element2, sAttribute_Name2); ENDIF;
IF(sAttribute_Name3 @<> ''); vSource_Element3 = ATTRS(sDimension_Name3, vSource_Element3, sAttribute_Name3); ENDIF;
IF(sAttribute_Name4 @<> ''); vSource_Element4 = ATTRS(sDimension_Name4, vSource_Element4, sAttribute_Name4); ENDIF;
IF(sAttribute_Name5 @<> ''); vSource_Element5 = ATTRS(sDimension_Name5, vSource_Element5, sAttribute_Name5); ENDIF;
IF(sAttribute_Name6 @<> ''); vSource_Element6 = ATTRS(sDimension_Name6, vSource_Element6, sAttribute_Name6); ENDIF;
IF(sAttribute_Name7 @<> ''); vSource_Element7 = ATTRS(sDimension_Name7, vSource_Element7, sAttribute_Name7); ENDIF;
IF(sAttribute_Name8 @<> ''); vSource_Element8 = ATTRS(sDimension_Name8, vSource_Element8, sAttribute_Name8); ENDIF;
IF(sAttribute_Name9 @<> ''); vSource_Element9 = ATTRS(sDimension_Name9, vSource_Element9, sAttribute_Name9); ENDIF;
IF(sAttribute_Name10 @<> ''); vSource_Element10 = ATTRS(sDimension_Name10, vSource_Element10, sAttribute_Name10); ENDIF;
IF(sAttribute_Name11 @<> ''); vSource_Element11 = ATTRS(sDimension_Name11, vSource_Element11, sAttribute_Name11); ENDIF;
IF(sAttribute_Name12 @<> ''); vSource_Element12 = ATTRS(sDimension_Name12, vSource_Element12, sAttribute_Name12); ENDIF;
IF(sAttribute_Name13 @<> ''); vSource_Element13 = ATTRS(sDimension_Name13, vSource_Element13, sAttribute_Name13); ENDIF;
IF(sAttribute_Name14 @<> ''); vSource_Element14 = ATTRS(sDimension_Name14, vSource_Element14, sAttribute_Name14); ENDIF;
IF(sAttribute_Name15 @<> ''); vSource_Element15 = ATTRS(sDimension_Name15, vSource_Element15, sAttribute_Name15); ENDIF;
IF(sAttribute_Name16 @<> ''); vSource_Element16 = ATTRS(sDimension_Name16, vSource_Element16, sAttribute_Name16); ENDIF;
IF(sAttribute_Name17 @<> ''); vSource_Element17 = ATTRS(sDimension_Name17, vSource_Element17, sAttribute_Name17); ENDIF;
IF(sAttribute_Name18 @<> ''); vSource_Element18 = ATTRS(sDimension_Name18, vSource_Element18, sAttribute_Name18); ENDIF;
IF(sAttribute_Name19 @<> ''); vSource_Element19 = ATTRS(sDimension_Name19, vSource_Element19, sAttribute_Name19); ENDIF;
IF(sAttribute_Name20 @<> ''); vSource_Element20 = ATTRS(sDimension_Name20, vSource_Element20, sAttribute_Name20); ENDIF;
IF(sAttribute_Name21 @<> ''); vSource_Element21 = ATTRS(sDimension_Name21, vSource_Element21, sAttribute_Name21); ENDIF;
IF(sAttribute_Name22 @<> ''); vSource_Element22 = ATTRS(sDimension_Name22, vSource_Element22, sAttribute_Name22); ENDIF;
IF(sAttribute_Name23 @<> ''); vSource_Element23 = ATTRS(sDimension_Name23, vSource_Element23, sAttribute_Name23); ENDIF;
IF(sAttribute_Name24 @<> ''); vSource_Element24 = ATTRS(sDimension_Name24, vSource_Element24, sAttribute_Name24); ENDIF;
IF(sAttribute_Name25 @<> ''); vSource_Element25 = ATTRS(sDimension_Name25, vSource_Element25, sAttribute_Name25); ENDIF;
IF(sAttribute_Name26 @<> ''); vSource_Element26 = ATTRS(sDimension_Name26, vSource_Element26, sAttribute_Name26); ENDIF;
IF(sAttribute_Name27 @<> ''); vSource_Element27 = ATTRS(sDimension_Name27, vSource_Element27, sAttribute_Name27); ENDIF;
IF(sAttribute_Name28 @<> ''); vSource_Element28 = ATTRS(sDimension_Name28, vSource_Element28, sAttribute_Name28); ENDIF;
IF(sAttribute_Name29 @<> ''); vSource_Element29 = ATTRS(sDimension_Name29, vSource_Element29, sAttribute_Name29); ENDIF;
IF(sAttribute_Name30 @<> ''); vSource_Element30 = ATTRS(sDimension_Name30, vSource_Element30, sAttribute_Name30); ENDIF;
IF(sAttribute_Name31 @<> ''); vSource_Element31 = ATTRS(sDimension_Name31, vSource_Element31, sAttribute_Name31); ENDIF;
IF(sAttribute_Name32 @<> ''); vSource_Element32 = ATTRS(sDimension_Name32, vSource_Element32, sAttribute_Name32); ENDIF;

## If an attribute transofrm name was specified for a 'T' type dimension, override the source element name with the attribute lookup on the transform dimension
IF( pTransformDimension @<> '' & pTransformColumnVariable @<> '');
	sTranformElementValue = EXPAND( '%' | pTransformColumnVariable | '%' );
	IF(sTransform_Name1 @<> ''); vSource_Element1 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name1); ENDIF;
	IF(sTransform_Name2 @<> ''); vSource_Element2 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name2); ENDIF;
	IF(sTransform_Name3 @<> ''); vSource_Element3 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name3); ENDIF;
	IF(sTransform_Name4 @<> ''); vSource_Element4 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name4); ENDIF;
	IF(sTransform_Name5 @<> ''); vSource_Element5 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name5); ENDIF;
	IF(sTransform_Name6 @<> ''); vSource_Element6 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name6); ENDIF;
	IF(sTransform_Name7 @<> ''); vSource_Element7 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name7); ENDIF;
	IF(sTransform_Name8 @<> ''); vSource_Element8 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name8); ENDIF;
	IF(sTransform_Name9 @<> ''); vSource_Element9 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name9); ENDIF;
	IF(sTransform_Name10 @<> ''); vSource_Element10 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name10); ENDIF;
	IF(sTransform_Name11 @<> ''); vSource_Element11 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name11); ENDIF;
	IF(sTransform_Name12 @<> ''); vSource_Element12 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name12); ENDIF;
	IF(sTransform_Name13 @<> ''); vSource_Element13 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name13); ENDIF;
	IF(sTransform_Name14 @<> ''); vSource_Element14 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name14); ENDIF;
	IF(sTransform_Name15 @<> ''); vSource_Element15 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name15); ENDIF;
	IF(sTransform_Name16 @<> ''); vSource_Element16 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name16); ENDIF;
	IF(sTransform_Name17 @<> ''); vSource_Element17 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name17); ENDIF;
	IF(sTransform_Name18 @<> ''); vSource_Element18 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name18); ENDIF;
	IF(sTransform_Name19 @<> ''); vSource_Element19 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name19); ENDIF;
	IF(sTransform_Name20 @<> ''); vSource_Element20 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name20); ENDIF;
	IF(sTransform_Name21 @<> ''); vSource_Element21 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name21); ENDIF;
	IF(sTransform_Name22 @<> ''); vSource_Element22 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name22); ENDIF;
	IF(sTransform_Name23 @<> ''); vSource_Element23 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name23); ENDIF;
	IF(sTransform_Name24 @<> ''); vSource_Element24 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name24); ENDIF;
	IF(sTransform_Name25 @<> ''); vSource_Element25 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name25); ENDIF;
	IF(sTransform_Name26 @<> ''); vSource_Element26 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name26); ENDIF;
	IF(sTransform_Name27 @<> ''); vSource_Element27 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name27); ENDIF;
	IF(sTransform_Name28 @<> ''); vSource_Element28 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name28); ENDIF;
	IF(sTransform_Name29 @<> ''); vSource_Element29 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name29); ENDIF;
	IF(sTransform_Name30 @<> ''); vSource_Element30 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name30); ENDIF;
	IF(sTransform_Name31 @<> ''); vSource_Element31 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name31); ENDIF;
	IF(sTransform_Name32 @<> ''); vSource_Element32 = ATTRS( pTransformDimension, sTranformElementValue, sTransform_Name32); ENDIF;
ENDIF;

IF(nDimension_Count = 2);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2) = 1);
		IF(DTYPE(sDimension_Name2, vSource_Element2) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element3),pCubeName, vSource_Element1, vSource_Element2);
		ELSE;
			CELLPUTS(vSource_Element3,pCubeName, vSource_Element1, vSource_Element2);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 3);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3) = 1);
		IF(DTYPE(sDimension_Name3, vSource_Element3) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element4),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3);
		ELSE;
			CELLPUTS(vSource_Element4,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 4);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4) = 1);
		IF(DTYPE(sDimension_Name4, vSource_Element4) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element5),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4);
		ELSE;
			CELLPUTS(vSource_Element5,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 5);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5) = 1);
		IF(DTYPE(sDimension_Name5, vSource_Element5) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element6),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5);
		ELSE;
			CELLPUTS(vSource_Element6,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 6);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6) = 1);
		IF(DTYPE(sDimension_Name6, vSource_Element6) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element7),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6);
		ELSE;
			CELLPUTS(vSource_Element7,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 7);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7) = 1);
		IF(DTYPE(sDimension_Name7, vSource_Element7) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element8),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7);
		ELSE;
			CELLPUTS(vSource_Element8,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 8);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8) = 1);
		IF(DTYPE(sDimension_Name8, vSource_Element8) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element9),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8);
		ELSE;
			CELLPUTS(vSource_Element9,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 9);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9) = 1);
		IF(DTYPE(sDimension_Name9, vSource_Element9) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element10),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9);
		ELSE;
			CELLPUTS(vSource_Element10,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 10);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10) = 1);
		IF(DTYPE(sDimension_Name10, vSource_Element10) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element11),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10);
		ELSE;
			CELLPUTS(vSource_Element11,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 11);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11) = 1);
		IF(DTYPE(sDimension_Name11, vSource_Element11) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element12),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11);
		ELSE;
			CELLPUTS(vSource_Element12,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 12);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12) = 1);
		IF(DTYPE(sDimension_Name12, vSource_Element12) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element13),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12);
		ELSE;
			CELLPUTS(vSource_Element13,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 13);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13) = 1);
		IF(DTYPE(sDimension_Name13, vSource_Element13) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element14),pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13);
		ELSE;
			CELLPUTS(vSource_Element14,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 14);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14) = 1);
		IF(DTYPE(sDimension_Name14, vSource_Element14) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element15), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14);
		ELSE;
			CELLPUTS(vSource_Element15,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 15);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15) = 1);
		IF(DTYPE(sDimension_Name15, vSource_Element15) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element16), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15);
		ELSE;
			CELLPUTS(vSource_Element16,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 16);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16) = 1);
		IF(DTYPE(sDimension_Name16, vSource_Element16) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element17), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16);
		ELSE;
			CELLPUTS(vSource_Element17,pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 17);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17) = 1);
		IF(DTYPE(sDimension_Name17, vSource_Element17) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element18), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17);
		ELSE;
			CELLPUTS(vSource_Element18, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 18);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18) = 1);
		IF(DTYPE(sDimension_Name18, vSource_Element18) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element19), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18);
		ELSE;
			CELLPUTS(vSource_Element19, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 19);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19) = 1);
		IF(DTYPE(sDimension_Name19, vSource_Element19) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element20), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19);
		ELSE;
			CELLPUTS(vSource_Element20, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 20);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20) = 1);
		IF(DTYPE(sDimension_Name20, vSource_Element20) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element21), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20);
		ELSE;
			CELLPUTS(vSource_Element21, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 21);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21) = 1);
		IF(DTYPE(sDimension_Name21, vSource_Element21) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element22), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21);
		ELSE;
			CELLPUTS(vSource_Element22, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 22);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22) = 1);
		IF(DTYPE(sDimension_Name22, vSource_Element22) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element23), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22);
		ELSE;
			CELLPUTS(vSource_Element23, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 23);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23) = 1);
		IF(DTYPE(sDimension_Name23, vSource_Element23) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element24), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23);
		ELSE;
			CELLPUTS(vSource_Element24, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 24);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24) = 1);
		IF(DTYPE(sDimension_Name24, vSource_Element24) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element25), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24);
		ELSE;
			CELLPUTS(vSource_Element25, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 25);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25) = 1);
		IF(DTYPE(sDimension_Name25, vSource_Element25) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element26), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25);
		ELSE;
			CELLPUTS(vSource_Element26, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 26);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26) = 1);
		IF(DTYPE(sDimension_Name26, vSource_Element26) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element27), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26);
		ELSE;
			CELLPUTS(vSource_Element27, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 27);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27) = 1);
		IF(DTYPE(sDimension_Name27, vSource_Element27) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element28), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27);
		ELSE;
			CELLPUTS(vSource_Element28, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 28);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28) = 1);
		IF(DTYPE(sDimension_Name28, vSource_Element28) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element29), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28);
		ELSE;
			CELLPUTS(vSource_Element29, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 29);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29) = 1);
		IF(DTYPE(sDimension_Name29, vSource_Element29) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element30), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29);
		ELSE;
			CELLPUTS(vSource_Element30, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 30);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30) = 1);
		IF(DTYPE(sDimension_Name30, vSource_Element30) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element31), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30);
		ELSE;
			CELLPUTS(vSource_Element31, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 31);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30, vSource_Element31) = 1);
		IF(DTYPE(sDimension_Name31, vSource_Element31) @<> 'S');
			CELLPUTN(NUMBR(vSource_Element32), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30, vSource_Element31);
		ELSE;
			CELLPUTS(vSource_Element32, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30, vSource_Element31);
		ENDIF;
	ENDIF;
ENDIF;

IF(nDimension_Count = 32);
	IF(CELLISUPDATEABLE(pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30, vSource_Element31, vSource_Element32) = 1);
		IF(DTYPE(sDimension_Name32, vSource_Element32) @<> 'S');
			CELLPUTN(NUMBR(vValue), pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30, vSource_Element31, vSource_Element32);
		ELSE;
			CELLPUTS(vValue, pCubeName, vSource_Element1, vSource_Element2, vSource_Element3, vSource_Element4, vSource_Element5, vSource_Element6, vSource_Element7, vSource_Element8, vSource_Element9, vSource_Element10, vSource_Element11, vSource_Element12, vSource_Element13, vSource_Element14, vSource_Element15, vSource_Element16, vSource_Element17, vSource_Element18, vSource_Element19, vSource_Element20, vSource_Element21, vSource_Element22, vSource_Element23, vSource_Element24, vSource_Element25, vSource_Element26, vSource_Element27, vSource_Element28, vSource_Element29, vSource_Element30, vSource_Element31, vSource_Element32);
		ENDIF;
	ENDIF;
ENDIF;
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

CUBESETLOGCHANGES( pCubeName, 1 );
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
