601,100
602,"BLD.Model.Update.Hierarchy.Date.Balance"
562,"VIEW"
586,"BLD Element Source"
585,"BLD Element Source"
564,
565,"cSJa\IbJw?TW3ZMR2G]fb`7@_BS@lUz]YUy1B7tZ`mq[S1VY>Ad9YK>BJ>=QYnr<0@V@[<Fm8U0h==6z3oKAUw>Ru4Z3XEkJdgf\K6se\i4q0jl?Jo9XN;uA^\gI0T[bx2ctNLUPKFQi?9t1\RN]H<YH486eJ;DffcmC_RAe8X42Wy;=9Onoh4jof9@:tC`yPVH`33=b"
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
560,11
pBuildProfile
pDimensionList
pHierarchyList
pBalanceElementFormatString
pBalanceDisplayNameFormatString
pOBLElementFormatString
pOBLDisplayNameFormatString
pFinYearAttributeName
pDateSerialAttributeName
pHierarchyType
pLogToken
561,11
2
2
2
2
2
2
2
2
2
2
2
590,11
pBuildProfile,""
pDimensionList,""
pHierarchyList,""
pBalanceElementFormatString,""
pBalanceDisplayNameFormatString,""
pOBLElementFormatString,""
pOBLDisplayNameFormatString,""
pFinYearAttributeName,""
pDateSerialAttributeName,""
pHierarchyType,""
pLogToken,""
637,11
pBuildProfile,""
pDimensionList,""
pHierarchyList,""
pBalanceElementFormatString,""
pBalanceDisplayNameFormatString,""
pOBLElementFormatString,""
pOBLDisplayNameFormatString,""
pFinYearAttributeName,""
pDateSerialAttributeName,""
pHierarchyType,"YTD | YTG"
pLogToken,""
577,9
vDimension_Version
vDimension_List
vHierarchy_List
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
3
1
2
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
572,184

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

sHierarchy_Set_Weight_Process_Name = 'BLD.Model.Update.Hierarchy.Weighting';

sHierarchy_Flatten_Process_Name = 'SYS.Dimension.Hierarchy.Flatten';
sCreate_Subset_MDX_Process_Name = 'SYS.Dimension.Subset.Create_By_MDX';

sSource_Cube_Name = 'BLD Element Source';
sSource_Measure_Name = sSource_Cube_Name | ' Measure';

sDimension_Control_Cube_Name = 'BLD Dimension Control';
sDimension_Source_Cube_Name = 'BLD Dimension Source';
sElement_Source_Cube_Name = 'BLD Element Source';
sAttribute_Source_Cube_Name = 'BLD Attribute Source';

sDimension_List_Dimension_Name = 'BLD Dimension List';
sDimension_Version_Dimension_Name = 'BLD Dimension Version';
sHierarchy_List_Dimension_Name = 'BLD Hierarchy List';
sElement_List_Dimension_Name = 'BLD Element List';


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
sHierarchy_Version = CellGetS(sDimension_Control_Cube_Name, sSource_Build_Profile_Element, pDimensionList, 'Build Version');


## Load and validate properties from [BLD Dimension Source]

sAction = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Action' );
sDimension_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Name' );
sDimension_Name = IF( sDimension_Name @= '', pDimensionList, sDimension_Name);
sHierarchy_Name = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Name' );
sHierarchy_Name = IF( sHierarchy_Name @= '', sDimension_Name, sHierarchy_Name);
sHierarchy_Element_Source = CellGetS( sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Hierarchy Element Source' );
sHierarchy_Element_Source = IF( sHierarchy_Element_Source @= '', 'Primary', sHierarchy_Element_Source);

sPopulated_Elements_MDX = EXPAND( '{ FILTER({ EXCEPT({ TM1SUBSETALL( [BLD Element List] ) }, { [BLD Element List].[Header] }) }, [BLD Element Source].( [BLD Dimension List].[%pDimensionList%], [BLD Hierarchy List].[%sHierarchy_Element_Source%], [BLD Dimension Version].[%sHierarchy_Version%], [BLD Element Source Measure].[Action] ) <> "" )}' );
ExecuteProcess( sCreate_Subset_MDX_Process_Name
	,'pTargetDimension', 'BLD Element List'
	,'pMDXQuery', sPopulated_Elements_MDX );

sElement_Basis_Subset_Name = OutputSubsetName;

nChild_Element_Count = SubsetGetSize( sElement_List_Dimension_Name, sElement_Basis_Subset_Name);

sDimension_Type = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Dimension Type');
sDescription_Attribute = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Description Attribute');
#sDescription_Attribute = IF( sDescription_Attribute @= '', 'Description', sDescription_Attribute );
sDisplay_Name_Attribute = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Display Name Attribute');
sDisplay_Name_Attribute = IF( sDisplay_Name_Attribute @= '', 'Display Name', sDisplay_Name_Attribute );

sTotal_Element = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Total Element Name');
sTotal_Display_Name = CellGetS(sDimension_Source_Cube_Name, pDimensionList, pHierarchyList, sHierarchy_Version, 'All Hierarchy Level', 'Total Element Display Name');

IF(sUpdate_Hierarchy @<> 'Yes');
	nSkip_Processing = 1;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Skipping hierarchy for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']. The [Update Hierarchy] property is set to [' | sUpdate_Hierarchy | '].');
