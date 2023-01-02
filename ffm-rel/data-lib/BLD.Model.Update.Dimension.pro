601,100
602,"BLD.Model.Update.Dimension"
562,"VIEW"
586,"BLD Dimension Source"
585,"BLD Dimension Source"
564,
565,"lxU>s3Y9FFCPaD=pUB9l\]Nk`en3q\zCAL;M?7gnVZ8p3wI6Lc>6oE4ONq1RKl5Uxw5[@_p>:S:HFwWudojD]FaqypAyXFbszZaA<ZsDg`uv0P;ES]yZ^g3ohf6@aW9ug7fqGHW?\9@dNKE4KYDJJ:hwL@9oc=KsfwFjy?i3^hu4DVt[JT_T4^\7w6z;3q<GQSe[xsLa"
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
pDimensionList
pLogToken
561,3
2
2
2
590,3
pBuildProfile,""
pDimensionList,""
pLogToken,""
637,3
pBuildProfile,""
pDimensionList,""
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
572,129

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
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Process started for dimension [' | pDimensionList | '] and Build Profile [' | pBuildProfile | ']...');
ENDIF;


StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sCube_Create_Temp_Process_Name = 'SYS.Cube.View.Create_Temp';
sCube_Cleanup_Temp_Process_Name = 'SYS.Cube.View.Cleanup_Temp';

sProcess_Execute_Process_Name = 'BLD.Model.Process.Execute';

sHierarchy_Update_Process_Name = 'BLD.Model.Update.Hierarchy';
sElement_Update_Process_Name = 'BLD.Model.Update.Element';
sHierarchy_Weighting_Update_Process_Name = 'BLD.Model.Update.Hierarchy.Weighting';
sSubset_Update_Process_Name = 'BLD.Model.Update.Subset';

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


## Create source view and set data source

## Define a variable for each dimension in the source cube...
## Set Dimension List Type to blank, single element, considated element or subset as appropriate

## Specify the BLD Dimension List element. 
## We just want to process the BLD Dimension List element passed in the pDimensionList parameter

sSource_Dimension_List_Type = 'E';
sSource_Dimension_List_Element = pDimensionList;

## Specify the BLD Hierarchy List element. 
## We want to cycle through all the hierarchies with a defined Action parameter

sSource_Hierarchy_List_Type = 'A';
sSource_Hierarchy_List_Element = '';

## Specify the BLD Dimension Version element. 
## We want to read items from the dimension version element specified in the BLD Dimension Control cube

sSource_Dimension_Version_Type = 'E';
sSource_Dimension_Version_Element = sHierarchy_Version;

## Specify the BLD Hierarchy Level element. 
## We just want to read items from the 'All Hierachy Level' line

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
573,37

#****Begin: Generated Statements***
#****End: Generated Statements****

## Load and validate properties from [BLD Dimension Source]

sAction = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', vDimension_List, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);
sBuild_Process_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Build Process Name' );
sBuild_Process_Parameter_Set = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Build Process Parameter Set' );

IF(vValue @<> 'Ignore' & vValue @<> 'Delete');

	ExecuteProcess( sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Processing dimension [' | vDimension_List | '>>' | sDimension_Name | '] and hierarchy [' | vHierarchy_List | '>>' | sHierarchy_Name | ']. The Action parameter is set to [' | vValue | '].' );

	ExecuteProcess( sElement_Update_Process_Name, 'pBuildProfile', sSource_Build_Profile_Element, 'pDimensionList', vDimension_List, 'pHierarchyList', vHierarchy_List, 'pLogToken', sLogToken );
	ExecuteProcess( sHierarchy_Update_Process_Name, 'pBuildProfile', sSource_Build_Profile_Element, 'pDimensionList', vDimension_List, 'pHierarchyList', vHierarchy_List, 'pLogToken', sLogToken );

	IF( ProcessExists( sBuild_Process_Name ) = 1 );
		# ExecuteProcess( sBuild_Process_Name, 'pBuildProfile', sSource_Build_Profile_Element, 'pDimensionList', vDimension_List, 'pHierarchyList', vHierarchy_List, 'pLogToken', sLogToken );
		ExecuteProcess( sProcess_Execute_Process_Name
			,'pProcessName', sBuild_Process_Name
			,'pProcessParameterSet', sBuild_Process_Parameter_Set
			,'pParameter01Name', 'pBuildProfile', 'pParameter01Value', sSource_Build_Profile_Element
			,'pParameter02Name', 'pDimensionList', 'pParameter02Value', vDimension_List
			,'pParameter03Name', 'pHierarchyList', 'pParameter03Value', vHierarchy_List
			,'pParameter04Name', 'pLogToken', 'pParameter04Value', sLogToken );
	ENDIF;

ELSE;

	ExecuteProcess( sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping dimension [' | vDimension_List | '>>' | sDimension_Name | '] and hierarchy [' | vHierarchy_List | '>>' | sHierarchy_Name | ']. The Action parameter is set to [' | vValue | '].' );

ENDIF;
574,20

#****Begin: Generated Statements***
#****End: Generated Statements****

## Load and validate properties from [BLD Dimension Source]

sAction = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', vDimension_List, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);
sBuild_Process_Name = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Build Process Name' );
sBuild_Process_Parameter_Set = CellGetS( sDimension_Source_Cube_Name, vDimension_List, vHierarchy_List, vDimension_Version, 'All Hierarchy Level', 'Build Process Parameter Set' );

IF(vValue @<> 'Ignore' & vValue @<> 'Delete');

	ExecuteProcess( sHierarchy_Weighting_Update_Process_Name, 'pBuildProfile', sSource_Build_Profile_Element, 'pDimensionList', vDimension_List, 'pHierarchyList', vHierarchy_List, 'pLogToken', sLogToken );
	ExecuteProcess( sSubset_Update_Process_Name, 'pBuildProfile', sSource_Build_Profile_Element, 'pDimensionList', vDimension_List, 'pHierarchyList', vHierarchy_List, 'pLogToken', sLogToken );

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
