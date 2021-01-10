601,100
602,"SYS.Cube.Data.Export"
562,"VIEW"
586,"}Dummy"
585,"}Dummy"
564,
565,"aa>O9rreZwhfx:ML_jsUGDZZdycncp`YoHhv`kDRWXE4;JVM[O[Q=VUzy@A_:Nn^I@?yln1MOtAan?abujYQIUaMO>dyD1Df>=Fv<;Nq8T[>YUZ0zBqxzi13ahj\HxKFcKGiot:Bn<FoVW?KuGW>vtW6O;]_IRZYvB_KtLX5=]2agVLU>Wg^b?7VYxR\t;Y[>Ljfc;cQ"
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
570,Default
571,
569,0
592,0
599,1000
560,9
pExportFilePath
pExportFileName
pCubeName
pSubsetTypeList
pSubsetElementList
pSkipZero
pSkipConsolidated
pSkipCalculated
pIncludeHeader
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
pExportFilePath,"..\export"
pExportFileName,""
pCubeName,""
pSubsetTypeList,""
pSubsetElementList,""
pSkipZero,1
pSkipConsolidated,1
pSkipCalculated,1
pIncludeHeader,1
637,9
pExportFilePath,""
pExportFileName,""
pCubeName,""
pSubsetTypeList,""
pSubsetElementList,""
pSkipZero,""
pSkipConsolidated,""
pSkipCalculated,""
pIncludeHeader,""
577,35
V1
V2
V3
V4
V5
V6
V7
V8
V9
V10
V11
V12
V13
V14
V15
V16
V17
V18
V19
V20
V21
V22
V23
V24
V25
V26
V27
V28
V29
V30
V31
V32
NVALUE
SVALUE
VALUE_IS_STRING
578,35
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
1
2
1
579,35
1
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
0
0
0
580,35
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
0
0
581,35
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
0
0
582,33
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
IgnoredInputVarName=ValueVarType=33ColType=1165
603,0
572,86

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputExportFilePath');
StringGlobalVariable('OutputExportFileName');

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
sCube_Dimension_Get_List_Process_Name = 'SUB.Cube.Dimension.Get_List';
sSubset_Create_Process_Name = 'SYS.Dimension.Subset.Create_By_MDX';

sProcess_Name = GetProcessName();
nRecord_Count = 0;

StringGlobalVariable('OutputDimensionList');
ExecuteProcess(sCube_Dimension_Get_List_Process_Name, 'pCubeName', pCubeName);
sDimension_List = OutputDimensionList;

ExecuteProcess(sList_Count_Process_Name, 'pItemList', sDimension_List);
nDimension_Count = OutputItemCount;

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
ExecuteProcess(sCreate_Temp_Process_Name, 'pCubeName', pCubeName, 'pSubsetTypeList', pSubsetTypeList, 'pSubsetElementList', pSubsetElementList, 'pSkipZero', pSkipZero, 'pSkipConsolidated', pSkipConsolidated, 'pSkipCalculated', pSkipCalculated);
sSource_View_Name = OutputViewName;
sSource_Subset_Name = OutputSubsetName;

sExport_File_Name = IF(pExportFIleName @<> '', pExportFileName, pCubeName | '_' | sSource_View_Name | '.csv');
sFull_Export_File_Path = pExportFilePath | '\' | sExport_File_Name;

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

SetOutputEscapeDoubleQuote(sFull_Export_File_Path, 1);

OutputExportFilePath = pExportFilePath;
OutputExportFileName = sExport_File_Name;

