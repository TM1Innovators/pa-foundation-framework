601,100
602,"BLD.Model.Update.Hierarchy.cub"
562,"VIEW"
586,"BLD Element Source"
585,"BLD Element Source"
564,
565,"qB_dlKo3o=AXOEN5Ea5SmUUd>ga<1U0jI9PC7RRkEWjr_0ukq4GMt\EacdjflSjU:LOsx6nmoo3WKS8gUfEti1Lpm67Zz5FmEzM^es4[fq16iTAedynrU<VrhTP5H<QLCDxqS43zOzDIHM`u=4H:9:[M>1cmTwxB13_za]MHcULj4plVFCg[<zZ9InldnPa`GR]]aPYj"
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
vElement_List
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
572,197

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
	#ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', 'Processing element data defined by dimension list [' | pDimensionList | '] and hierarchy list [' | pHierarchyList | ']...');
ENDIF;


## Define globals & model object references

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sHierarchy_Update_Process_Name = 'BLD.Model.Update.Hierarchy';
sElement_Update_Process_Name = 'BLD.Model.Update.Element';
sSubset_Update_Process_Name = 'BLD.Model.Update.Subset';

sHierarchy_Flatten_Process_Name = 'SYS.Dimension.Hierarchy.Flatten';

sSource_Cube_Name = 'BLD Element Source';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sDimension_Control_Cube_Name = 'BLD Dimension Control';
sDimension_Source_Cube_Name = 'BLD Dimension Source';
sElement_Source_Cube_Name = 'BLD Element Source';
sAttribute_Source_Cube_Name = 'BLD Attribute Source';

sDimension_List_Dimension_Name = 'BLD Dimension List';
sDimension_Version_Dimension_Name = 'BLD Dimension Version';
sHierarchy_List_Dimension_Name = 'BLD Hierarchy List';
sHierarchy_Level_Dimension_Name = 'BLD Hierarchy Level';
sElement_List_Dimension_Name = 'BLD Element List';
sSubset_List_Dimension_Name = 'BLD Subset List';
sAttribute_List_Dimension_Name = 'BLD Attribute List';
sAttribute_List_Subset_Name = 'N-Level';
sHierarchy_Basis_Subset_Name = 'Leaf Elements Code';
sHierarchy_Level_Basis_Subset_Name = 'Hierarchy Levels';
sAttribute_Basis_Subset_Name = 'All Attribute List Static';


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


## Load and validate properties from [BLD Dimension Control]

sSource_Build_Profile_Element = pBuildProfile;
IF(sSource_Build_Profile_Element @= '');
	sSource_Build_Profile_Element = 'Default';
ENDIF;

sUpdate_Hierarchy = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Hierarchy');
#sUpdate_Elements = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Elements');
#sUpdate_Subsets = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Subsets');

sHierarchy_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Hierarchy Version');
#sElement_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Element Version');
#sSubset_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Subset Version');

sTotal_Element = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Total Element Name');
sTotal_Display_Name = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Total Element Display Name');

nAttribute_Count = SubsetGetSize(sAttribute_List_Dimension_Name, sAttribute_Basis_Subset_Name);
nHierarchy_Level_Count = CellGetN(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'Total Hierarchy Level', 'Hierarchy Count');

## Load and validate properties from [BLD Dimension Source]

sAction = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', pDimensionList, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);
sHierarchy_Element_Source = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Element Source' );
sHierarchy_Element_Source = IF( sHierarchy_Element_Source @= '', 'Primary', sHierarchy_Element_Source);

sDimension_Type = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Type');
sDescription_Attribute = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Description Attribute');
#sDescription_Attribute = IF( sDescription_Attribute @= '', 'Description', sDescription_Attribute );
sDisplay_Name_Attribute = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Display Name Attribute');
sDisplay_Name_Attribute = IF( sDisplay_Name_Attribute @= '', 'Display Name', sDisplay_Name_Attribute );

