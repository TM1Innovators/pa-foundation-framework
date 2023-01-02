601,100
602,"BLD.Model.Import.All.Dimensions"
562,"CHARACTERDELIMITED"
586,"\\kracken\TM1 Servers (Kracken)\ffm-dev\export\}20201209194658_526069284_tmp\Dimension_Control_}20201209194658_578819647_tmp.csv"
585,"\\kracken\TM1 Servers (Kracken)\ffm-dev\export\}20201209194658_526069284_tmp\Dimension_Control_}20201209194658_578819647_tmp.csv"
564,
565,"wg`JxeL8Vp1Q\p9_^TFcX2Ealc0`4>oDq8K>rORx995kFKWUm?AXq=]]`x9O;UkgTCcVXt[YnXVCe5[7Z0pXPtAlGOXV;rSj^g7CiSfPBuu4?WO?z35oVIBQ0j7mHWJjQz1o:HFlwlWxfh=09O26r>;zVbDz[SDteN?@F<@0wOW55<veM\dCcBvedkuSqRB`c:gPQ:8h"
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
570,Default
571,
569,1
592,0
599,1000
560,7
pImportLocation
pDimensionControlFileName
pTargetBuildVersion
pTargetBuildProfile
pTargetAction
pTargetUpdateFlag
pLogToken
561,7
2
2
2
2
2
2
2
590,7
pImportLocation,""
pDimensionControlFileName,""
pTargetBuildVersion,""
pTargetBuildProfile,""
pTargetAction,""
pTargetUpdateFlag,""
pLogToken,""
637,7
pImportLocation,""
pDimensionControlFileName,""
pTargetBuildVersion,""
pTargetBuildProfile,""
pTargetAction,""
pTargetUpdateFlag,""
pLogToken,""
577,12
vCube_Name
vBuild_Profile
vDimension_List
vBuild_Version
vUpdate_Hierarchy
vUpdate_Elements
vUpdate_Subsets
vHierarchy_Source_File_Name
vAttribute_Source_File_Name
vElement_Source_File_Name
vSubset_Source_File_Name
vProcess_Parameter_Source_File_Name
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
582,13
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
IgnoredInputVarName=V13VarType=33ColType=1165
603,0
572,68

#****Begin: Generated Statements***
#****End: Generated Statements****

## Log process start

StringGlobalVariable('OutputLogToken');

sLog_Open_Process_Name = 'ADM.Log.Open';
sLog_Write_Process_Name = 'ADM.Log.Write';
sLog_Close_Process_Name = 'ADM.Log.Close';

nRecord_Count = 0;
nError_Occurred = 0;
sError_Message = '';
nLog_Source = 0;

sLogToken = pLogToken;
IF( sLogToken @= '');
	nLog_Source = 1;
	ExecuteProcess(sLog_Open_Process_Name, 'pLogSource', GetProcessName());
	sLogToken = OutputLogToken;
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ' process started...');
ENDIF;


## Define globals & model object references

sData_Import_Process_Name = 'SYS.Cube.Data.Import';

sDimension_Control_Cube_Name = 'BLD Dimension Control';

sControl_Cube_Name = 'SYS Control';
sDimension_Source_Cube_Name = 'BLD Dimension Source';
sAttribute_Source_Cube_Name = 'BLD Attribute Source';
sElement_Source_Cube_Name = 'BLD Element Source';
sSubset_Source_Cube_Name = 'BLD Subset Source';
sProcess_Parameter_Source_Cube_Name = 'BLD Process Parameter Source';

sBuild_Profile_Dimension_Name = 'BLD Build Profile';
sDimension_List_Dimension_Name = 'BLD Dimension List';
sDimension_Version_Dimension_Name = 'BLD Dimension Version';


## Setup cube control file variables

sBase_Import_File_Path = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Import Path');
sBase_Import_File_Path = IF( sBase_Import_File_Path @= '', '..\import', sBase_Import_File_Path );

sImport_Location = pImportLocation;
sImport_File_Path = sBase_Import_File_Path | '\' | sImport_Location;

sDimension_Control_File_Name = pDimensionControlFileName;
sDimension_Control_Full_Path = sImport_File_Path | '\' | sDimension_Control_File_Name;

IF( FileExists( sDimension_Control_Full_Path ) = 0);
	nError_Occurred = 1;
	sError_Message = 'Dimension control file "' | sDimension_Control_Full_Path | '" not found. Aborting process.';
	ItemReject(sError_Message);
ENDIF;

### Attach source file to process

DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = sDimension_Control_Full_Path;
DatasourceNameForClient = sDimension_Control_Full_Path;
DatasourceASCIIHeaderRecords = 1;
573,23

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

sDimension_List = vDimension_List;
sBuild_Version = IF( pTargetBuildVersion @= '', vBuild_Version, pTargetBuildVersion );
sBuild_Profile = IF( pTargetBuildProfile @= '', vBuild_Profile, pTargetBuildProfile );

IF( DIMIX( sDimension_List_Dimension_Name, sDimension_List ) = 0);
	DimensionElementInsert( sDimension_List_Dimension_Name, '', sDimension_List, 'n' );
ENDIF;

IF( DIMIX( sDimension_Version_Dimension_Name, sBuild_Version ) = 0);
	DimensionElementInsert( sDimension_Version_Dimension_Name, '', sBuild_Version, 'n' );
ENDIF;

IF( DIMIX ( sBuild_Profile_Dimension_Name, pTargetBuildProfile) = 0 );
	DimensionElementInsert ( sBuild_Profile_Dimension_Name, '', sBuild_Profile, 'n' );
ENDIF;
574,109

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

sDimension_List = vDimension_List;
sBuild_Version = IF( pTargetBuildVersion @= '', vBuild_Version, pTargetBuildVersion );
sBuild_Profile = IF( pTargetBuildProfile @= '', vBuild_Profile, pTargetBuildProfile );

sHierarchy_Import_File_Name = vHierarchy_Source_File_Name;

IF( sHierarchy_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sHierarchy_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = sDimension_List | ',,' | sBuild_Version | ',,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sHierarchy_Import_File_Name
		,'pCubeName', sDimension_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;


sAttribute_Import_File_Name = vAttribute_Source_File_Name;

IF( sAttribute_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sAttribute_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = sDimension_List | ',,' | sBuild_Version | ',,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sAttribute_Import_File_Name
		,'pCubeName', sAttribute_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;


sElement_Import_File_Name = vElement_Source_File_Name;

IF( sElement_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sElement_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = sDimension_List | ',,' | sBuild_Version | ',,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sElement_Import_File_Name
		,'pCubeName', sElement_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;


sSubset_Import_File_Name = vSubset_Source_File_Name;

IF( sSubset_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sSubset_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,,E,A,A';
	sSubsetElementList = sDimension_List | ',,' | sBuild_Version | ',,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sSubset_Import_File_Name
		,'pCubeName', sSubset_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;


sProcess_Parameter_Import_File_Name = vProcess_Parameter_Source_File_Name;

IF( sProcess_Parameter_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sProcess_Parameter_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,A,A,A';
	sSubsetElementList = 'BLD.Model.Update.Hierarchy.Date.Balance,,,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sProcess_Parameter_Import_File_Name
		,'pCubeName', sProcess_Parameter_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;

sAction = IF( pTargetAction @<> '', pTargetAction, 'Include');
sUpdate_Hierarchy = IF( pTargetUpdateFlag @<> '', pTargetUpdateFlag, vUpdate_Hierarchy );
sUpdate_Elements = IF( pTargetUpdateFlag @<> '', pTargetUpdateFlag, vUpdate_Elements );
sUpdate_Subsets = IF( pTargetUpdateFlag @<> '', pTargetUpdateFlag, vUpdate_Subsets );

## Update BLD Dimension Control cube
CellPutS( sAction, sDimension_Control_Cube_Name, sBuild_Profile, sDimension_List, 'Action' );
CellPutS( sBuild_Version, sDimension_Control_Cube_Name, sBuild_Profile, sDimension_List, 'Build Version' );
CellPutS( sUpdate_Hierarchy, sDimension_Control_Cube_Name, sBuild_Profile, sDimension_List, 'Update Hierarchy' );
CellPutS( sUpdate_Elements, sDimension_Control_Cube_Name, sBuild_Profile, sDimension_List, 'Update Elements' );
CellPutS( sUpdate_Subsets, sDimension_Control_Cube_Name, sBuild_Profile, sDimension_List, 'Update Subsets' );

ElementAttrPutS( sBuild_Profile, 'BLD Dimension List', 'BLD Dimension List', vDimension_List, 'Default Build Profile' );
575,17

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nLog_Source <> 0);
	ExecuteProcess( sLog_Close_Process_Name, 'pLogToken', sLogToken, 'pErrorMessage', IF(nError_Occurred = 0, '', sError_Message) );
ELSE;
	IF(nError_Occurred <> 0);
		ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'ERROR', 'pMessage', sError_Message);
	ENDIF;
ENDIF;


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
