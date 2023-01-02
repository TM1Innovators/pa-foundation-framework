601,100
602,"BLD.Model.Import.All.Cubes"
562,"CHARACTERDELIMITED"
586,"C:\TM1Servers\ffm-dev\import\sample\Cube_Control.csv"
585,"C:\TM1Servers\ffm-dev\import\sample\Cube_Control.csv"
564,
565,"s_oEMzKGBbJ>DnAHQ=Ea>k6hMGdVTeU=Y9L7rXDDnYJjwQu=j_xczW<]ZU?yF2jXAN<^bJr`[jmFr0?vV[tgF6LQYit2R@JIBo=N6?H`c3e@J_rybo\a\JJ39E<llQqx>TR_O3wl=OZoo6U4NDzH=qQ9o`QoQdvaC7Z72;tYd<Oz6^oU748DUa_6b]X4p30IJp_M36=r"
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
pCubeControlFileName
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
pCubeControlFileName,""
pTargetBuildVersion,""
pTargetBuildProfile,""
pTargetAction,""
pTargetUpdateFlag,""
pLogToken,""
637,7
pImportLocation,""
pCubeControlFileName,""
pTargetBuildVersion,""
pTargetBuildProfile,""
pTargetAction,""
pTargetUpdateFlag,""
pLogToken,""
577,8
vCube_Name
vBuild_Profile
vCube_List
vBuild_Version
vUpdate_Cube
vUpdate_Views
vCube_Source_File_Name
vView_Source_File_Name
578,8
2
2
2
2
2
2
2
2
579,8
1
2
3
4
5
6
7
8
580,8
0
0
0
0
0
0
0
0
581,8
0
0
0
0
0
0
0
0
582,9
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
IgnoredInputVarName=V9VarType=33ColType=1165
603,0
572,65

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
sCube_Source_Cube_Name = 'BLD Cube Source';
sView_Source_Cube_Name = 'BLD View Source';

sCube_Control_Cube_Name = 'BLD Cube Control';
sSource_Measure_Name = sCube_Control_Cube_Name | ' Measure';

sControl_Cube_Name = 'SYS Control';
sBuild_Profile_Dimension_Name = 'BLD Build Profile';
sCube_List_Dimension_Name = 'BLD Cube List';
sCube_Version_Dimension_Name = 'BLD Cube Version';


## Setup cube control file variables

sBase_Import_File_Path = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Import Path');
sBase_Import_File_Path = IF( sBase_Import_File_Path @= '', '..\import', sBase_Import_File_Path );

sImport_Location = pImportLocation;
sImport_File_Path = sBase_Import_File_Path | '\' | sImport_Location;

sCube_Control_File_Name = pCubeControlFileName;
sCube_Control_Full_Path = sImport_File_Path | '\' | sCube_Control_File_Name;

IF( FileExists( sCube_Control_Full_Path ) = 0);
	nError_Occurred = 1;
	sError_Message = 'Cube control file "' | sCube_Control_Full_Path | '" not found. Aborting process.';
	ItemReject(sError_Message);
ENDIF;

### Attach source file to process

DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = sCube_Control_Full_Path;
DatasourceNameForClient = sCube_Control_Full_Path;
DatasourceASCIIHeaderRecords = 1;
573,23

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

sCube_List = vCube_List;
sBuild_Version = IF( pTargetBuildVersion @= '', vBuild_Version, pTargetBuildVersion );
sBuild_Profile = IF( pTargetBuildProfile @= '', vBuild_Profile, pTargetBuildProfile );

IF( DIMIX( sCube_List_Dimension_Name, sCube_List ) = 0);
	DimensionElementInsert( sCube_List_Dimension_Name, '', sCube_List, 'n' );
ENDIF;

IF( DIMIX( sCube_Version_Dimension_Name, sBuild_Version ) = 0);
	DimensionElementInsert( sCube_Version_Dimension_Name, '', sBuild_Version, 'n' );
ENDIF;

IF( DIMIX ( sBuild_Profile_Dimension_Name, pTargetBuildProfile) = 0 );
	DimensionElementInsert ( sBuild_Profile_Dimension_Name, '', sBuild_Profile, 'n' );
ENDIF;
574,56

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

sCube_List = vCube_List;
sBuild_Version = IF( pTargetBuildVersion @= '', vBuild_Version, pTargetBuildVersion );
sBuild_Profile = IF( pTargetBuildProfile @= '', vBuild_Profile, pTargetBuildProfile );

sCube_Import_File_Name = vCube_Source_File_Name;

IF( sCube_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sCube_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,E,A,A';
	sSubsetElementList = sCube_List | ',' | sBuild_Version | ',,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sCube_Import_File_Name
		,'pCubeName', sCube_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;


sView_Import_File_Name = vView_Source_File_Name;

IF( sView_Import_File_Name @<> '' & FileExists( sImport_File_Path | '\' | sView_Import_File_Name ) = 1 );

	sSubsetTypeList = 'E,E,A,A,A';
	sSubsetElementList = sCube_List | ',' | sBuild_Version | ',,,';

	ExecuteProcess( sData_Import_Process_Name
		,'pImportFilePath', sImport_File_Path
		,'pImportFileName', sView_Import_File_Name
		,'pCubeName', sView_Source_Cube_Name
		,'pTargetSubsetTypeList', sSubsetTypeList
		,'pTargetSubsetElementList', sSubsetElementList);

ENDIF;

sAction = IF( pTargetAction @<> '', pTargetAction, 'Include');
sUpdate_Cube = IF( pTargetUpdateFlag @<> '', pTargetUpdateFlag, vUpdate_Cube );
sUpdate_Views = IF( pTargetUpdateFlag @<> '', pTargetUpdateFlag, vUpdate_Views );

## TODO: Update BLD Cube Control cube
CellPutS( sAction, sCube_Control_Cube_Name, sBuild_Profile, sCube_List, 'Action' );
CellPutS( sBuild_Version, sCube_Control_Cube_Name, sBuild_Profile, sCube_List, 'Build Version' );
CellPutS( sUpdate_Cube, sCube_Control_Cube_Name, sBuild_Profile, sCube_List, 'Update Cube' );
CellPutS( sUpdate_Views, sCube_Control_Cube_Name, sBuild_Profile, sCube_List, 'Update Views' );

ElementAttrPutS( sBuild_Profile, 'BLD Cube List', 'BLD Cube List', vCube_List, 'Default Build Profile' );
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
