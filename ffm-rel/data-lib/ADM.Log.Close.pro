601,100
602,"ADM.Log.Close"
562,"NULL"
586,
585,
564,
565,"q8xFX6\1DnQl2M^u9a4l[rZxhN3]Yf>M\S9cjK2hweVD`UnaLC5XrAkp8Q@gKnWSHo@cI2TFv?;uJFXt3xduvWxB2Z<Z4JUJa7N]u89LN3Ewp^^@<gtVS:Si`ie`CjcE757S5tX;`@wmSJ=]qOj8rkY1U9xJWRH7W@U?D\]jls`fe77bs>5Ksj7gZqe2U8LvoN88u11j"
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
560,2
pLogToken
pErrorMessage
561,2
2
2
590,2
pLogToken,""
pErrorMessage,""
637,2
pLogToken,""
pErrorMessage,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,24

#****Begin: Generated Statements***
#****End: Generated Statements****

sLogCubeName = 'ADM Log Message';
sLogCubeMeasureName = sLogCubeName | ' Measure';

nNow = NOW();

StringGlobalVariable('OutputLogSource');
StringGlobalVariable('OutputLogDate');
StringGlobalVariable('OutputLogEntry');
StringGlobalVariable('OutputLogUser');
StringGlobalVariable('OutputLogTime');

ExecuteProcess('SUB.Log.Token.Decode', 'pLogToken', pLogToken);

sLogSource = OutputLogSource;
sLogDate = OutputLogDate;
sLogEntry = OutputLogEntry;
sLogUser = OutputLogUser;
sLogTime = OutputLogTime;

sLogLine = 'Summary';
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,15

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(pErrorMessage @= '');
	CellPutS('INFO', sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message Type');
	CellPutS('The process completed successfully', sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message');
	CellPutN(nNow, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Finish Time');
	CellPutN(0, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Error Flag');
ELSE;
	CellPutS('ERROR', sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message Type');
	CellPutS(pErrorMessage, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message');
	CellPutN(nNow, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Finish Time');
	CellPutN(1, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Error Flag');
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
