﻿601,100
602,"}Drill_Dimension Source to Element Source"
562,"NULL"
586,
585,
564,
565,"b:aLx2qkMQzGGQQRKze^KMXq;L6NTKQvr@QleVgsLhPRycnwxYJt:gQzXxVVcHGbP5aKtyc0U`tZNul\4]Sn26JV@QgTogQltmB20gJNiIPkeTuTu[W:0uqOG?v_\RYfqfHnEtU>9:F6_T1zko9@T>L>[<;TK3X8Yh3[Bs1TKcRo`E;2waw_Z1bh`bAwUhTj9XG5uSX5"
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
570,
571,
569,0
592,0
599,1000
560,6
cubename
pDimensionList
pHierarchyList
pDimensionVersion
pHierarchyLevel
pMeasure
561,6
2
2
2
2
2
2
590,6
cubename,"BLD Dimension Source"
pDimensionList,"SYS Format Preset"
pHierarchyList,"Primary"
pDimensionVersion,"v1.0"
pHierarchyLevel,"All Hierarchy Level"
pMeasure,"Action"
637,6
cubename,""
pDimensionList,""
pHierarchyList,""
pDimensionVersion,""
pHierarchyLevel,""
pMeasure,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,101

#****Begin: Generated Statements***
#****End: Generated Statements****


## Define globals & model object references

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
StringGlobalVariable('OutputFilteredText');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';
sText_Filter_Process_Name = 'Sub.Text.Filter_Chars';

sTarget_Cube_Name = 'BLD Element Source';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';

sDimension_Control_Cube_Name = 'BLD Dimension Control';

sDimension_List_Dimension_Name = 'BLD Dimension List';
sHierarchy_List_Dimension_Name = 'BLD Hierarchy List';
sDimension_Version_Dimension_Name = 'BLD Dimension Version';
sElement_List_Dimension_Name = 'BLD Element List';

sSource_Build_Version = pDimensionVersion;

## Setup view creation variables

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## [BLD Dimension List]
## We just want to include the BLD Dimension List element passed in the pDimensionList parameter
sTarget_Dimension_List_Type = 'E';
sTarget_Dimension_List_Element = pDimensionList;

## [BLD Hierarchy List]
## We want to include all the hierarchies with a defined Action parameter
sTarget_Hierarchy_List_Type = 'S';
sTarget_Hierarchy_List_Element = 'Default';

## [BLD Dimension Version]
## We want to read items from the dimension version element specified in the BLD Dimension Control cube
sTarget_Dimension_Version_Type = 'S';
sTarget_Dimension_Version_Element = 'Default';

## [BLD Hierarchy Level]
## We just want to read items from the 'All Hierachy Level' line
sTarget_Element_List_Type = 'S';
sTarget_Element_List_Element = 'All Elements and Header';

## [BLD Dimension Source Measure]
## We just want to read items for which the 'Action' isn't blank.
sTarget_Measure_Type = 'S';
sTarget_Measure_Element = 'Default';

## Create sSource_Subset_Type_List and sSource_Subset_Element_List comma-separated lists
## These instruct the view creation process on what subsets to include in the view
sTarget_Subset_Type_List = ''
	| sTarget_Dimension_List_Type | ','
	| sTarget_Hierarchy_List_Type | ','
	| sTarget_Dimension_Version_Type | ','
	| sTarget_Element_List_Type | ','
	| sTarget_Measure_Type;

sTarget_Subset_Element_List = ''
	| sTarget_Dimension_List_Element | ','
	| sTarget_Hierarchy_List_Element | ','
	| sTarget_Dimension_Version_Element | ','
	| sTarget_Element_List_Element | ','
	| sTarget_Measure_Element;


## Create source view and set data source

sTarget_View_Name = GetProcessName() | ' - ' | TM1User();
ExecuteProcess( sText_Filter_Process_Name, 'pInputText', sTarget_View_Name );
sTarget_View_Name = OutputFilteredText;
sTarget_Subset_Name = sTarget_View_Name;

ExecuteProcess( sCube_Create_Temp_Process_Name
	,'pCubeName', sTarget_Cube_Name
	,'pSubsetTypeList', sTarget_Subset_Type_List
	,'pSubsetElementList', sTarget_Subset_Element_List
	,'pViewName', sTarget_View_Name
	,'pSubsetName', sTarget_Subset_Name
	,'pSkipZero', 1, 'pSkipConsolidated', 0, 'pSkipCalculated', 0
	,'pOverwriteView', 1);

# sTarget_View_Name = OutputViewName;
# sTarget_Subset_Name = OutputSubsetName;

ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sDimension_Version_Dimension_Name );
ViewTitleElementSet( sTarget_Cube_Name, sTarget_View_Name, sDimension_Version_Dimension_Name, DIMIX( sDimension_Version_Dimension_Name, sSource_Build_Version ));

ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sDimension_List_Dimension_Name);
ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sHierarchy_List_Dimension_Name);

ViewRowDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sElement_List_Dimension_Name, 1 );
ViewColumnDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sTarget_Measure_Name, 1 );
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,11

#****Begin: Generated Statements***
#****End: Generated Statements****


## RETURNVIEWHANDLE( sTarget_Cube_Name, sTarget_View_Name );




RETURNVIEWHANDLE( sTarget_Cube_Name, sTarget_View_Name );
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