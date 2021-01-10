601,100
602,"ADM.Log.Write"
562,"NULL"
586,
585,
564,
565,"wyVWIP1OqW]OWJY097L=Cr@aVDxOK8KWPJ0oY1nxKB`mIf=m<F;ra0\P:_1`OuMaiwu7?gF?Q[m7[U2CohZqJ?pfNww=ai@y4WA2`sTyw=?Q1O?mE\P28fPh2pui;MR1yhr[pPA55aOtPs@S;TQI0eSXETNKqq92;Yt9OO^m`1VkBy_jOOnvWfVJ[5F:5Ze36KJ4r47P"
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
pLogToken
pLogLine
pMessageType
pMessage
561,4
2
2
2
2
590,4
pLogToken,""
pLogLine,""
pMessageType,""
pMessage,""
637,4
pLogToken,""
pLogLine,""
pMessageType,""
pMessage,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,39

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

sLogLine = pLogLine;
IF(sLogLine @= '');

	## Find the next available ADM Log Entry element for this Log Source and Log Date.
	sMDX = '{ FILTER ( { EXCEPT ( { TM1SUBSETALL( [ADM Log Line] ) }, { [ADM Log Line].[Summary], [ADM Log Line].[Total Line] }) }, [ %sLogCubeName% ].( [ADM Log Source].[%sLogSource%], [GBL Date].[%sLogDate%], [ADM Log Entry].[%sLogEntry%], [ADM Log Line].CurrentMember, [%sLogCubeMeasureName%].[Message Type] ) = "" ).Item(0) }';
	SubsetCreatebyMDX(sLogSource, EXPAND(sMDX), 1);
	sLogLine = SubsetGetElementName('ADM Log Line', sLogSource, 1);
	SubsetDestroy('ADM Log Line', sLogSource);

ENDIF;

IF(DIMIX('ADM Log Source', sLogSource) = 0);
	DimensionElementInsert('ADM Log Source', '', sLogSource, 'n');
	DimensionElementComponentAdd('ADM Log Source', 'Processes', sLogSource, 1);
ENDIF;
	
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,19

#****Begin: Generated Statements***
#****End: Generated Statements****

CellPutN(nNow, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Start Time');
CellPutS(sLogUser, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'User');

CellPutS(sLogDate, 'ADM Log Control', sLogUser,  sLogSource, 'Current Log Date');
CellPutS(sLogEntry, 'ADM Log Control', sLogUser,  sLogSource, 'Current Log Entry');

IF(sLogLine @= 'Summary');
	CellPutN(1, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Error Flag');
	CellPutS('ERROR', sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message Type');
	CellPutS('The process did not complete successfully', sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message');
ELSE;
	CellPutN(0, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Error Flag');
	CellPutS(pMessageType, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message Type');
	CellPutS(pMessage, sLogCubeName, sLogDate, sLogSource, sLogEntry, sLogLine, 'Message');
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
