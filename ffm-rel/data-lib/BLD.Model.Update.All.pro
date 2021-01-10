601,100
602,"BLD.Model.Update.All"
562,"NULL"
586,"BLD Dimension Control"
585,"BLD Dimension Control"
564,
565,"zM>fY;mXZ[?19qyG@tDLzFWAI:aPuhAM3jp=0_DKb09LnARe6^jhDlZSzZW3B\9y357M3PSare4`Utz5jKP^G<=wzE1dHzGOLc\gpAY_y`ZrlclPXUc?\]N\[@DxR0stUO<03dDVBbLEjHl4z?[3yCt^?k?RUlQBsg5d@`xbI1J8`<X2inpi6KoqxExaIk\8aLyqttB3"
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
560,5
pBuildProfile
pArchiveBuildProfile
pArchiveElementFormatString
pArchiveParentFormatString
pLogToken
561,5
2
2
2
2
2
590,5
pBuildProfile,""
pArchiveBuildProfile,""
pArchiveElementFormatString,""
pArchiveParentFormatString,""
pLogToken,""
637,5
pBuildProfile,""
pArchiveBuildProfile,""
pArchiveElementFormatString,""
pArchiveParentFormatString,""
pLogToken,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,53

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

sDimension_Update_Process_Name = 'BLD.Model.Update.All.Dimensions';
sCube_Update_Process_Name = 'BLD.Model.Update.All.Cubes';
sArchive_Build_Profile_Process_Name = 'BLD.Model.Archive.Build_Profile';

sControl_Cube_Name = 'SYS Control';
sBuild_Profile_Dimension_Name = 'BLD Build Profile';

sArchive_Build_Profile = IF( pArchiveBuildProfile @<> '', pArchiveBuildProfile, CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Build Profile Archiving' ));
sArchive_Build_Profile = LOWER( SUBST( TRIM( sArchive_Build_Profile ), 1, 1 ));

sSource_Build_Profile_Element = pBuildProfile;

IF(sSource_Build_Profile_Element @= '');
	sDefault_Profile_Name = CellGetS( sControl_Cube_Name, 'Current Environment', 'Default Build Profile');
	sSource_Build_Profile_Element = IF( DIMIX( sBuild_Profile_Dimension_Name, sDefault_Profile_Name) = 0, DIMNM( sBuild_Profile_Dimension_Name, 1), sDefault_Profile_Name);
ENDIF;

ExecuteProcess( sDimension_Update_Process_Name
	,'pBuildProfile', sSource_Build_Profile_Element
	,'pLogToken', sLogToken);

ExecuteProcess( sCube_Update_Process_Name
	,'pBuildProfile', sSource_Build_Profile_Element
	,'pLogToken', sLogToken);
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,5

#****Begin: Generated Statements***
#****End: Generated Statements****


575,37

#****Begin: Generated Statements***
#****End: Generated Statements****


## Archive the build profile

IF( sArchive_Build_Profile @= 'y' );

	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ' archiving build profile [' | sSource_Build_Profile_Element | ']...');

	ExecuteProcess( sArchive_Build_Profile_Process_Name
		,'pSourceBuildProfile', sSource_Build_Profile_Element
		,'pBuildProfileElementFormatString', pArchiveElementFormatString
		,'pBuildProfileParentFormatString', pArchiveParentFormatString
		,'pLogToken', sLogToken);

ENDIF;


## Log process finalize

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
