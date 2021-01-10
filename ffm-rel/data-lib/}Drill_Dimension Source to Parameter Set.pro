601,100
602,"}Drill_Dimension Source to Parameter Set"
562,"NULL"
586,
585,
564,
565,"aaQ>rX?oUZia:S131ENg_v`Znd01bwhETdoEQDG^<N:1vczpOQufoN=H=;v;AyTz:fgC2s^==jI>WfzoK;]p60C;EmZ4Az\\78]8UXn@gPo]VVO`u@DiwyT4y?8eZXvk<NeIMn_6Hn>wisr]_M2N=Qxz8UoggyD[`doiTrc:Koy=9hmLuJ6]tfw3_eT91e\EJ5u7MA1f"
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
pDimensionList,"GBL Date"
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
572,88

#****Begin: Generated Statements***
#****End: Generated Statements****

## Define globals & model object references

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
StringGlobalVariable('OutputFilteredText');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';
sText_Filter_Process_Name = 'Sub.Text.Filter_Chars';

sSource_Cube_Name = 'BLD Dimension Source';
sTarget_Cube_Name = 'BLD Process Parameter Source';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';

sDimension_Control_Cube_Name = 'BLD Dimension Control';

sProcesses_Dimension_Name = '}Processes';
sProcess_Parameter_Set_Dimension_Name = 'BLD Process Parameter Set';
sProcess_Parameter_List_Dimension_Name = 'BLD Process Parameter List';

## Load and validate properties from [BLD Dimension Control]

sSource_Build_Version = pDimensionVersion;

## Setup view creation variables

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## [}Processes]
sTarget_Processes_Type = 'E';
sTarget_Processes_Element = CellGetS( sSource_Cube_Name, pDimensionList, pHierarchyList, pDimensionVersion, 'All Hierarchy Level', 'Build Process Name' );

## [BLD Process Parameter Set]
sTarget_Process_Parameter_Set_Type = 'E';
sTarget_Process_Parameter_Set_Element = CellGetS( sSource_Cube_Name, pDimensionList, pHierarchyList, pDimensionVersion, 'All Hierarchy Level', 'Build Process Parameter Set' );

## [BLD Process Parameter List]
sTarget_Process_Parameter_List_Type = 'S';
sTarget_Process_Parameter_List_Element = 'Default';

## [BLD Process Parameter Source Measure]
sTarget_Measure_Type = 'S';
sTarget_Measure_Element = 'Default';

## Create sSource_Subset_Type_List and sSource_Subset_Element_List comma-separated lists
## These instruct the view creation process on what subsets to include in the view
sTarget_Subset_Type_List = ''
	| sTarget_Processes_Type | ','
	| sTarget_Process_Parameter_Set_Type | ','
	| sTarget_Process_Parameter_List_Type | ','
	| sTarget_Measure_Type;

sTarget_Subset_Element_List = ''
	| sTarget_Processes_Element | ','
	| sTarget_Process_Parameter_Set_Element | ','
	| sTarget_Process_Parameter_List_Element | ','
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

ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sProcesses_Dimension_Name );
ViewTitleElementSet( sTarget_Cube_Name, sTarget_View_Name, sProcesses_Dimension_Name, DIMIX( sProcesses_Dimension_Name, sTarget_Processes_Element ));

ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sProcess_Parameter_Set_Dimension_Name );
ViewTitleElementSet( sTarget_Cube_Name, sTarget_View_Name, sProcess_Parameter_Set_Dimension_Name, DIMIX( sProcess_Parameter_Set_Dimension_Name, sTarget_Process_Parameter_Set_Element ));

ViewRowDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sProcess_Parameter_List_Dimension_Name, 1 );
ViewColumnDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sTarget_Measure_Name, 1 );
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,10

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
