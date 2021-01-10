601,100
602,"}Drill_Cube Control to Cube Source"
562,"NULL"
586,"BLD Cube Source"
585,"BLD Cube Source"
564,
565,"c9:a`ATZp8WTa@]vi;VQoOnw2[YoLuorm>h\[Nl<cOo8OP08T<1P\Q1PSWYTwxF_iU9@2i\Zw97XcgnT6dIskYteCM6hNVcj8ORi\cQ<xgScgRqE36A0wzRY`Ak]W0OuqbovX>etPtVhGbqlg;tNuiqWrueF8y1bf8=u?6@jA]@0vO^aTdP1h:2nn]>td]x94qNk5:i:"
559,1
928,1
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
cubename
pBuildProfile
pCubeList
pMeasure
561,4
2
2
2
2
590,4
cubename,"BLD Cube Control"
pBuildProfile,"Default"
pCubeList,"REV Sales Import"
pMeasure,"Action"
637,4
cubename,""
pBuildProfile,""
pCubeList,""
pMeasure,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,96

#****Begin: Generated Statements***
#****End: Generated Statements****



## Define globals & model object references

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');
StringGlobalVariable('OutputFilteredText');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sTarget_Cube_Name = 'BLD Cube Source';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';
sText_Filter_Process_Name = 'Sub.Text.Filter_Chars';

sCube_Control_Cube_Name = 'BLD Cube Control';

sCube_List_Dimension_Name = 'BLD Cube List';
sCube_Version_Dimension_Name = 'BLD Cube Version';
sCube_Dimension_List_Dimension_Name = 'BLD Cube Dimension List';

## Load and validate properties from [BLD Dimension Control]

sSource_Build_Profile_Element = pBuildProfile;
sSource_Build_Version = CellGetS( sCube_Control_Cube_Name, sSource_Build_Profile_Element, pCubeList, 'Build Version' );

## Setup view creation variables

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## [BLD Cube List]
## We just want to include the BLD Cube List element passed in the pCubeList parameter
sTarget_Cube_List_Type = 'E';
sTarget_Cube_List_Element = pCubeList;

## [BLD Cube Version]
## We want to show the default subset with the cube version element specified in the BLD Cube Control cube selected
sTarget_Cube_Version_Type = 'S';
sTarget_Cube_Version_Element = 'Default';

## [BLD Cube Dimension List]
## We just want to read items from the 'Default' subset
sTarget_Cube_Dimension_List_Type = 'S';
sTarget_Cube_Dimension_List_Element = 'Default';

## [BLD Cube Source Measure]
## We just want to read items for which the 'Action' isn't blank.
sTarget_Measure_Type = 'S';
sTarget_Measure_Element = 'Base Measures';

## Create sSource_Subset_Type_List and sSource_Subset_Element_List comma-separated lists
## These instruct the view creation process on what subsets to include in the view
sTarget_Subset_Type_List = ''
	| sTarget_Cube_List_Type | ','
	| sTarget_Cube_Version_Type | ','
	| sTarget_Cube_Dimension_List_Type | ','
	| sTarget_Measure_Type;

sTarget_Subset_Element_List = ''
	| sTarget_Cube_List_Element | ','
	| sTarget_Cube_Version_Element | ','
	| sTarget_Cube_Dimension_List_Element | ','
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

ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sCube_Version_Dimension_Name );
ViewTitleElementSet( sTarget_Cube_Name, sTarget_View_Name, sCube_Version_Dimension_Name, DIMIX( sCube_Version_Dimension_Name, sSource_Build_Version ));

ViewTitleDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sCube_List_Dimension_Name);

ViewRowDimensionSet( sTarget_Cube_Name, sTarget_View_Name, sCube_Dimension_List_Dimension_Name, 1 );
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


# RETURNVIEWHANDLE( sTarget_Cube_Name, sTarget_View_Name );



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
