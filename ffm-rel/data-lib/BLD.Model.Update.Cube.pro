601,100
602,"BLD.Model.Update.Cube"
562,"VIEW"
586,"BLD Cube Source"
585,"BLD Cube Source"
564,
565,"vM\w2pEe=[cCs<TKvN=bn9a5<[]ApbVzVR<1LwkgI=1f<?I8Mys[<_rany97_Bh6^BS``zwKmKgfsEBu>i5@bUTUk;Q6FdkOjJ7yXdw1LGeo2KpKTTlw4rFpstU?>z^xNzUK:4yHpU42sWd[SISyanuK_cm;NP8lSUyN70`68NQ0:7]Y?vtRZ;8c^b>GSBXX_a?xE8g2"
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
577,8
vCube_List
vCube_Version
vCube_Dimension_List
vMeasure_Name
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,8
2
2
2
2
2
1
2
1
579,8
1
2
3
4
5
0
0
0
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
582,5
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,126

#****Begin: Generated Statements***
#****End: Generated Statements****

## Log process start

StringGlobalVariable('OutputLogToken');
StringGlobalVariable('OutputTempName');
StringGlobalVariable('OutputPicklistCubeName');

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

sView_Create_Process_Name = 'BLD.Model.Update.View';
sData_Import_Process_Name = 'BLD.Model.Update.Data';
sDimension_Update_Process_Name = 'BLD.Model.Update.Dimension';

sUniqueStringCreateProcessName = 'SUB.Text.String.Create_Unique';

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sCube_Create_Process_Name = 'SYS.Cube.Create';
sPicklist_Cube_Create_Process_Name = 'SYS.Cube.Picklist.Create';
sRule_Attach_Process_Name = 'SYS.Cube.Rule.Attach_From_File';

sSource_Cube_Name = 'BLD Cube Source';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sCube_Control_Cube_Name = 'BLD Cube Control';

## Get Cube Control Properties

sSource_Build_Profile_Element = pBuildProfile;
IF(sSource_Build_Profile_Element @= '');
	sSource_Build_Profile_Element = 'Default';
ENDIF;

sUpdateDimensions = LOWER( TRIM( SUBST( pUpdateDimensions, 1, 1 )));

sUpdate_Cube = CellGetS(sCube_Control_Cube_Name, sSource_Build_Profile_Element, pCubeList, 'Update Cube');
sCube_Version = CellGetS(sCube_Control_Cube_Name, sSource_Build_Profile_Element, pCubeList, 'Cube Version');

sDimension_List_Dimension_Name = 'BLD Dimension List';
ExecuteProcess(sUniqueStringCreateProcessName);
sDimension_List_Subset_Name = OutputTempName;

sMDX_Dimension_Search = '{ UNION( {FILTER( {TM1SUBSETALL( [BLD Dimension List] )}, [BLD Dimension List].CurrentMember.Name = "%sTarget_Dimension_Name%" AND [BLD Dimension Source].( [BLD Dimension Source Measure].[Dimension Name] ) = "")}, {FILTER( {TM1SUBSETALL( [BLD Dimension List] )}, [BLD Dimension Source].( [BLD Dimension Source Measure].[Dimension Name] ) = "%sTarget_Dimension_Name%" )} )}';

## Create source view and set data source

## Define a variable for each dimension in the source cube...
## Set Cube List Type to blank, single element, considated element or subset as appropriate

## Specify the BLD Cube List element. 
## We just want to process the BLD Dimension List element passed in the pDimensionList parameter

sSource_Cube_List_Type = 'E';
sSource_Cube_List_Element = pCubeList;

## Specify the BLD Cube Version element. 
## We want to read items from the dimension version element specified in the BLD Cube Control cube

sSource_Cube_Version_Type = 'E';
sSource_Cube_Version_Element = sCube_Version;

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
	| sSource_Cube_Dimension_List_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Cube_List_Element | ','
	| sSource_Cube_Version_Element | ','
	| sSource_Cube_Dimension_List_Element | ','
	| sSource_Measure_Element;

## Create the temporary view
ExecuteProcess( sCube_Create_Temp_Process_Name
	,'pCubeName', sSource_Cube_Name
	,'pSubsetTypeList', sSource_Subset_Type_List
	,'pSubsetElementList', sSource_Subset_Element_List
	,'pSkipZero', 1, 'pSkipConsolidated', 0, 'pSkipCalculated', 0
	,'pOverwriteView', 1);

sView_Name = OutputViewName;
sSubset_Name = OutputSubsetName;

DataSourceType = 'VIEW';
DatasourceNameForServer = sSource_Cube_Name;
DatasourceNameForClient = sSource_Cube_Name;
DatasourceCubeView = sView_Name;
573,178

#****Begin: Generated Statements***
#****End: Generated Statements****

## Create the cube if is doesn't exist, or if the Action is set to Recreate.

sAction = vValue;
sTargetCubeVersion = vCube_Version;
sTargetCubeName = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, vCube_Dimension_List, 'Target Cube Name');

IF( TRIM(sTargetCubeName) @= '' );
	sTargetCubeName = vCube_List;
ENDIF;

