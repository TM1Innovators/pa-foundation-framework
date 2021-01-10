601,100
602,"BLD.Model.Update.Subset"
562,"VIEW"
586,"BLD Subset Source"
585,"BLD Subset Source"
564,
565,"fG01uvaHK@]M?zeV4oU5znvf50k[hEjsWRyWib2WTBUg>hCs?:S9Mb8]Di8:n1Pn]RqP9OnlO^A@MzrIu]Ty3QumK5jr;EV@0D;4P823G0<^9VY?3S=yM>r;ghOz\[5\0EK_hd0fNicSBdp>a0G4tNGO?>yZ2ffLf6E9ZYhFZSyMpsH4uPazHxuFIxNq<_[Kkm7bIlt4"
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
vDimension_List
vHierarchy_List
vDimension_Version
vSubset_List
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
572,195

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
nSkip_Processing = 0;
nLog_Source = 0;

sLogToken = pLogToken;
IF( sLogToken @= '');
	nLog_Source = 1;
	ExecuteProcess(sLog_Open_Process_Name, 'pLogSource', GetProcessName());
	sLogToken = OutputLogToken;
ELSE;
	#ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ' process started for dimension [' | pDimensionList | '] and hierarchy [' | pHierarchyList | ']...');
ENDIF;


## Define globals & model object references

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sHierarchy_Update_Process_Name = 'BLD.Model.Update.Hierarchy';
sElement_Update_Process_Name = 'BLD.Model.Update.Element';
sSubset_Update_Process_Name = 'BLD.Model.Update.Subset';
sLoad_Variables_Process_Name = 'SUB.Config.Load_Variables';

sHierarchy_Flatten_Process_Name = 'SYS.Dimension.Hierarchy.Flatten';

sSource_Cube_Name = 'BLD Subset Source';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sDimension_Control_Cube_Name = 'BLD Dimension Control';
sDimension_Source_Cube_Name = 'BLD Dimension Source';
sAttribute_Source_Cube_Name = 'BLD Attribute Source';

sDimension_List_Dimension_Name = 'BLD Dimension List';
sDimension_Version_Dimension_Name = 'BLD Dimension Version';
sHierarchy_List_Dimension_Name = 'BLD Hierarchy List';
sHierarchy_Level_Dimension_Name = 'BLD Hierarchy Level';
sElement_List_Dimension_Name = 'BLD Element List';
sSubset_List_Dimension_Name = 'BLD Subset List';
sAttribute_List_Dimension_Name = 'BLD Attribute List';
sAttribute_List_Subset_Name = 'N-Level';


## Transform & validate parameters

IF(DIMIX(sDimension_List_Dimension_Name, pDimensionList) = 0);
	nError_Occurred = 1;
	sError_Message = 'The specified dimension element [' | pDimensionList | '] provided in the pDimensionList parameter does not exist in the BLD Dimension List dimension. Aborting process.';
	ProcessBreak;
ENDIF;

IF(DIMIX(sHierarchy_List_Dimension_Name, pHierarchyList) = 0);
	nError_Occurred = 1;
	sError_Message = 'The specified hierarchy element [' | pHierarchyList | '] provided in the pHierarchyList parameter does not exist in the BLD Hierarchy List dimension. Aborting process.';
	ProcessBreak;
ENDIF;


## Load global variables for use in Format Strings

StringGlobalVariable('sGlobal_Current_Environment');
StringGlobalVariable('sGlobal_Current_Day');
StringGlobalVariable('sGlobal_Current_Month');
StringGlobalVariable('sGlobal_Current_Year');
StringGlobalVariable('sGlobal_Current_Date');
StringGlobalVariable('sGlobal_Current_CAL_Year');
StringGlobalVariable('sGlobal_Current_CAL_Half');
StringGlobalVariable('sGlobal_Current_CAL_Quarter');
StringGlobalVariable('sGlobal_Current_CAL_Month');
StringGlobalVariable('sGlobal_Current_CAL_Month_Name_Short');
StringGlobalVariable('sGlobal_Current_CAL_Month_Name_Long');
StringGlobalVariable('sGlobal_Current_CAL_Day');
StringGlobalVariable('sGlobal_Current_CAL_Day_Of_Year');
StringGlobalVariable('sGlobal_Current_CAL_Day_Name_Short');
StringGlobalVariable('sGlobal_Current_CAL_Day_Name_Long');
StringGlobalVariable('sGlobal_Current_FIN_Year');
StringGlobalVariable('sGlobal_Current_FIN_Half');
StringGlobalVariable('sGlobal_Current_FIN_Quarter');
StringGlobalVariable('sGlobal_Current_FIN_Month');
StringGlobalVariable('sGlobal_Current_FIN_Day');
StringGlobalVariable('sGlobal_Current_FIN_Day_Of_Year');

ExecuteProcess( sLoad_Variables_Process_Name );

## Load and validate properties from [BLD Dimension Control]

sSource_Build_Profile_Element = pBuildProfile;
IF(sSource_Build_Profile_Element @= '');
	sSource_Build_Profile_Element = 'Default';
ENDIF;

sUpdate_Hierarchy = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Hierarchy');
# sUpdate_Elements = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Elements');
sUpdate_Subsets = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Subsets');

sHierarchy_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Hierarchy Version');
# sElement_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Element Version');
sSubset_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Subset Version');