sTotal_Element = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Total Element Name');
sTotal_Display_Name = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Total Element Display Name');
sHierarchySkipChildren = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Skip Children');

IF(sUpdate_Hierarchy @<> 'Yes');
	nSkip_Processing = 1;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping hierarchy for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']. The [Update Hierarchy] property is set to [' | sUpdate_Hierarchy | '].');
ELSEIF(sTotal_Element @= '');
	nSkip_Processing = 1;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': No hierarchy defined for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']...');
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Updating hierarchies for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']...');
ENDIF;

IF( nSkip_Processing <> 1 );
	HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sTotal_Element, 'c');
ENDIF;


## Setup view creation variables

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## [BLD Dimension List]
## We just want to process rhw BLD Dimension List element passed in the pDimensionList parameter
sSource_Dimension_List_Type = 'E';
sSource_Dimension_List_Element = pDimensionList;

## [BLD Hierarchy List]
## We want to cycle through the hierarchy selected in the Hierarchy Element Source property
sSource_Hierarchy_List_Type = 'E';
sSource_Hierarchy_List_Element = sHierarchy_Element_Source;

## [BLD Dimension Version]
## We want to read items from the dimension version element specified in the BLD Dimension Control cube
sSource_Dimension_Version_Type = 'E';
sSource_Dimension_Version_Element = sHierarchy_Version;

## [BLD Hierarchy Level]
## We just want to read items from the 'All Hierachy Level' line
sSource_Element_List_Type = 'S';
sSource_Element_List_Element = 'All Elements';

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
	| sSource_Element_List_Type | ','
	| sSource_Measure_Type;

sSource_Subset_Element_List = ''
	| sSource_Dimension_List_Element | ','
	| sSource_Hierarchy_List_Element | ','
	| sSource_Dimension_Version_Element | ','
	| sSource_Element_List_Element | ','
	| sSource_Measure_Element;


## Create source view and set data source

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
573,122

#****Begin: Generated Statements***
#****End: Generated Statements****


IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Ignore');
	ItemSkip;
ENDIF;

