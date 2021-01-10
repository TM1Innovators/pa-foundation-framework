601,100
602,"BLD.Model.Update.Hierarchy.Weighting"
562,"VIEW"
586,"BLD Dimension Source"
585,"BLD Dimension Source"
564,
565,"baaJ;jg@qNm<gS<xZBHdA0P4qw<I<:]JejClAVPT8zKSwqRHgjCs8epz>3S:gt6[S4:OgM;xiSB81s0[S0;z<tUxFtJd`IM^ivsYLkpdgZk8_SUmINiR0ErN[n^uyGvqzY=hJ26[cNJ1AlHjkv2kK8AjqJVXLY5qQU4:YqFy10f@2Iv2rQn`[]6Rn23OPtmYDPgrFD96"
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
pDimensionList
pHierarchyList
pLogToken
561,4
2
2
2
2
590,4
pBuildProfile,""
pDimensionList,""
pHierarchyList,""
pLogToken,""
637,4
pBuildProfile,""
pDimensionList,""
pHierarchyList,""
pLogToken,""
577,9
vHierarchy_List
vDimension_Version
vHierarchy_Level
vDimension_List
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
2
3
4
1
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
572,141

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
	# ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Process started for dimension [' | pDimensionList | '] and Build Profile [' | pBuildProfile | ']...');
ENDIF;


StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sHierarchy_Update_Process_Name = 'BLD.Model.Update.Hierarchy';
sElement_Update_Process_Name = 'BLD.Model.Update.Element';
sSubset_Update_Process_Name = 'BLD.Model.Update.Subset';

sHierarchy_Set_Weight_Process_Name = 'SYS.Dimension.Hierarchy.Set_Element_Weighting';

sSource_Cube_Name = 'BLD Dimension Source';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sDimension_Control_Cube_Name = 'BLD Dimension Control';
sDimension_Source_Cube_Name = 'BLD Dimension Source';

## Get Dimension Control Properties

sSource_Build_Profile_Element = pBuildProfile;
IF(sSource_Build_Profile_Element @= '');
	sSource_Build_Profile_Element = 'Default';
ENDIF;

sUpdate_Hierarchy = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Hierarchy');
sUpdate_Elements = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Elements');
sUpdate_Subsets = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Subsets');

sHierarchy_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Hierarchy Version');
sElement_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Element Version');
sSubset_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Subset Version');

sAction = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', pDimensionList, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);

IF( sUpdate_Hierarchy @<> 'Yes' );
	nSkip_Processing = 1;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping weightings for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']. The [Update Hierarchy] property is set to [' | sUpdate_Hierarchy | '].');
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Updating weightings for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']...');
ENDIF;


## Create source view and set data source

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## Specify the BLD Dimension List element. 
## We just want to process the BLD Dimension List element passed in the pDimensionList parameter

sSource_Dimension_List_Type = 'E';
sSource_Dimension_List_Element = pDimensionList;

## Specify the BLD Hierarchy List element. 
## We want to cycle through all the hierarchies with a defined Action parameter

sSource_Hierarchy_List_Type = 'E';
sSource_Hierarchy_List_Element = pHierarchyList;

## Specify the BLD Dimension Version element. 
## We want to read items from the dimension version element specified in the BLD Dimension Control cube

sSource_Dimension_Version_Type = 'E';
sSource_Dimension_Version_Element = sHierarchy_Version;

## Specify the BLD Hierarchy Level element. 
## We want to include just the 'All Hierachy Level' element

sSource_Hierarchy_Level_Type = 'E';
sSource_Hierarchy_Level_Element = 'All Hierarchy Level';

## Specify the BLD Dimension Source Measure element. 
## We just want to read items for which the 'Action' isn't blank.

sSource_Measure_Type = 'E';
sSource_Measure_Element = 'Action';

## Define variables for hard-coded dimension elements
## For standard dimensions, no need to pass parameters

sSource_Subset_Type_List = ''
	| sSource_Dimension_List_Type | ','
	| sSource_Hierarchy_List_Type | ','
	| sSource_Dimension_Version_Type | ','
	| sSource_Hierarchy_Level_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Dimension_List_Element | ','
	| sSource_Hierarchy_List_Element | ','
	| sSource_Dimension_Version_Element | ','
	| sSource_Hierarchy_Level_Element | ','
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
573,45

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;


IF( vValue @<> 'Ignore' & vValue @<> 'Delete' );

	nHierarchy_Level_Count = CellGetN( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'Total Hierarchy Level', 'Hierarchy Count') + 1;

	sTarget_Dimension_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, 'Primary', vDimension_Version, 'All Hierarchy Level', 'Dimension Name');
	sTarget_Dimension_Name = IF( sTarget_Dimension_Name @= '', vDimension_List, sTarget_Dimension_Name );
	sTarget_Hierarchy_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Hierarchy Name');
	sTarget_Hierarchy_Name = IF( sTarget_Hierarchy_Name @= '', sTarget_Dimension_Name, sTarget_Hierarchy_Name );

	sTotal_Element_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Total Element Name');

	## Loop through all Hierarchy Levels and set the weightings for that level via child process

	nHierarchy_Level_Index = 1;

	WHILE ( nHierarchy_Level_Index <= nHierarchy_Level_Count );

		sCurrent_Hierarchy_Level = SubsetGetElementName( 'BLD Hierarchy Level', 'Default', nHierarchy_Level_Index );
		sHierarchy_Weighting_Type = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, sCurrent_Hierarchy_Level, 'Hierarchy Weighting Type');

		IF( sHierarchy_Weighting_Type @<> '' );
			nCurrent_Hierarchy_Level = nHierarchy_Level_Count - nHierarchy_Level_Index + 1;

			# ASCIIOUTPUT( '..\temp\hier_weight.txt', 'SYS.Dimension.Hierarchy.Set_Element_Weighting', sTarget_Dimension_Name, sTarget_Hierarchy_Name, STR( nCurrent_Hierarchy_Level, 1, 0), sTarget_Dimension_Name, sTarget_Hierarchy_Name, sTotal_Element_Name, sHierarchy_Weighting_Type );

			ExecuteProcess( sHierarchy_Set_Weight_Process_Name
				,'pTargetDimensionName', sTarget_Dimension_Name
				,'pTargetHierarchyName', sTarget_Hierarchy_Name
				,'pTargetTotalElement', sTotal_Element_Name
				,'pTargetHierarchyLevel', nCurrent_Hierarchy_Level
				,'pWeightingType', sHierarchy_Weighting_Type );
		ENDIF;

		nHierarchy_Level_Index = nHierarchy_Level_Index + 1;
	END;
ENDIF;
574,9

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;


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