IF(sAction @<> 'Update' & sAction @<> 'Recreate');
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping cube [' | vCube_List | '>>' | sTargetCubeName | '] version [' | sTargetCubeVersion | ']. The [Action] parameter is set to [' | sAction | '].');
	ItemSkip;
ENDIF;

sTargetCubeDimensionName1 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 001', 'Dimension Name');
sTargetCubeDimensionName2 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 002', 'Dimension Name');
sTargetCubeDimensionName3 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 003', 'Dimension Name');
sTargetCubeDimensionName4 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 004', 'Dimension Name');
sTargetCubeDimensionName5 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 005', 'Dimension Name');
sTargetCubeDimensionName6 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 006', 'Dimension Name');
sTargetCubeDimensionName7 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 007', 'Dimension Name');
sTargetCubeDimensionName8 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 008', 'Dimension Name');
sTargetCubeDimensionName9 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 009', 'Dimension Name');
sTargetCubeDimensionName10 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 010', 'Dimension Name');
sTargetCubeDimensionName11 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 011', 'Dimension Name');
sTargetCubeDimensionName12 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 012', 'Dimension Name');
sTargetCubeDimensionName13 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 013', 'Dimension Name');
sTargetCubeDimensionName14 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 014', 'Dimension Name');
sTargetCubeDimensionName15 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 015', 'Dimension Name');
sTargetCubeDimensionName16 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 016', 'Dimension Name');
sTargetCubeDimensionName17 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 017', 'Dimension Name');
sTargetCubeDimensionName18 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 018', 'Dimension Name');
sTargetCubeDimensionName19 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 019', 'Dimension Name');
sTargetCubeDimensionName20 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 020', 'Dimension Name');
sTargetCubeDimensionName21 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 021', 'Dimension Name');
sTargetCubeDimensionName22 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 022', 'Dimension Name');
sTargetCubeDimensionName23 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 023', 'Dimension Name');
sTargetCubeDimensionName24 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 024', 'Dimension Name');
sTargetCubeDimensionName25 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 025', 'Dimension Name');
sTargetCubeDimensionName26 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 026', 'Dimension Name');
sTargetCubeDimensionName27 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 027', 'Dimension Name');
sTargetCubeDimensionName28 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 028', 'Dimension Name');
sTargetCubeDimensionName29 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 029', 'Dimension Name');
sTargetCubeDimensionName30 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 030', 'Dimension Name');
sTargetCubeDimensionName31 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 031', 'Dimension Name');
sTargetCubeDimensionName32 = CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, 'Dimension 032', 'Dimension Name');

IF( sUpdateDimensions @= 'y' );
	nCurrent_Dimension_Index = 1;
	WHILE( nCurrent_Dimension_Index <= 32 );
		sTarget_Dimension_Name = EXPAND('%sTargetCubeDimensionName' | TRIM(STR( nCurrent_Dimension_Index, 15, 0 )) | '%');

		IF( sTarget_Dimension_Name @<> '' );

			## Run the MDX to determine all the [BLD Dimension List] elements that build the current sTarget_Dimension_Name

			IF( HierarchySubsetExists( sDimension_List_Dimension_Name, '', sDimension_List_Subset_Name ) = 0 );
				HierarchySubsetCreate( sDimension_List_Dimension_Name, '', sDimension_List_Subset_Name, 1 );
			ENDIF;

			HierarchySubsetMDXSet( sDimension_List_Dimension_Name, '', sDimension_List_Subset_Name, EXPAND( sMDX_Dimension_Search ));
			HierarchySubsetMDXSet( sDimension_List_Dimension_Name, '', sDimension_List_Subset_Name, '' );

			## Loop through the subset created -- all matching [BLD Dimension List] elements.
			nCurrent_Dimension_List_Index = 1;
			nDimension_List_Count = HierarchySubsetGetSize( sDimension_List_Dimension_Name, '', sDimension_List_Subset_Name );

			WHILE( nCurrent_Dimension_List_Index <= nDimension_List_Count);

				## TODO: Since there is a bug in HierarchSubsetGetElementName, we use the older SubsetGetElementName.
				## This should be updated once we're no longer supporting versions where the bug exists.
				# sTarget_Dimension_List_Name = HierarchySubsetGetElementName( sDimension_List_Dimension_Name, '', sDimension_List_Subset_Name, nCurrent_Dimension_List_Index );
				sTarget_Dimension_List_Name = SubsetGetElementName( sDimension_List_Dimension_Name, sDimension_List_Subset_Name, nCurrent_Dimension_List_Index );

				ASCIIOUTPUT('..\temp\ti_cub_dim.txt', sTarget_Dimension_Name, sTarget_Dimension_List_Name );

				## TODO: Execute the dimension build for the current [BLD Dimension List]
				ExecuteProcess( sDimension_Update_Process_Name
					,'pBuildProfile', pBuildProfile
					,'pDimensionList', sTarget_Dimension_List_Name
					,'pLogToken', sLogToken );

				## NOTE: The build profile should be the same as the current cube build profile.
				nCurrent_Dimension_List_Index = nCurrent_Dimension_List_Index + 1;
			END;

		ENDIF;
	
		nCurrent_Dimension_Index = nCurrent_Dimension_Index + 1;
	END;