ELSE;
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Updating hierarchies for dimension [' | pDimensionList | '>>' | sDimension_Name | '] and hierarchy [' | pHierarchyList | '>>' | sHierarchy_Name | ']...');
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
## We just want to read items from the 'All Elements' subset with no header
sSource_Element_List_Type = 'S';
sSource_Element_List_Element = sElement_Basis_Subset_Name;

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
573,62

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Ignore');
	ItemSkip;
ENDIF;

IF( vValue @<> 'Ignore' & vValue @<> 'Delete' );

	sElement_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Element Name');
	sElement_Display_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Display Name');
	sBalance_Element_Year = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, pFinYearAttributeName);
	sBalance_Element_Date_Serial = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, pDateSerialAttributeName );

	# Add the BAL element
	sBalance_Element_Name = EXPAND( pBalanceElementFormatString );
	sBalance_Element_Display_Name = EXPAND( pBalanceDisplayNameFormatString );
	HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sBalance_Element_Name, 'c');

	IF( pOBLElementFormatString @<> '' );
		# Add the OBL element
		sOBL_Element_Name = EXPAND( pOBLElementFormatString );
		HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sOBL_Element_Name, 'n');
		HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sBalance_Element_Name, sOBL_Element_Name, 1);
	ENDIF;

	# Loop though all the potential child elements, adding it if applicable to the current BAL element ( BAL element >= current element )

	nBalance_Element_Year = NUMBR( sBalance_Element_Year );
	nBalance_Element_Serial = NUMBR( sBalance_Element_Date_Serial );

	nChild_Element_Index = 1;

	WHILE ( nChild_Element_Index <= nChild_Element_Count );

		sChild_Element_List = SubsetGetElementName( sElement_List_Dimension_Name, sElement_Basis_Subset_Name, nChild_Element_Index);
		sChild_Element_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, sChild_Element_List, 'Element Name');
		nChild_Element_Serial = NUMBR( CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, sChild_Element_List, pDateSerialAttributeName));
		nChild_Element_Year = NUMBR( CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, sChild_Element_List, pFinYearAttributeName));

		HierarchyElementInsert( sDimension_Name, sHierarchy_Name, '', sChild_Element_Name, 'n');

		IF( pHierarchyType @= 'YTG' );
			IF( nChild_Element_Year = nBalance_Element_Year & nChild_Element_Serial >= nBalance_Element_Serial );
				HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sBalance_Element_Name, sChild_Element_Name, 1);
			ENDIF;
		ELSE;
			IF( nChild_Element_Year = nBalance_Element_Year & nChild_Element_Serial <= nBalance_Element_Serial );
				HierarchyElementComponentAdd( sDimension_Name, sHierarchy_Name, sBalance_Element_Name, sChild_Element_Name, 1);
			ENDIF;			
		ENDIF;

		nChild_Element_Index = nChild_Element_Index + 1;

	END;

ENDIF;
574,34

#****Begin: Generated Statements***
#****End: Generated Statements****


IF(nError_Occurred <> 0 % nSkip_Processing <> 0);
	ProcessBreak;
ENDIF;

IF(vValue @= 'Ignore');
	ItemSkip;
ENDIF;

IF( vValue @<> 'Ignore' & vValue @<> 'Delete' );

	sElement_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Element Name');
	sElement_Display_Name = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, 'Display Name');
	sBalance_Element_Year = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, pFinYearAttributeName);
	sBalance_Element_Date_Serial = CellGetS( sElement_Source_Cube_Name, vDimension_List, vHierarchy_List, sHierarchy_Version, vElement_List, pDateSerialAttributeName );

	# Populate the BAL element Display Name attribute
	sBalance_Element_Name = EXPAND( pBalanceElementFormatString );
	sBalance_Element_Display_Name = EXPAND( pBalanceDisplayNameFormatString );

	ElementAttrPutS( sBalance_Element_Display_Name, sDimension_Name, sHierarchy_Name, sBalance_Element_Name, sDisplay_Name_Attribute );

	IF( pOBLElementFormatString @<> '' );
		# Populate the OBL element Display Name attribute
		sOBL_Element_Name = EXPAND( pOBLElementFormatString );
		sOBL_Element_Display_Name = EXPAND( pOBLDisplayNameFormatString );

		ElementAttrPutS( sOBL_Element_Display_Name, sDimension_Name, sHierarchy_Name, sOBL_Element_Name, sDisplay_Name_Attribute );
	ENDIF;
ENDIF;
575,27

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(sTotal_Element @<> '');
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
