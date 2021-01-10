601,100
602,"BLD.Model.Update.Element"
562,"VIEW"
586,"BLD Element Source"
585,"BLD Element Source"
564,
565,"c`Oapx^;prUa^1fw`^?N3sYMwW]5HCB]OPV;[h\llb5NWh8znM>bWwbTWW84wAJu<Q6n61N:axifS2?TFHn2<hmNTvhMb34V`hrlj4uo<o1V4qz5szki;uSlXVxHrNg:FDroQRQV7cIIojC8;s^58@Wu:G^^C\>Z]L<asFW?kUw[qL?bT=7TtjnRht\@mLU=EIvk\paa"
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
572,241

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


## Load and validate properties from [BLD Dimension Control]

sSource_Build_Profile_Element = pBuildProfile;
IF(sSource_Build_Profile_Element @= '');
	sSource_Build_Profile_Element = 'Default';
ENDIF;

sUpdate_Hierarchy = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Hierarchy');
sUpdate_Elements = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Update Elements');

sHierarchy_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Hierarchy Version');
sElement_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Element Version');


## Load and validate properties from [BLD Dimension Source]

sAction = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', pDimensionList, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);

sDimension_Type = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Type');
sDescription_Attribute = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Description Attribute');
sDisplay_Name_Attribute = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Display Name Attribute');

sConsolidation_Sort_Type = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Consolidation Sort Type');
sConsolidation_Sort_Type = IF( sConsolidation_Sort_Type @= '', 'ByInput', sConsolidation_Sort_Type );
sConsolidation_Sort_Direction = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Consolidation Sort Direction');
sConsolidation_Sort_Direction = IF( sConsolidation_Sort_Direction @= '', 'Ascending', sConsolidation_Sort_Direction );
sElement_Sort_Type = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Element Sort Type');
sElement_Sort_Type = IF( sElement_Sort_Type @= '', 'ByInput', sElement_Sort_Type );
sElement_Sort_Direction = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Element Sort Direction');
sElement_Sort_Direction = IF( sElement_Sort_Direction @= '', 'Ascending', sElement_Sort_Direction );

IF(sUpdate_Elements @<> 'Yes');
	nSkip_Processing = 1;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping elements for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']. The [Update Elements] property is set to [' | sUpdate_Elements | '].');
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Updating elements for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']...');
ENDIF;


## Validate and create required model objects

IF( DimensionExists(sDimension_Name ) = 0);
	DimensionCreate(sDimension_Name);
ENDIF;

IF( HierarchyExists( sDimension_Name, sHierarchy_Name ) = 0 );
	HierarchyCreate( sDimension_Name, sHierarchy_Name );
ENDIF;

HierarchySortOrder( sDimension_Name, sHierarchy_Name, sConsolidation_Sort_Type, sConsolidation_Sort_Direction, sElement_Sort_Type , sElement_Sort_Direction);

IF( sDescription_Attribute @<> '' );
	ElementAttrInsert( sDimension_Name, sHierarchy_Name, '', sDescription_Attribute, 'S');
ENDIF;

IF( sDisplay_Name_Attribute @<> '' );
	ElementAttrInsert( sDimension_Name, sHierarchy_Name, '', sDisplay_Name_Attribute, 'A');
ENDIF;

ElementAttrInsert( sDimension_Name, sHierarchy_Name, '', 'Format', 'S');


## Prepare the dimension for loading

IF( sUpdate_Elements @= 'Yes' );
	IF( sAction @= 'Recreate' );
		IF( sHierarchy_Name @= '' % sHierarchy_Name @= sDimension_Name );
			DimensionDeleteAllElements( sDimension_Name );
		ELSE;
			HierarchyDeleteAllElements( sDimension_Name, sHierarchy_Name );
		ENDIF;
	ENDIF;

	IF( sAction @= 'Rebuild' );
		ExecuteProcess( sHierarchy_Flatten_Process_Name, 'pDimensionName', sDimension_Name, 'pHierarchyName', sHierarchy_Name );
	ENDIF;
ENDIF;

## Loop through all defined attributes in the attribute source cube and create them

nAttribute_List_Count = SubsetGetSize(sAttribute_List_Dimension_Name, sAttribute_List_Subset_Name);
nAttribute_List_Index = 1;

WHILE(nAttribute_List_Index <= nAttribute_List_Count);

	sAttribute_List = DimNM(sAttribute_List_Dimension_Name, nAttribute_List_Index);

	sAttribute_Name = CellGetS( sAttribute_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, sAttribute_List, 'Attribute Name' );
	sAttribute_Type = CellGetS( sAttribute_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, sAttribute_List, 'Attribute Type' );
		
	IF(sAttribute_Name @<> '' & sAttribute_Type @<> '');
		sAttribute_Type_Code = IF( sAttribute_Type @= 'Alias', 'A', IF( sAttribute_Type @= 'Numeric', 'N', 'S' ));
		ElementAttrInsert(sDimension_Name, sHierarchy_Name, '', sAttribute_Name, sAttribute_Type_Code);
	ENDIF;

	nAttribute_List_Index = nAttribute_List_Index + 1;
END;


## Setup view creation variables

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## [BLD Dimension List]
## We just want to process rhw BLD Dimension List element passed in the pDimensionList parameter
sSource_Dimension_List_Type = 'E';
sSource_Dimension_List_Element = pDimensionList;

## [BLD Hierarchy List]
## We want to cycle through all the hierarchies with a defined Action parameter
sSource_Hierarchy_List_Type = 'A';
sSource_Hierarchy_List_Element = '';

