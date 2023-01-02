601,100
602,"TST.Import.Customer.CSV"
562,"CHARACTERDELIMITED"
586,"C:\TM1Servers\ffm-dev\import\sample\Customers.csv"
585,"C:\TM1Servers\ffm-dev\import\sample\Customers.csv"
564,
565,"gmC8E\3alJ^61QLzv5Jh0R:eUBfmEzw7HG>`5DfyW09<8zC\VTpN75c=OZU8g]?G=piKEZwP[B4H:yfL9vfKpo?52c]vnm1e1Qn1lySGNjBc7cGOhy<rC[Q77pPi?[74`m@irlBe]ZhBt2NfHff^m_87f:yjt^h`LmH3O:pAtsgR_L]Gq[N9IdbL`zNfz]PJj_mqbFp?"
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
560,5
pImportFilePath
pImportFileName
pImportHeaderCount
pExportFilePathFormatString
pExportFileNameFormatString
561,5
2
2
1
2
2
590,5
pImportFilePath,"..\import\sample"
pImportFileName,"Customers.csv"
pImportHeaderCount,1
pExportFilePathFormatString,"..\export\sample"
pExportFileNameFormatString,"cust_%sProcess_Instance_ID%.csv"
637,5
pImportFilePath,""
pImportFileName,""
pImportHeaderCount,""
pExportFilePathFormatString,""
pExportFileNameFormatString,""
577,12
vID
vFirst_name
vLast_name
vCompany_name
vAddress
vCity
vState
vPost
vPhone1
vPhone2
vEmail
vWeb
578,12
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
579,12
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
580,12
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
581,12
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
582,14
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
IgnoredInputVarName=vDefault_product_typeVarType=32ColType=1165
IgnoredInputVarName=vIgnoreVarType=32ColType=1165
603,0
572,37

#****Begin: Generated Statements***
#****End: Generated Statements****

## Define library process names and output global variables

StringGlobalVariable( 'OutputTempName' );
sUnique_Create_Process_Name = 'SUB.Text.String.Create_Unique';

sFolder_Create_Process_Name = 'FIL.Folder.Create';

## Initialize process tracking and error variables

nRecord_Count_Metadata = 0;
nRecord_Count_Data = 0;
nError_Occurred = 0;
sError_Message = '';

## Generate a unique prcess instance ID
ExecuteProcess( sUnique_Create_Process_Name, 'pPrefix', '', 'pSuffix', '' );
sProcess_Instance_ID = OutputTempName;

## Generate file name for export
sExport_File_Path = EXPAND( pExportFilePathFormatString );
sExport_File_Name = EXPAND( pExportFileNameFormatString );
sFull_Export_File_Path = sExport_File_Path | '\' | sExport_File_Name;

ExecuteProcess( sFolder_Create_Process_Name, 'pFolderPath', sExport_File_Path );
SetOutputEscapeDoubleQuote( sFull_Export_File_Path, 1 );

## Set import file path and attach to process
sFull_Import_File_Path = pImportFilePath | '\' | pImportFileName;

DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = sFull_Import_File_Path;
DatasourceNameForClient = sFull_Import_File_Path;
DatasourceASCIIHeaderRecords = pImportHeaderCount;
573,9

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

nRecord_Count_Metadata = nRecord_Count_Metadata + 1;
574,15

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

IF(nRecord_Count_Data = 0);
	ASCIIOUTPUT( sFull_Export_File_Path, 'ID', 'First Name', 'Last Name', 'Email', 'Company Name', 'Address', 'City', 'State', 'Post', 'Phone1', 'Phone2', 'Web' );
ENDIF;

ASCIIOUTPUT( sFull_Export_File_Path, vID, vFirst_name, vLast_name, vEmail, vCompany_name, vAddress, vCity, vState, vPost, vPhone1, vPhone2, vWeb );

nRecord_Count_Data = nRecord_Count_Data + 1;
575,9

#****Begin: Generated Statements***
#****End: Generated Statements****


IF(nError_Occurred <> 0);
	ItemReject(sError_Message);
	ProcessError;
ENDIF;
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
