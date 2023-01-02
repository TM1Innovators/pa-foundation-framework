601,100
602,"BLD.Model.Export.All"
562,"NULL"
586,"BLD Dimension Control"
585,"BLD Dimension Control"
564,
565,"wK[`j8Tk]KHS^ZY9Y`sCqJzaf@A?rW?`AB0[aSok_@uCp>tZiOLq2c6C=?zXiSIS7t`Y9PfZOjKcl2no2b`3vcPnnVv]hG\Pq_5SkPZFcif=pMNPc5ZfmsFm0jwQsT<H?Ws^`Qn_cidGAiv60<q=Bam4G`vxTs^`<UVziMC8iKn8TB12v@DycqHh;3Dhi^iERl`<ymgz"
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
pExportLocation
pCubeControlFileName
pDimensionControlFileName
pLogToken
561,5
2
2
2
2
2
590,5
pBuildProfile,""
pExportLocation,""
pCubeControlFileName,"Cube_Control.csv"
pDimensionControlFileName,"Dimension_Control.csv"
pLogToken,""
637,5
pBuildProfile,""
pExportLocation,""
pCubeControlFileName,""
pDimensionControlFileName,""
pLogToken,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,51

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

sDimension_Export_Process_Name = 'BLD.Model.Export.All.Dimensions';
sCube_Export_Process_Name = 'BLD.Model.Export.All.Cubes';
sUnique_String_Process_Name = 'SUB.Text.String.Create_Unique';

ExecuteProcess( sUnique_String_Process_Name );
sUniqueString = OutputTempName;

sExport_Location = IF ( pExportLocation @<> '', pExportLocation, sUniqueString );

ExecuteProcess( sDimension_Export_Process_Name
	,'pBuildProfile', pBuildProfile
	,'pExportLocation', sExport_Location
	,'pDimensionControlFileName', pDimensionControlFileName
	,'pLogToken', sLogToken);

ExecuteProcess( sCube_Export_Process_Name
	,'pBuildProfile', pBuildProfile
	,'pExportLocation', sExport_Location
	,'pCubeControlFileName', pCubeControlFileName
	,'pLogToken', sLogToken);
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