DataSourceType = 'VIEW';
DatasourceNameForServer = pCubeName;
DatasourceNameForClient = pCubeName;
DatasourceCubeView = sSource_View_Name;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,139

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nRecord_Count = 0 & pIncludeHeader = 1);
	IF(nDimension_Count = 2);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, 'Value');
	ELSEIF(nDimension_Count = 3);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, 'Value');
	ELSEIF(nDimension_Count = 4);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, 'Value');
	ELSEIF(nDimension_Count = 5);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, 'Value');
	ELSEIF(nDimension_Count = 6);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, 'Value');
	ELSEIF(nDimension_Count = 7);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, 'Value');
	ELSEIF(nDimension_Count = 8);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, 'Value');
	ELSEIF(nDimension_Count = 9);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, 'Value');
	ELSEIF(nDimension_Count = 10);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, 'Value');
	ELSEIF(nDimension_Count = 11);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, 'Value');
	ELSEIF(nDimension_Count = 12);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, 'Value');
	ELSEIF(nDimension_Count = 13);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, 'Value');
	ELSEIF(nDimension_Count = 14);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, 'Value');
	ELSEIF(nDimension_Count = 15);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, 'Value');
	ELSEIF(nDimension_Count = 16);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, 'Value');
	ELSEIF(nDimension_Count = 17);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, 'Value');
	ELSEIF(nDimension_Count = 18);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, 'Value');
	ELSEIF(nDimension_Count = 19);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, 'Value');
	ELSEIF(nDimension_Count = 20);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, 'Value');
	ELSEIF(nDimension_Count = 21);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, 'Value');
	ELSEIF(nDimension_Count = 22);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, 'Value');
	ELSEIF(nDimension_Count = 23);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, 'Value');
	ELSEIF(nDimension_Count = 24);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name2, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, 'Value');
	ELSEIF(nDimension_Count = 25);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, 'Value');
	ELSEIF(nDimension_Count = 26);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, 'Value');
	ELSEIF(nDimension_Count = 27);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, sDimension_Name27, 'Value');
	ELSEIF(nDimension_Count = 28);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, sDimension_Name27, sDimension_Name28, 'Value');
	ELSEIF(nDimension_Count = 29);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, sDimension_Name27, sDimension_Name28, sDimension_Name29, 'Value');
	ELSEIF(nDimension_Count = 30);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, sDimension_Name27, sDimension_Name28, sDimension_Name29, sDimension_Name30, 'Value');
	ELSEIF(nDimension_Count = 31);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, sDimension_Name27, sDimension_Name28, sDimension_Name29, sDimension_Name30, sDimension_Name31, 'Value');
	ELSEIF(nDimension_Count = 32);
		ASCIIOUTPUT(sFull_Export_File_Path, 'CubeName', sDimension_Name1, sDimension_Name2, sDimension_Name3, sDimension_Name4, sDimension_Name5, sDimension_Name6, sDimension_Name7, sDimension_Name8, sDimension_Name9, sDimension_Name10, sDimension_Name11, sDimension_Name12, sDimension_Name13, sDimension_Name14, sDimension_Name15, sDimension_Name16, sDimension_Name17, sDimension_Name18, sDimension_Name19, sDimension_Name20, sDimension_Name21, sDimension_Name22, sDimension_Name23, sDimension_Name24, sDimension_Name25, sDimension_Name26, sDimension_Name27, sDimension_Name28, sDimension_Name29, sDimension_Name30, sDimension_Name31, sDimension_Name32, 'Value');
	ELSE;
		ProcessBreak;
	ENDIF;
ENDIF;

IF(nDimension_Count = 2);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, SValue);
ELSEIF(nDimension_Count = 3);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, SValue);
ELSEIF(nDimension_Count = 4);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, SValue);
ELSEIF(nDimension_Count = 5);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, SValue);
ELSEIF(nDimension_Count = 6);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, SValue);
ELSEIF(nDimension_Count = 7);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, SValue);
ELSEIF(nDimension_Count = 8);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, SValue);
ELSEIF(nDimension_Count = 9);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, SValue);
ELSEIF(nDimension_Count = 10);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, SValue);
ELSEIF(nDimension_Count = 11);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, SValue);
ELSEIF(nDimension_Count = 12);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, SValue);
ELSEIF(nDimension_Count = 13);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, SValue);
ELSEIF(nDimension_Count = 14);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, SValue);
ELSEIF(nDimension_Count = 15);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, SValue);
ELSEIF(nDimension_Count = 16);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, SValue);
ELSEIF(nDimension_Count = 17);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, SValue);
ELSEIF(nDimension_Count = 18);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, SValue);
ELSEIF(nDimension_Count = 19);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, SValue);
ELSEIF(nDimension_Count = 20);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, SValue);
ELSEIF(nDimension_Count = 21);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, SValue);
ELSEIF(nDimension_Count = 22);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, SValue);
ELSEIF(nDimension_Count = 23);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, SValue);
ELSEIF(nDimension_Count = 24);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, SValue);
ELSEIF(nDimension_Count = 25);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, SValue);
ELSEIF(nDimension_Count = 26);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, SValue);
ELSEIF(nDimension_Count = 27);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, SValue);
ELSEIF(nDimension_Count = 28);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, SValue);
ELSEIF(nDimension_Count = 29);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, SValue);
ELSEIF(nDimension_Count = 30);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, SValue);
ELSEIF(nDimension_Count = 31);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, SValue);
ELSEIF(nDimension_Count = 32);
	ASCIIOUTPUT(sFull_Export_File_Path, pCubeName, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15, V16, V17, V18, V19, V20, V21, V22, V23, V24, V25, V26, V27, V28, V29, V30, V31, V32, SValue);
ELSE;
	ProcessBreak;
ENDIF;

nRecord_Count = nRecord_Count + 1;
575,6

#****Begin: Generated Statements***
#****End: Generated Statements****


ExecuteProcess( sCleanup_Temp_Process_Name, 'pCubeName', pCubeName, 'pViewName', sSource_View_Name, 'pSubsetName', sSource_Subset_Name );
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
