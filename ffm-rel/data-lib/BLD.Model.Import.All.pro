601,100
602,"BLD.Model.Import.All"
562,"NULL"
586,"BLD Dimension Control"
585,"BLD Dimension Control"
564,
565,"iMrI?Nntwain1Y`cEtC:FUXNLk73irGwjh:KuclQOLzAtRWaO_sRf;9PA`IZRIp1G1^AwiEcEZ8aOl9hsE:ytEM5Hrtg8\urBer9]`P?\^>F`ZH730`U1;P`zxOKArGfV9hQ[<FAH9>C@AUzC\AeGEz61_uJZbte5;=:y]DlV7H\s>vhyp5pO^ST=5xJ88Ir6sL]nE1?"
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
560,9
pImportLocation
pCubeControlFileName
pDimensionControlFileName
pTargetCubeVersion
pTargetDimensionVersion
pTargetBuildProfile
pTargetAction
pTargetUpdateFlag
pLogToken
561,9
2
2
2
2
2
2
2
2
2
590,9
pImportLocation,""
pCubeControlFileName,"Cube_Control.csv"
pDimensionControlFileName,"Dimension_Control.csv"
pTargetCubeVersion,""
pTargetDimensionVersion,""
pTargetBuildProfile,""
pTargetAction,""
pTargetUpdateFlag,""
pLogToken,""
637,9
pImportLocation,""
pCubeControlFileName,""
pDimensionControlFileName,""
pTargetCubeVersion,""
pTargetDimensionVersion,""
pTargetBuildProfile,""
pTargetAction,""
pTargetUpdateFlag,""
pLogToken,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,57

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


## Define globals & model object references

StringGlobalVariable('OutputTempName');

sDimension_Import_Process_Name = 'BLD.Model.Import.All.Dimensions';
sCube_Import_Process_Name = 'BLD.Model.Import.All.Cubes';

sImport_Location = pImportLocation;

IF( pDimensionControlFileName @<> '' );
	ExecuteProcess( sDimension_Import_Process_Name
		,'pImportLocation', sImport_Location
		,'pDimensionControlFileName', pDimensionControlFileName
		,'pTargetBuildVersion', pTargetDimensionVersion
		,'pTargetBuildProfile', pTargetBuildProfile
		,'pTargetAction', pTargetAction
		,'pTargetUpdateFlag', pTargetUpdateFlag
		,'pLogToken', sLogToken);
ENDIF;

IF( pCubeControlFileName @<> '' );
	ExecuteProcess( sCube_Import_Process_Name
		,'pImportLocation', sImport_Location
		,'pCubeControlFileName', pCubeControlFileName
		,'pTargetBuildVersion', pTargetDimensionVersion
		,'pTargetBuildProfile', pTargetBuildProfile
		,'pTargetAction', pTargetAction
		,'pTargetUpdateFlag', pTargetUpdateFlag
		,'pLogToken', sLogToken);
ENDIF;
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,19

#****Begin: Generated Statements***
#****End: Generated Statements****



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
