601,100
602,"SUB.Log.Token.Generate"
562,"NULL"
586,
585,
564,
565,"fE1aqua<9_9xGp:1j3U4b^l5ONrP3_k3TTn@E40<nANg=3zs=ljdC`@mZ^GYILgWqUr[t:n3p`CiMhyp:=6?b?BTxk6JL6lt;VztpfQ8Dvx8fYC1t7N1<yyC5;V@gmI_SRIGg`g1af\C8wnSIj:8c6HrXv03D^98uB6Xs6Z7MnbvK[z2_9lLcp_SmJ>R\w8p05efLZQB"
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
560,1
pLogSource
561,1
2
590,1
pLogSource,""
637,1
pLogSource,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,52

#****Begin: Generated Statements***
#****End: Generated Statements****

sLogCubeName = 'ADM Log Message';
sLogCubeMeasureName = sLogCubeName | ' Measure';

StringGlobalVariable('OutputLogSource');
StringGlobalVariable('OutputLogDate');
StringGlobalVariable('OutputLogEntry');
StringGlobalVariable('OutputLogUser');
StringGlobalVariable('OutputLogTime');

StringGlobalVariable('OutputLogToken');
nNow = NOW();

sLogSource = pLogSource;
sLogUser = TM1User();

sYear = TIMST(nNow, '\Y',1);
sMonth = TIMST(nNow, '\m',1);
sDay = TIMST(nNow, '\d',1);
sHour = TIMST(nNow, '\h',1);
sMin = TIMST(nNow, '\i',1);
sSec = TIMST(nNow, '\s',1);

sLogDate = sYear | '-' | sMonth | '-' | sDay;
sLogTIme = sHour | ':' | sMin | ':' | sSec;

sUniqueStringCreateProcessName = 'SUB.Text.String.Create_Unique';
StringGlobalVariable('OutputTempName');
ExecuteProcess(sUniqueStringCreateProcessName);
sSubsetName = OutputTempName;

## Find the next available ADM Log Entry element for this Log Source and Log Date.
sMDX = '{ FILTER ( {TM1SUBSETALL( [ADM Log Entry] )}, [ %sLogCubeName% ].( [ADM Log Source].[%sLogSource%], [GBL Date].[%sLogDate%], [ADM Log Entry].CurrentMember, [ADM Log Line].[Summary], [%sLogCubeMeasureName%].[Message Type] ) = "" ).Item(0) }';
SubsetCreatebyMDX(sSubsetName, EXPAND(sMDX), 1);
sLogEntry = SubsetGetElementName('ADM Log Entry', sSubsetName, 1);
SubsetDestroy( 'ADM Log Entry', sSubsetName);

OutputLogSource = sLogSource;
OutputLogDate = sLogDate;
OutputLogEntry = sLogEntry;
OutputLogUser = sLogUser;
OutputLogTime = sLogTime;

OutputLogToken = 
	sLogSource | '^' 
	  | sLogDate | '^' 
	  | sLogEntry | '^' 
	  | sLogUser | '^' 
	  | sLogTime;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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
