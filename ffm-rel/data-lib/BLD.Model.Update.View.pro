601,100
602,"BLD.Model.Update.View"
562,"VIEW"
586,"BLD View Source"
585,"BLD View Source"
564,
565,"p0bgvMdK]@TVCMr\aPsi]1DRHkOziiC]Ibj5S]S2t:`d^gossLV[qENAl6sq6[7m^v9d0wAled=XDiKv<ITKSbkPXRYpQrdgRQSwRS^nDLOzgiq?ixa6^s?iEnk_keZumabqg7ovrFBR;G:a^[i155fA3rYN;wnm0IFFSiqvl8ZC?>Q17[j`_4E23G2dzF]2JIbroPpO"
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
560,3
pBuildProfile
pCubeList
pLogToken
561,3
2
2
2
590,3
pBuildProfile,""
pCubeList,""
pLogToken,""
637,3
pBuildProfile,""
pCubeList,""
pLogToken,""
577,9
vCube_List
vCube_Version
vView_List
vCube_Dimension_List
vMeasure
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,9
2
2
2
2
2
2
1
2
1
579,9
1
2
3
4
5
6
0
0
0
580,9
0
0
0
0
0
0
0
0
0
581,9
0
0
0
0
0
0
0
0
0
582,6
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,117

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
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Process started for cube [' | pCubeList | '] and Build Profile [' | pBuildProfile | ']...');
ENDIF;

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sCube_Create_Process_Name = 'SYS.Cube.View.Create';

sSource_Cube_Name = 'BLD View Source';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sCube_Control_Cube_Name = 'BLD Cube Control';

## Get Cube Control Properties

sSource_Build_Profile_Element = pBuildProfile;
IF(sSource_Build_Profile_Element @= '');
	sSource_Build_Profile_Element = 'Default';
ENDIF;

sUpdate_View = CellGetS(sCube_Control_Cube_Name, sSource_Build_Profile_Element, pCubeList, 'Update Views');
sView_Version = CellGetS(sCube_Control_Cube_Name, sSource_Build_Profile_Element, pCubeList, 'View Version');

## Create source view and set data source

## Define a variable for each dimension in the source cube...
## Set Cube List Type to blank, single element, considated element or subset as appropriate

## Specify the BLD Cube List element. 
## We just want to process rhw BLD Dimension List element passed in the pDimensionList parameter

sSource_Cube_List_Type = 'E';
sSource_Cube_List_Element = pCubeList;

## Specify the BLD Cube Version element. 
## We want to read items from the dimension version element specified in the BLD Cube Control cube

sSource_Cube_Version_Type = 'E';
sSource_Cube_Version_Element = sView_Version;

## Specify the BLD Cube Version element. 
## We want to read items from the dimension version element specified in the BLD Cube Control cube

sSource_View_List_Type = 'A';
sSource_View_List_Element = '';

## Specify the BLD Cube Dimension List element. 
## We just want to read items from the 'All Cube Dimension List' line

sSource_Cube_Dimension_List_Type = 'E';
sSource_Cube_Dimension_List_Element = 'All Cube Dimension List';

## Specify the BLD Cube Source Measure element. 
## We just want to read items for which the 'Action' isn't blank.

sSource_Measure_Type = 'E';
sSource_Measure_Element = 'Action';

## Define variables for hard-coded dimension elements
## For standard dimensions, no need to pass parameters

sSource_Subset_Type_List = ''
	| sSource_Cube_List_Type | ','
	| sSource_Cube_Version_Type | ','
	| sSource_View_List_Type | ','
	| sSource_Cube_Dimension_List_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Cube_List_Element | ','
	| sSource_Cube_Version_Element | ','
	| sSource_View_List_Element | ','
	| sSource_Cube_Dimension_List_Element | ','
	| sSource_Measure_Element;

## Create the temporary view
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
573,93

#****Begin: Generated Statements***
#****End: Generated Statements****


sAction = vValue;
sCube_Name = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'Cube Name');
sView_Name = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'View Name');
nDimension_Count = CellGetN( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, 'Total Cube Dimension List', 'Dimension Count');

IF( sAction @= 'Ignore' );
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping view [' | vView_List | '>>' | sView_Name | '] for cube [' | vCube_List | '>>' |  sCube_Name | ']. The [Action] parameter is set to [' | sAction | '].');
	ItemSkip;
ENDIF;

IF( sAction @= 'Update' );
	IF( ViewExists( sCube_Name, sView_Name ) = 1 );
		ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping view [' | vView_List | '>>' | sView_Name | '] for cube [' | vCube_List | '>>' |  sCube_Name | ']. The [Action] parameter is set to [' | sAction | '].');
		ItemSkip;
	ELSE;
		ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Updating view [' | vView_List | '>>' | sView_Name | '] for cube [' | vCube_List | '>>' |  sCube_Name | ']. The [Action] parameter is set to [' | sAction | '].');
		ViewCreate( sCube_Name, sView_Name );
	ENDIF;
