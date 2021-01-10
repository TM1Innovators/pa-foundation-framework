601,100
602,"BLD.Model.Export.All.Dimensions"
562,"VIEW"
586,"BLD Dimension Control"
585,"BLD Dimension Control"
564,
565,"pHEjh_LyGQWHsjyaaKj8PYJcrNqG`omA6<5nj0>NdsUN?YBqmf@3@PJblItvJTOAZu?H^=Ljd22WbfL<26OybLVmu<uQB_FofqM3qPqL6GhtJ[EAG\_MWG\S7lyes1@Is[`d[BoAI?cB@1UZRhn9?O]i_5_4wgj\]MiM;m\4sROlPalKn8d1yWjNcq4kbDMx3OPH\pi8"
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
560,5
pBuildProfile
pDimensionList
pExportLocation
pDimensionControlFileName
pLogToken
561,5
2
2
2
2
2
590,5
pBuildProfile,""
pDimensionList,""
pExportLocation,""
pDimensionControlFileName,""
pLogToken,""
637,5
pBuildProfile,""
pDimensionList,""
pExportLocation,""
pDimensionControlFileName,""
pLogToken,""
577,7
vBuild_Profile
vDimension_List
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
572,140

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
StringGlobalVariable('OutputTempName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';
sUnique_String_Process_Name = 'SUB.Text.String.Create_Unique';

ExecuteProcess( sUnique_String_Process_Name );
sUniqueString = OutputTempName;

sData_Export_Process_Name = 'SYS.Cube.Data.Export';

sDimension_Source_Cube_Name = 'BLD Dimension Source';
sAttribute_Source_Cube_Name = 'BLD Attribute Source';
sElement_Source_Cube_Name = 'BLD Element Source';
sSubset_Source_Cube_Name = 'BLD Subset Source';
sProcess_Parameter_Source_Cube_Name = 'BLD Process Parameter Source';

sSource_Cube_Name = 'BLD Dimension Control';
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

sExport_File_Format_String = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Export File Format String');

## Define a variable for each dimension in the source cube...
## Set to blank or a single element as appropriate

## [BLD Dimension List]
## If pDimension_List parameter is blank, set to all

sSource_Dimension_List_Type = 'A';
sSource_Dimension_List_Element = '';

## If pDimension_List parameter is specified, create subset and set to S (Subset)
IF(pDimensionList @<> '');
	## TODO: Need to change the Type to S and create a subset
	## Don't forget to cleanup the subset in the Epilog!

	sSource_Dimension_List_Type = 'E';
	sSource_Dimension_List_Element = pDimensionList;
ENDIF;

## [BLD Dimension Control Measure]
## We just want to read items for which the 'Action' isn't blank.

sSource_Measure_Type = 'E';
sSource_Measure_Element = 'Action';


## Setup export control file

sBase_Export_File_Path = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Export Path');
sBase_Export_File_Path = IF( sBase_Export_File_Path @= '', '..\export', sBase_Export_File_Path );

sExport_Location = IF ( pExportLocation @<> '', pExportLocation, sUniqueString );
sExport_File_Path = sBase_Export_File_Path | '\' | sExport_Location;

IF( FileExists( sExport_File_Path ) = 0);
	ExecuteCommand( 'cmd /c mkdir "' | sExport_File_Path | '"', 1 );
ENDIF;

sDimension_Control_File_Format_String = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Control File Format String' );
sObjectType = 'Dimension';

sDimension_Control_File_Name = IF( pDimensionControlFileName@= '', EXPAND( IF(sDimension_Control_File_Format_String @= '', 'Dimension_Control_%sUniqueString%.csv', sDimension_Control_File_Format_String )), EXPAND( pDimensionControlFileName ));
sDimension_Control_Full_Path = sBase_Export_File_Path | '\' | sExport_Location | '\' | sDimension_Control_File_Name;
nFirst_Time_Flag = 0;


## Create source view and set data source

sSource_Subset_Type_List = ''
	| sSource_Build_Profile_Type | ','
	| sSource_Dimension_List_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Build_Profile_Element | ','
	| sSource_Dimension_List_Element | ','
	| sSource_Measure_Element;

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
573,7

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;
574,105

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Include');

	sBuild_Version = CellGetS( sSource_Cube_Name, vBuild_Profile, vDimension_List, 'Build Version');

	sObjectName = vDimension_List;
	sObjectVersion = sBuild_Version;
	

	## Export from BLD Dimension Source ##

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = vDimension_List | ',,' | sBuild_Version | ',,';

	sObjectType = 'Dimension_Source';
	sUpdate_Hierarchy = CellGetS( sSource_Cube_Name, vBuild_Profile, vDimension_List, 'Update Hierarchy');
	sHierarchy_Export_File_Name = EXPAND( sExport_File_Format_String );

	ExecuteProcess( sData_Export_Process_Name
		,'pExportFilePath', sExport_File_Path
		,'pExportFileName', sHierarchy_Export_File_Name
		,'pCubeName', sDimension_Source_Cube_Name
		,'pSubsetTypeList', sSubsetTypeList
		,'pSubsetElementList', sSubsetElementList);


	## Export from BLD Attribute Source ##

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = vDimension_List | ',,' | sBuild_Version | ',,';

	sObjectType = 'Attribute_Source';
	sAttribute_Export_File_Name = EXPAND( sExport_File_Format_String );

	ExecuteProcess( sData_Export_Process_Name
		,'pExportFilePath', sExport_File_Path
		,'pExportFileName', sAttribute_Export_File_Name
		,'pCubeName', sAttribute_Source_Cube_Name
		,'pSubsetTypeList', sSubsetTypeList
		,'pSubsetElementList', sSubsetElementList);


	## Export from BLD Element Source ##

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = vDimension_List | ',,' | sBuild_Version | ',,';

	sObjectType = 'Element_Source';
	sUpdate_Elements = CellGetS( sSource_Cube_Name, vBuild_Profile, vDimension_List, 'Update Elements');
	sElement_Export_File_Name = EXPAND( sExport_File_Format_String );

	ExecuteProcess( sData_Export_Process_Name
		,'pExportFilePath', sExport_File_Path
		,'pExportFileName', sElement_Export_File_Name
		,'pCubeName', sElement_Source_Cube_Name
		,'pSubsetTypeList', sSubsetTypeList
		,'pSubsetElementList', sSubsetElementList);


	## Export from BLD Subset Source ##

	sSubsetTypeList = 'E,A,E,A,A';
	sSubsetElementList = vDimension_List | ',,' | sBuild_Version | ',,';

	sObjectType = 'Subset_Source';
	sUpdate_Subsets = CellGetS( sSource_Cube_Name, vBuild_Profile, vDimension_List, 'Update Subsets');
	sSubset_Export_File_Name = EXPAND( sExport_File_Format_String );

	ExecuteProcess( sData_Export_Process_Name
		,'pExportFilePath', sExport_File_Path
		,'pExportFileName', sSubset_Export_File_Name
		,'pCubeName', sSubset_Source_Cube_Name
		,'pSubsetTypeList', sSubsetTypeList
		,'pSubsetElementList', sSubsetElementList);

	## Export from BLD Process Parameter Source ##

	sSubsetTypeList = 'E,A,A,A';
	sSubsetElementList = 'BLD.Model.Update.Hierarchy.Date.Balance,,,';

	sObjectType = 'Process_Parameter_Source';
	sProcess_Parameter_Export_File_Name = EXPAND( sExport_File_Format_String );

	ExecuteProcess( sData_Export_Process_Name
		,'pExportFilePath', sExport_File_Path
		,'pExportFileName', sProcess_Parameter_Export_File_Name
		,'pCubeName', sProcess_Parameter_Source_Cube_Name
		,'pSubsetTypeList', sSubsetTypeList
		,'pSubsetElementList', sSubsetElementList);

	IF ( nFirst_Time_Flag = 0  );
		ASCIIOUTPUT( sDimension_Control_Full_Path, 'Source Cube Name', 'BLD Build Profile', 'BLD Dimension List', 'Build Version', 'Update Hierarchy', 'Update Elements', 'Update Subsets', 'Hierarchy Export File Name', 'Attribute Export File Name', 'Element Export File Name', 'Subset Export File Name', 'Process Parameter Export File Name' );
		nFirst_Time_Flag = 1;
	ENDIF;

	ASCIIOUTPUT( sDimension_Control_Full_Path, sSource_Cube_Name, vBuild_Profile, vDimension_List, sBuild_Version, sUpdate_Hierarchy, sUpdate_Elements, sUpdate_Subsets, sHierarchy_Export_File_Name, sAttribute_Export_File_Name, sElement_Export_File_Name, sSubset_Export_File_Name, sProcess_Parameter_Export_File_Name );

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