IF( vValue @<> 'Ignore' & vValue @<> 'Delete' );

	# Looping through all elements in the defined hierarchy subset

	# TODO: perhaps should run the subset creation process for the defined subset first?
	# TODO: Should we define the subsets via MDX instead?

	sElement_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Element Name');
	sElement_Display_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Display Name');

	# Loop through all attributes and load to attribute variables sAttribute_001, sAttribute_002, etc

	nAttribute_Index = 1;

	WHILE( nAttribute_Index <= nAttribute_Count );
		sAttribute_List_Name = SubsetGetElementName(sAttribute_List_Dimension_Name, sAttribute_Basis_Subset_Name, nAttribute_Index);
		sAttribute_Type = CellGetS(sAttribute_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, sAttribute_List_Name, 'Attribute Type');
		sAttribute_Name = CellGetS(sAttribute_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, sAttribute_List_Name, 'Attribute Name');

		sAttribute_Value = '';
		IF(sAttribute_Name @<> '');
			IF( sAttribute_Type @= 'Numeric' );
				nAttribute_Value = AttrN(sDimension_Name, sElement_Name, sAttribute_Name);
				sAttribute_Value = TRIM(STR(nAttribute_Value, 15, 15));
			ELSE;
				sAttribute_Value = AttrS(sDimension_Name, sElement_Name, sAttribute_Name);
			ENDIF;
		ENDIF;

		IF( sAttribute_List_Name @= 'Attribute 001'); sAttribute_001 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 002'); sAttribute_002 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 003'); sAttribute_003 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 004'); sAttribute_004 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 005'); sAttribute_005 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 006'); sAttribute_006 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 007'); sAttribute_007 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 008'); sAttribute_008 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 009'); sAttribute_009 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 010'); sAttribute_010 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 011'); sAttribute_011 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 012'); sAttribute_012 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 013'); sAttribute_013 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 014'); sAttribute_014 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 015'); sAttribute_015 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 016'); sAttribute_016 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 017'); sAttribute_017 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 018'); sAttribute_018 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 019'); sAttribute_019 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 020'); sAttribute_020 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 021'); sAttribute_021 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 022'); sAttribute_022 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 023'); sAttribute_023 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 024'); sAttribute_024 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 025'); sAttribute_025 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 026'); sAttribute_026 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 027'); sAttribute_027 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 028'); sAttribute_028 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 029'); sAttribute_029 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 030'); sAttribute_030 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 031'); sAttribute_031 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 032'); sAttribute_032 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 033'); sAttribute_033 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 034'); sAttribute_034 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 035'); sAttribute_035 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 036'); sAttribute_036 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 037'); sAttribute_037 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 038'); sAttribute_038 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 039'); sAttribute_039 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 040'); sAttribute_040 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 041'); sAttribute_041 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 042'); sAttribute_042 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 043'); sAttribute_043 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 044'); sAttribute_044 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 045'); sAttribute_045 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 046'); sAttribute_046 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 047'); sAttribute_047 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 048'); sAttribute_048 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 049'); sAttribute_049 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 050'); sAttribute_050 = sAttribute_Value; ENDIF;

		nAttribute_Index = nAttribute_Index + 1;
	END;

	# Loop through all hierarchy levels and attach parents using format strings

	sPrevious_Parent_Element = sTotal_Element;
	nHierarchy_Level_Index = 1;

	WHILE( nHierarchy_Level_Index <= nHierarchy_Level_Count );
		sHierarchy_Level = SubsetGetElementName(sHierarchy_Level_Dimension_Name, sHierarchy_Level_Basis_Subset_Name, nHierarchy_Level_Index);

		sHierarchy_Element_Format_String = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, sHierarchy_Level, 'Hierarchy Element Format String');
		sHierarchy_Display_Name_Format_String = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, sHierarchy_Level, 'Hierarchy Display Name Format String');
		sParent_Element = EXPAND(sHierarchy_Element_Format_String);
		sParent_Display_Name = EXPAND(sHierarchy_Display_Name_Format_String);

		HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sPrevious_Parent_Element, 'c');
		HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sParent_Element, 'c');
		HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sPrevious_Parent_Element, sParent_Element, 1);

		sPrevious_Parent_Element = sParent_Element;
		nHierarchy_Level_Index = nHierarchy_Level_Index + 1;
	END;

	IF( sHierarchySkipChildren @<> 'Yes' );
		HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sElement_Name, 'n');
		HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sPrevious_Parent_Element, sElement_Name, 1);
	ENDIF;
ENDIF;
574,119

#****Begin: Generated Statements***
#****End: Generated Statements****


IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Ignore');
	ItemSkip;
ENDIF;

