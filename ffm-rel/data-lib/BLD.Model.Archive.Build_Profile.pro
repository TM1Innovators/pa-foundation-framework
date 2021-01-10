601,100
602,"BLD.Model.Archive.Build_Profile"
562,"NULL"
586,
585,
564,
565,"eUfDvaJUQIBFLj>IQGj1t4bP@Vow4HuX7bdHgJC;qo<7eNqFzd9jwTq>uHnUGFU=xv]9:X\CtBu^5q86DNx7q9>I\I1PsRRdC?l_SUnmJeN8cp^z:UWNW6A^E=ykc6a=?_@]EV2=kmA_FBj4uQPzUh:GGlX8lfTyIKhNunj;4PNXm=w?uQ0oe7sRK=wfk;\R\W]p?jcS"
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
560,4
pSourceBuildProfile
pBuildProfileElementFormatString
pBuildProfileParentFormatString
pLogToken
561,4
2
2
2
2
590,4
pSourceBuildProfile,"Default"
pBuildProfileElementFormatString,""
pBuildProfileParentFormatString,""
pLogToken,""
637,4
pSourceBuildProfile,""
pBuildProfileElementFormatString,""
pBuildProfileParentFormatString,""
pLogToken,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,79

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
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ' process started...');
ENDIF;


##

sUnique_String_Process_Name = 'SUB.Text.String.Create_Unique';
sLoad_Globals_Process_Name = 'SUB.Config.Load_Variables';
sData_Copy_Process_Name = 'SYS.Cube.Data.Copy';

sCube_Control_Cube_Name = 'BLD Cube Control';
sDimension_Control_Cube_Name = 'BLD Dimension Control';

sBuild_Profile_Dimension_Name = 'BLD Build Profile';

StringGlobalVariable('OutputTempName');

ExecuteProcess(sUnique_String_Process_Name, 'pPrefix', ' ', 'pSuffix', ' ');
sUnique_String = OutputTempName;

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

ExecuteProcess( sLoad_Globals_Process_Name );

sSource_Build_Profile = pSourceBuildProfile;

sBuild_Profile_Element_Format_String = IF( TRIM(pBuildProfileElementFormatString) @<> '', pBuildProfileElementFormatString, CellGetS( 'SYS Control', 'Current Environment', 'Default Archive Element Format String' ));
sBuild_Profile_Element_Name = EXPAND( sBuild_Profile_Element_Format_String );

sBuild_Profile_Parent_Format_String = IF( TRIM(pBuildProfileParentFormatString) @<> '', pBuildProfileParentFormatString, CellGetS( 'SYS Control', 'Current Environment', 'Default Archive Parent Format String' ));
sBuild_Profile_Parent_Name = EXPAND( sBuild_Profile_Parent_Format_String );

DimensionElementInsert( sBuild_Profile_Dimension_Name, '', sBuild_Profile_Parent_Name, 'c' );
DimensionElementInsert( sBuild_Profile_Dimension_Name, '', sBuild_Profile_Element_Name, 'n' );
DimensionElementComponentAdd( sBuild_Profile_Dimension_Name, sBuild_Profile_Parent_Name, sBuild_Profile_Element_Name, 1);
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,36

#****Begin: Generated Statements***
#****End: Generated Statements****

## Copy data for the new build profile

ExecuteProcess( sData_Copy_Process_Name
	,'pCubeName', sCube_Control_Cube_Name
	,'pSourceSubsetTypeList', 'E,A,A'
	,'pSourceSubsetElementList', sSource_Build_Profile | ',,'
	,'pTargetSubsetTypeList', 'E,A,A'
	,'pTargetSubsetElementList', sBuild_Profile_Element_Name | ',,');

ExecuteProcess( sData_Copy_Process_Name
	,'pCubeName', sDimension_Control_Cube_Name
	,'pSourceSubsetTypeList', 'E,A,A'
	,'pSourceSubsetElementList', sSource_Build_Profile | ',,'
	,'pTargetSubsetTypeList', 'E,A,A'
	,'pTargetSubsetElementList', sBuild_Profile_Element_Name | ',,');

ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ' process successfully created build profile archive [' | sBuild_Profile_Element_Name | ']...');


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