ENDIF;

IF( sAction @= 'Recreate' );
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Recreating view [' | vView_List | '>>' | sView_Name | '] for cube [' | vCube_List | '>>' |  sCube_Name | ']. The [Action] parameter is set to [' | sAction | '].');
	IF( ViewExists( sCube_Name, sView_Name ) = 1 );
		ViewDestroy( sCube_Name, sView_Name );
	ENDIF;
	ViewCreate( sCube_Name, sView_Name );
ENDIF;

IF( sAction @= 'Delete' );
	IF( ViewExists( sCube_Name, sView_Name ) = 1 );
		ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Deleting view [' | vView_List | '>>' | sView_Name | '] for cube [' | vCube_List | '>>' |  sCube_Name | ']. The [Action] parameter is set to [' | sAction | '].');
		ViewDestroy( sCube_Name, sView_Name );
		ItemSkip;
	ENDIF;
ENDIF;


nCount = nDimension_Count;
nIndex = 1;

WHILE( nIndex <= nCount );

	## Loop all dimensions and add each to the appropriate view location: Title, Column or Row.

	sDimension_Number = TRIM(STR(nIndex, 15, 0));
	nDimension_Number_Length = 3;
	sDimension_Number_Padded = FILL( '0', nDimension_Number_Length - LONG( sDimension_Number ) ) | sDimension_Number;
	sCurrent_Cube_Dimension_List = 'Dimension ' | sDimension_Number_Padded;
	
	sCube_Dimension_Name = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, sCurrent_Cube_Dimension_List, 'Dimension Name');
	sCube_Dimension_Position = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, sCurrent_Cube_Dimension_List, 'Dimension Position');
	sCube_Dimension_Index = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, sCurrent_Cube_Dimension_List, 'Dimension Index');

	sCube_Dimension_Subset_Name = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, sCurrent_Cube_Dimension_List, 'Subset Name');

	IF( sCube_Dimension_Position @= '' % sCube_Dimension_Position @= 'Title' );
		ViewTitleDimensionSet( sCube_Name, sView_Name, sCube_Dimension_Name );
		ViewSubsetAssign(sCube_Name, sView_Name, sCube_Dimension_Name, sCube_Dimension_Subset_Name );
		# ViewTitleElementSet( sCube_Name, sView_Name, sCube_Dimension_Name, nDimension_Index);
	ENDIF;

	IF( sCube_Dimension_Position @= 'Column' );
		ViewColumnDimensionSet( sCube_Name, sView_Name, sCube_Dimension_Name, NUMBR(sCube_Dimension_Index));
		ViewSubsetAssign(sCube_Name, sView_Name, sCube_Dimension_Name, sCube_Dimension_Subset_Name );
	ENDIF;

	IF( sCube_Dimension_Position @= 'Row' );
		ViewRowDimensionSet( sCube_Name, sView_Name, sCube_Dimension_Name, NUMBR(sCube_Dimension_Index));
		ViewSubsetAssign(sCube_Name, sView_Name, sCube_Dimension_Name, sCube_Dimension_Subset_Name );
	ENDIF;

	nIndex = nIndex + 1;

END;

sSuppress_Zero_Columns = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'Suppress Zero on Columns');
sSuppress_Zero_Rows = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'Suppress Zero on Rows');

ViewColumnSuppressZeroesSet(sCube_Name, sView_Name, IF(sSuppress_Zero_Columns @= 'Yes', 1, 0));
ViewRowSuppressZeroesSet(sCube_Name, sView_Name, IF(sSuppress_Zero_Rows @= 'Yes', 1, 0));

sSkip_Zero = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'Skip Zero/Blank Values');
sSkip_Consolidated = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'Skip Consolidated Values');
sSkip_Calculated = CellGetS( sSource_Cube_Name, vCube_List, vCube_Version, vView_List, vCube_Dimension_List, 'Skip Rule Calculated Values');

ViewExtractSkipCalcsSet ( sCube_Name, sView_Name, IF( sSkip_Calculated @= 'Yes', 1, 0) );
ViewExtractSkipRuleValuesSet ( sCube_Name, sView_Name, IF( sSkip_Calculated @= 'Yes', 1, 0) );
ViewExtractSkipZeroesSet ( sCube_Name, sView_Name, IF( sSkip_Zero @= 'Yes', 1, 0) );
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,24

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
		ExecuteProcess( sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'ERROR', 'pMessage', sError_Message);
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
