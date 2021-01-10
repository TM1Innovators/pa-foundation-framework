601,100
602,"BLD.Model.Update.All.Cubes"
562,"VIEW"
586,"BLD Cube Control"
585,"BLD Cube Control"
564,
565,"ilIq<zBpGaAU?C=7Vpb1`V0GfQsf8m0btT@T8Zw36SCNKYIIr:qPtIz5TPsQDLPSzS`y@9JTAbF3ebHUFeQUElXn8Z;idT1KTKfQAit@:3k;zpya0^asxFB7Kw]h8[030^7HeSt7m8L=[3>11E4pU;GSl5CmTTdK[C_<Rs65V<ncwZkIneMbWN:MiLvnjyPBQ70mb<\l"
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
560,4
pBuildProfile
pCubeList
pUpdateDimensions
pLogToken
561,4
2
2
2
2
590,4
pBuildProfile,""
pCubeList,""
pUpdateDimensions,""
pLogToken,""
637,4
pBuildProfile,""
pCubeList,""
pUpdateDimensions,""
pLogToken,""
577,7
vBuild_Profile
vCube_List
vMeasure
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,7
2
2
2
2
1
2
1
579,7
1
2
3
4
0
0
0
580,7
0
0
0
0
0
0
0
581,7
0
0
0
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,112

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

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sCube_Update_Process_Name = 'BLD.Model.Update.Cube';
sView_Update_Process_Name = 'BLD.Model.Update.View';
sData_Update_Process_Name = 'BLD.Model.Update.Data';

sSource_Cube_Name = 'BLD Cube Control';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sControl_Cube_Name = 'SYS Control';
sBuild_Profile_Dimension_Name = 'BLD Build Profile';

## Define source dimension elements

## [BLD Build Profile]
## Use the build profile element passed from the pBuildProfile parameter

sSource_Build_Profile_Type = 'E';
sSource_Build_Profile_Element = pBuildProfile;

IF(sSource_Build_Profile_Element @= '');
	sDefault_Profile_Name = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Build Profile');
	sSource_Build_Profile_Element = IF( DIMIX( sBuild_Profile_Dimension_Name, sDefault_Profile_Name) = 0, DIMNM( sBuild_Profile_Dimension_Name, 1), sDefault_Profile_Name);
ENDIF;

## Define a variable for each dimension in the source cube...
## Set to blank or a single element as appropriate

## [BLD Cube List]
## If pCube_List parameter is blank, set to all

sSource_Cube_List_Type = 'A';
sSource_Cube_List_Element = '';

## If pCube_List parameter is specified, create subset and set to S (Subset)
IF(pCubeList @<> '');
	## TODO: Need to change the Type to S and create a subset
	## Don't forget to cleanup the subset in the Epilog!

	sSource_Cube_List_Type = 'E';
	sSource_Cube_List_Element = pCubeList;
ENDIF;

## [BLD Cube Control Measure]
## We just want to read items for which the 'Action' isn't blank.

sSource_Measure_Type = 'E';
sSource_Measure_Element = 'Action';

## Define variables for hard-coded dimension elements
## For standard dimensions, no need to pass parameters

sSource_Subset_Type_List = ''
	| sSource_Build_Profile_Type | ','
	| sSource_Cube_List_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Build_Profile_Element | ','
	| sSource_Cube_List_Element | ','
	| sSource_Measure_Element;


## Create source view and set data source

ExecuteProcess( sCube_Create_Temp_Process_Name
	,'pCubeName', sSource_Cube_Name
	,'pSubsetTypeList', sSource_Subset_Type_List
	,'pSubsetElementList', sSource_Subset_Element_List
	,'pSkipZero', 1, 'pSkipConsolidated', 0, 'pSkipCalculated', 0
	,'pOverwriteView', 1);

sSource_View_Name = OutputViewName;
sSource_Subset_Name = OutputSubsetName;

DataSourceType = 'VIEW';
DatasourceNameForServer = sSource_Cube_Name;
DatasourceNameForClient = sSource_Cube_Name;
DatasourceCubeView = sSource_View_Name;
573,11

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Include');
	ExecuteProcess(sCube_Update_Process_Name, 'pCubeList', vCube_List, 'pBuildProfile', vBuild_Profile, 'pUpdateDimensions', pUpdateDimensions, 'pLogToken', sLogToken);
ENDIF;
574,11

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Include');
	ExecuteProcess(sView_Update_Process_Name, 'pCubeList', vCube_List, 'pBuildProfile', vBuild_Profile, 'pLogToken', sLogToken);
ENDIF;
575,23

#****Begin: Generated Statements***
#****End: Generated Statements****

ExecuteProcess( sCube_Cleanup_Temp_Process_Name
	,'pCubeName', sSource_Cube_Name
	,'pViewName', sSource_View_Name
	,'pSubsetName', sSource_Subset_Name);


IF(nLog_Source <> 0);
	ExecuteProcess( sLog_Close_Process_Name, 'pLogToken', sLogToken, 'pErrorMessage', IF(nError_Occurred = 0, '', sError_Message) );
ELSE;
	IF(nError_Occurred <> 0);
		ExecuteProcess('ADM.Log.Write', 'pLogToken', sLogToken, 'pMessageType', 'ERROR', 'pMessage', sError_Message);
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