IF( vValue @<> 'Ignore' & vValue @<> 'Delete' );

	# Looping through all elements in the defined hierarchy subset

	# TODO: perhaps should run the subset creation process for the defined subset first?
	# TODO: Should we define the subsets via MDX instead?

	sElement_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Element Name');
	sElement_Display_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Display Name');

	# Loop through all attributes and load to attribute variables sAttribute_001, sAttribute_002, etc

	nAttribute_Index = 1;

	WHILE( nAttribute_Index <= nAttribute_Count );
		sAttribute_List_Name = SubsetGetElementName(sAttribute_List_Dimension_Name, sAttribute_Basis_Subset_Name, nAttribute_Index);
		sAttribute_Type = CellGetS(sAttribute_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, sAttribute_List_Name, 'Attribute Type');
		sAttribute_Name = CellGetS(sAttribute_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, sAttribute_List_Name, 'Attribute Name');

		sAttribute_Value = '';
		IF(sAttribute_Name @<> '');
			IF( sAttribute_Type @= 'Numeric' );
				nAttribute_Value = AttrN(sDimension_Name, sElement_Name, sAttribute_Name);
				sAttribute_Value = TRIM(STR(nAttribute_Value, 15, 15));
			ELSE;
				sAttribute_Value = AttrS(sDimension_Name, sElement_Name, sAttribute_Name);
			ENDIF;
		ENDIF;

		# ASCIIOUTPUT('..\temp\hierarchy_el.txt', sElement_Name | ' -> ' | sAttribute_Name | ' = ' | sAttribute_Value);

		IF( sAttribute_List_Name @= 'Attribute 001'); sAttribute_001 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 002'); sAttribute_002 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 003'); sAttribute_003 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 004'); sAttribute_004 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 005'); sAttribute_005 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 006'); sAttribute_006 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 007'); sAttribute_007 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 008'); sAttribute_008 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 009'); sAttribute_009 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 010'); sAttribute_010 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 011'); sAttribute_011 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 012'); sAttribute_012 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 013'); sAttribute_013 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 014'); sAttribute_014 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 015'); sAttribute_015 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 016'); sAttribute_016 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 017'); sAttribute_017 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 018'); sAttribute_018 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 019'); sAttribute_019 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 020'); sAttribute_020 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 021'); sAttribute_021 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 022'); sAttribute_022 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 023'); sAttribute_023 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 024'); sAttribute_024 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 025'); sAttribute_025 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 026'); sAttribute_026 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 027'); sAttribute_027 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 028'); sAttribute_028 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 029'); sAttribute_029 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 030'); sAttribute_030 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 031'); sAttribute_031 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 032'); sAttribute_032 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 033'); sAttribute_033 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 034'); sAttribute_034 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 035'); sAttribute_035 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 036'); sAttribute_036 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 037'); sAttribute_037 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 038'); sAttribute_038 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 039'); sAttribute_039 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 040'); sAttribute_040 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 041'); sAttribute_041 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 042'); sAttribute_042 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 043'); sAttribute_043 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 044'); sAttribute_044 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 045'); sAttribute_045 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 046'); sAttribute_046 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 047'); sAttribute_047 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 048'); sAttribute_048 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 049'); sAttribute_049 = sAttribute_Value; ENDIF;
		IF( sAttribute_List_Name @= 'Attribute 050'); sAttribute_050 = sAttribute_Value; ENDIF;

		nAttribute_Index = nAttribute_Index + 1;
	END;

	# Loop through all hierarchy levels and populate Display Name attribute using format strings

	sPrevious_Parent_Element = sTotal_Element;
	nHierarchy_Level_Index = 1;

	WHILE( nHierarchy_Level_Index <= nHierarchy_Level_Count );
		sHierarchy_Level = SubsetGetElementName(sHierarchy_Level_Dimension_Name, sHierarchy_Level_Basis_Subset_Name, nHierarchy_Level_Index);
		sHierarchy_Element_Format_String = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, sHierarchy_Level, 'Hierarchy Element Format String');
		sHierarchy_Display_Name_Format_String = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, sHierarchy_Level, 'Hierarchy Display Name Format String');
		sParent_Element = EXPAND(sHierarchy_Element_Format_String);
		sParent_Display_Name = EXPAND(sHierarchy_Display_Name_Format_String);

		IF( sParent_Display_Name @<> '' & sDisplay_Name_Attribute @<> '' );
			ElementAttrPutS( sParent_Display_Name, sDimension_Name, sHierarchy_Name, sParent_Element, sDisplay_Name_Attribute );
		ENDIF;

		sPrevious_Parent_Element = sParent_Element;
		nHierarchy_Level_Index = nHierarchy_Level_Index + 1;
	END;

ENDIF;
575,27

#****Begin: Generated Statements***
#****End: Generated Statements****

IF( sTotal_Element @<> '' & nSkip_Processing <> 1 );
	ElementAttrPutS( sTotal_Display_Name, sDimension_Name, sHierarchy_Name, sTotal_Element, sDisplay_Name_Attribute );
ENDIF;

ExecuteProcess( sCube_Cleanup_Temp_Process_Name
	,'pCubeName', sSource_Cube_Name
	,'pViewName', sView_Name
	,'pSubsetName', sSubset_Name);


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