## [BLD Dimension Version]
## We want to read items from the dimension version element specified in the BLD Dimension Control cube
sSource_Dimension_Version_Type = 'E';
sSource_Dimension_Version_Element = sElement_Version;

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
573,55

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Ignore');
	ItemSkip;
ENDIF;

sCurrent_Element_Name = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Element Name');
sCurrent_Parent_Name = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Parent Name');
sCurrent_Element_Type = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Element Type');
sCurrent_Element_Weight = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Element Weight');
nCurrent_Element_Weight = NUMBR(sCurrent_Element_Weight);

sCurrent_Element_Type_Code = 'n';
IF(sCurrent_Element_Type @= 'Consolidated');
	sCurrent_Element_Type_Code = 'c';
ELSEIF(sCurrent_Element_Type @= 'String');
	sCurrent_Element_Type_Code = 's';
ENDIF;

IF(vValue @= 'Update');
	IF(sCurrent_Element_Name @<> '');

		IF( ElementIndex( sDimension_Name, sHierarchy_Name, sCurrent_Element_Name ) <> 0 );
			IF( LOWER( ElementType( sDimension_Name, sHierarchy_Name, sCurrent_Element_Name )) @<> sCurrent_Element_Type_Code );
				HierarchyElementDelete( sDimension_Name, sHierarchy_Name, sCurrent_Element_Name );
			ENDIF;
		ENDIF;

		HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sCurrent_Element_Name, sCurrent_Element_Type_Code);

		IF(sCurrent_Parent_Name @<> '');
			HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sCurrent_Parent_Name, 'c');
			IF( ElementIsComponent( sDimension_Name, sHierarchy_Name, sCurrent_Element_Name, sCurrent_Parent_Name ) = 1 & ElementWeight( sDimension_Name, sHierarchy_Name, sCurrent_Parent_Name, sCurrent_Element_Name ) <> nCurrent_Element_Weight );
				HierarchyElementComponentDelete( sDimension_Name, sHierarchy_Name, sCurrent_Parent_Name, sCurrent_Element_Name);
			ENDIF;
			HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sCurrent_Parent_Name, sCurrent_Element_Name, NUMBR(sCurrent_Element_Weight));
		ENDIF;
	ENDIF;
ENDIF;

## If vValue @= 'Delete' remove the element if it exists

IF(vValue @= 'Delete');
	IF(sCurrent_Element_Name @<> '');
		IF( ElementIndex( sDimension_Name, sHierarchy_Name, sCurrent_Element_Name ) <> 0 );
			HierarchyElementDelete( sDimension_Name, sHierarchy_Name, sCurrent_Element_Name );
		ENDIF;
	ENDIF;
ENDIF;
574,58

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @<> 'Update');
	ItemSkip;
ENDIF;

sCurrent_Element_Name = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Element Name');
sCurrent_Description = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Description');
sCurrent_Display_Name = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Display Name');
sCurrent_Format = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, 'Format String');

IF(vValue @= 'Update');
	IF( sCurrent_Element_Name @<> '' );

		# ASCIIOUTPUT('..\temp\element2.txt', sDimension_Name, sHierarchy_Name, '', sCurrent_Element_Name, sCurrent_Element_Type_Code);
		ElementAttrPutS(sCurrent_Format, sDimension_Name, sHierarchy_Name, sCurrent_Element_Name, 'Format');

		IF(sDescription_Attribute @<> '');
			ElementAttrPutS(sCurrent_Description, sDimension_Name, sHierarchy_Name, sCurrent_Element_Name, sDescription_Attribute);
		ENDIF;

		IF(sDisplay_Name_Attribute @<> '');
			ElementAttrPutS(sCurrent_Display_Name, sDimension_Name, sHierarchy_Name, sCurrent_Element_Name, sDisplay_Name_Attribute);
		ENDIF;

		## Loop through all defined attributes in the attribute source cube and create them

		nAttribute_List_Count = SubsetGetSize(sAttribute_List_Dimension_Name, sAttribute_List_Subset_Name);
		nAttribute_List_Index = 1;

		WHILE(nAttribute_List_Index <= nAttribute_List_Count);

			sAttribute_List = SubsetGetElementName(sAttribute_List_Dimension_Name, sAttribute_List_Subset_Name, nAttribute_List_Index);

			sAttribute_Name = CellGetS( sAttribute_Source_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, sAttribute_List, 'Attribute Name' );
			sAttribute_Type = CellGetS( sAttribute_Source_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, sAttribute_List, 'Attribute Type' );
		
			IF(sAttribute_Name @<> '' & sAttribute_Type @<> '');
				sCurrent_Attribute_Measure = AttrS( sAttribute_List_Dimension_Name, sAttribute_List, 'Dimension_Source_Measure_Mapping');
				sCurrent_Attribute_Value = CellGetS(sSource_Cube_Name, pDimensionList, pHierarchyList, vDimension_Version, vElement_List, sCurrent_Attribute_Measure);

				IF(sAttribute_Type @= 'Numeric');
					ElementAttrPutN(NUMBR(sCurrent_Attribute_Value), sDimension_Name, sHierarchy_Name, sCurrent_Element_Name, sAttribute_Name);
				ELSE;
					ElementAttrPutS(sCurrent_Attribute_Value, sDimension_Name, sHierarchy_Name, sCurrent_Element_Name, sAttribute_Name);
				ENDIF;
			ENDIF;

			nAttribute_List_Index = nAttribute_List_Index + 1;
		END;
	ENDIF;
ENDIF;
575,24

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