## Load and validate properties from [BLD Dimension Source]

sAction = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', pDimensionList, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);

IF(sUpdate_Subsets @<> 'Yes');
	nSkip_Processing = 1;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping subsets for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']. The [Update Subsets] property is set to [' | sUpdate_Subsets | '].');
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Updating subsets for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']...');
ENDIF;

## Setup view creation variables

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## [BLD Dimension List]
## We just want to process the BLD Dimension List element passed in the pDimensionList parameter
sSource_Dimension_List_Type = 'E';
sSource_Dimension_List_Element = pDimensionList;

## [BLD Hierarchy List]
## We want to cycle through all the hierarchies with a defined Action parameter
sSource_Hierarchy_List_Type = 'E';
sSource_Hierarchy_List_Element = pHierarchyList;

## [BLD Dimension Version]
## We want to read items from the dimension version element specified in the BLD Dimension Control cube
sSource_Dimension_Version_Type = 'E';
sSource_Dimension_Version_Element = sSubset_Version;

## [BLD Subset List]
## We want to iterate all subset items
sSource_Subset_List_Type = 'A';
sSource_Subset_List_Element = '';

## [BLD Dimension Source Measure]
## We just want to read items for which the 'Action' isn't blank.
sSource_Measure_Type = 'E';
sSource_Measure_Element = 'Action';

## Create sSource_Subset_Type_List and sSource_Subset_Element_List comma-separated lists
## These instruct the view creation process on what subsets to include in the view
sSource_Subset_Type_List = ''
	| sSource_Dimension_List_Type | ','
	| sSource_Hierarchy_List_Type | ','
	| sSource_Dimension_Version_Type | ','
	| sSource_Subset_List_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Dimension_List_Element | ','
	| sSource_Hierarchy_List_Element | ','
	| sSource_Dimension_Version_Element | ','
	| sSource_Subset_List_Element | ','
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
573,7

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;
574,74

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Update' % vValue @= 'Recreate' );

	sSubset_Generation_Type = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Subset Generation Type');
	sSubset_Name = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Subset Name');
	sDisplay_Alias = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Display Alias');
	sExpand_Type = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Expand Type');
	sSubset_Type = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Subset Type');
	sElement_Type = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Element Type');
	sElement_Name = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Element Name');
	sElement_Name_Format_String = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Element Name Format String');
	sText_Value = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Text Value');
	sText_Value_Format_String = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Text Value Format String');
	sSort_Type = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Sort Type');
	sSort_Direction = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Sort Direction');
	sSort_Direction = IF(sSort_Direction @= '', 'ASC', sSort_Direction);

	sMDX_Query = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'MDX Query');

	#IF( vValue @= 'Recreate' & SubsetExists( sDimension_Name, sSubset_Name ) <> 0 );
	#	SubsetDestroy( sDimension_Name, sSubset_Name );
	#ENDIF;

	IF(sSubset_Generation_Type @= 'Subset Iterator');
		sIterator_Dimension_1 = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Iterator Dimension 1');
		sIterator_Subset_1 = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Iterator Subset 1');
		sIterator_Dimension_2 = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Iterator Dimension 2');
		sIterator_Subset_2 = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Iterator Subset 2');
		sIterator_Dimension_3 = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Iterator Dimension 3');
		sIterator_Subset_3 = CellGetS( sSource_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, vSubset_List, 'Iterator Subset 3');

		ExecuteProcess( 'SYS.Dimension.Subset.Create_From_Dimensions'
			,'pTargetDimension', sDimension_Name
			,'pTargetHierarchy', sHierarchy_Name
			,'pIteratorDimension1', sIterator_Dimension_1
			,'pIteratorSubsetName1', sIterator_Subset_1
			,'pIteratorDimension2', sIterator_Dimension_2
			,'pIteratorSubsetName2', sIterator_Subset_2
			,'pIteratorDimension3', sIterator_Dimension_3
			,'pIteratorSubsetName3', sIterator_Subset_3
			,'pSubsetNameTemplate', sSubset_Name
			,'pElementNameTemplate', sElement_Name_Format_String
			,'pTextValueTemplate', sText_Value_Format_String
			,'pMDXQueryTemplate', sMDX_Query
			,'pDisplayAlias', sDisplay_Alias
			,'pExpandType', sExpand_Type
			,'pSubsetType', sSubset_Type
			,'pSortType', sSort_Type
			,'pSortDirection', sSort_Direction );

	ELSE;
		## If format strings are defined, resolve them with EXPAND
		sElement_Name = IF( sElement_Name_Format_String @<> '', EXPAND(sElement_Name_Format_String), sElement_Name );
		sText_Value = IF( sText_Value_Format_String @<> '', EXPAND( sText_Value_Format_String), sText_Value );

		ExecuteProcess( 'SYS.Dimension.Subset.Create_By_MDX'
			,'pTargetDimension', sDimension_Name
			,'pTargetHierarchy', sHierarchy_Name
			,'pSubsetName', sSubset_Name
			,'pMDXQuery', EXPAND(sMDX_Query)
			,'pDisplayAlias', sDisplay_Alias
			,'pExpandType', sExpand_Type
			,'pSubsetType', sSubset_Type
			,'pSortType', sSort_Type
			,'pSortDirection', sSort_Direction );
	ENDIF;
ENDIF;
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