ENDIF;

IF( CubeExists(sTargetCubeName) = 0 % sAction @= 'Recreate');

	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Processing cube [' | vCube_List | '>>' | sTargetCubeName | '] version [' | sTargetCubeVersion | ']. The [Action] parameter is set to [' | sAction | '].');

	ExecuteProcess(sCube_Create_Process_Name
		,'pCubeName', sTargetCubeName
		,'pDimensionName1', sTargetCubeDimensionName1
		,'pDimensionName2', sTargetCubeDimensionName2
		,'pDimensionName3', sTargetCubeDimensionName3
		,'pDimensionName4', sTargetCubeDimensionName4
		,'pDimensionName5', sTargetCubeDimensionName5
		,'pDimensionName6', sTargetCubeDimensionName6
		,'pDimensionName7', sTargetCubeDimensionName7
		,'pDimensionName8', sTargetCubeDimensionName8
		,'pDimensionName9', sTargetCubeDimensionName9
		,'pDimensionName10', sTargetCubeDimensionName10
		,'pDimensionName11', sTargetCubeDimensionName11
		,'pDimensionName12', sTargetCubeDimensionName12
		,'pDimensionName13', sTargetCubeDimensionName13
		,'pDimensionName14', sTargetCubeDimensionName14
		,'pDimensionName15', sTargetCubeDimensionName15
		,'pDimensionName16', sTargetCubeDimensionName16
		,'pDimensionName17', sTargetCubeDimensionName17
		,'pDimensionName18', sTargetCubeDimensionName18
		,'pDimensionName19', sTargetCubeDimensionName19
		,'pDimensionName20', sTargetCubeDimensionName20
		,'pDimensionName21', sTargetCubeDimensionName21
		,'pDimensionName22', sTargetCubeDimensionName22
		,'pDimensionName23', sTargetCubeDimensionName23
		,'pDimensionName24', sTargetCubeDimensionName24
		,'pDimensionName25', sTargetCubeDimensionName25
		,'pDimensionName26', sTargetCubeDimensionName26
		,'pDimensionName27', sTargetCubeDimensionName27
		,'pDimensionName28', sTargetCubeDimensionName28
		,'pDimensionName29', sTargetCubeDimensionName29
		,'pDimensionName30', sTargetCubeDimensionName30
		,'pDimensionName31', sTargetCubeDimensionName31
		,'pDimensionName32', sTargetCubeDimensionName32
		,'pOverwrite', IF( sAction @= 'Recreate', 'Yes', 'No' ));

ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping cube [' | vCube_List | '>>' | sTargetCubeName | '] version [' | sTargetCubeVersion | ']. The [Action] parameter is set to [' | sAction | '].');
ENDIF;

IF( CubeExists(sTargetCubeName ) <> 0 & ( sAction @= 'Update' % sAction @= 'Recreate' ));

	sPicklistFilePath = EXPAND(CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, vCube_Dimension_List, 'Picklist File Path'));
	sPicklistFileName = EXPAND(CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, vCube_Dimension_List, 'Picklist File Name'));

	IF(sPicklistFilePath @<> '' & sPicklistFileName @<> '');

		ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Processing picklist for cube [' | vCube_List | '>>' | sTargetCubeName | '] version [' | sTargetCubeVersion | ']. The [Action] parameter is set to [' | sAction | '].');

		ExecuteProcess(sPicklist_Cube_Create_Process_Name
			,'pCubeName', sTargetCubeName
			,'pOverwrite', IF( sAction @= 'Recreate', 'Yes', 'No' ));

		sPicklistCubeName = OutputPicklistCubeName;

		ExecuteProcess(sRule_Attach_Process_Name
			,'pCubeName', sPicklistCubeName
			,'pRuleFilePath', sPicklistFilePath
			,'pRuleFileName', sPicklistFileName);
	ENDIF;
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping picklist for cube [' | vCube_List | '>>' | sTargetCubeName | '] version [' | sTargetCubeVersion | ']. The [Action] parameter is set to [' | sAction | '].');
ENDIF;

IF(sAction @= 'Update' % sAction @= 'Recreate');

	sRuleFilePath = EXPAND(CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, vCube_Dimension_List, 'Rule File Path'));
	sRuleFileName = EXPAND(CellGetS( sSource_Cube_Name , vCube_List, vCube_Version, vCube_Dimension_List, 'Rule File Name'));

	IF(sRuleFilePath @<> '' & sRuleFileName @<> '');
		ExecuteProcess(sRule_Attach_Process_Name
			,'pCubeName', sTargetCubeName
			,'pRuleFilePath', sRuleFilePath
			,'pRuleFileName', sRuleFileName);
	ENDIF;

ENDIF;
574,6

#****Begin: Generated Statements***
#****End: Generated Statements****



575,23

#****Begin: Generated Statements***
#****End: Generated Statements****

ExecuteProcess( sCube_Cleanup_Temp_Process_Name
	,'pCubeName', sSource_Cube_Name
	,'pViewName', sView_Name
	,'pSubsetName', sSubset_Name);


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
