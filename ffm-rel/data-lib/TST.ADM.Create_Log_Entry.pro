601,100
602,"TST.ADM.Create_Log_Entry"
562,"CHARACTERDELIMITED"
586,"..\source\data\TestData.csv"
585,"\\KRACKEN\Foundation Model (ffm-dev)\source\data\TestData.csv"
564,
565,"wgn3vdi6>KyvTxvagzph?f_aQjhtX2u7Ctrvom\Tk^3c]`lc3W`uU7Ah]4ozKg4sgK0`^tdk0T:Vk0^;MZDoFSJEjtB`Ys@nqQf?VV<uYdYNdFexV8g739uNh?ag8=U36XX2^[T2?w3D?bLwNgA83Zk>T]=O<Vg^a7WMjDl7yhX4;cU\TX[0eWTh``GAHra<dqrJ7sRh"
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
589,","
568,""""
570,
571,
569,1
592,0
599,1000
560,2
pSimulateError
pLogToken
561,2
2
2
590,2
pSimulateError,"No"
pLogToken,""
637,2
pSimulateError,""
pLogToken,""
577,34
CubeName
V1
V2
V3
V4
V5
V6
V7
V8
V9
V10
V11
V12
V13
V14
V15
V16
V17
V18
V19
V20
V21
V22
V23
V24
V25
V26
V27
V28
V29
V30
V31
V32
Value
578,34
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
2
579,34
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
580,34
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
581,34
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
582,35
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarName=V35VarType=33ColType=827VarFormula=V35=CubeName;:VarFormulaDestination=BOTH
603,0
572,30

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
	ExecuteProcess(sLog_Write_Process_Name, 'pLogToken', sLogToken, 'pMessageType', 'INFO', 'pMessage', GetProcessName() | ': Starting process to test logging system...');
ENDIF;

sSimulateError = LOWER(SUBST(pSimulateError, 1, 1));

ExecuteProcess('ADM.Log.Write', 'pLogToken', sLogToken, 'pMessageType', 'WARN', 'pMessage', 'A warning occurred!');
ExecuteProcess('ADM.Log.Write', 'pLogToken', sLogToken, 'pMessageType', 'WARN', 'pMessage', 'A second warning occurred!');
573,4

#****Begin: Generated Statements***
V35=CubeName;
#****End: Generated Statements****
574,24

#****Begin: Generated Statements***
V35=CubeName;
#****End: Generated Statements****

IF(sSimulateError @= 'y');
	IF(nRecord_Count = 200 % nRecord_Count = 65);
		nError_Occurred = 1;
		sError_Message = 'A problem involving ' | CubeName | ' occurred!';
		ExecuteProcess('ADM.Log.Write', 'pLogToken', sLogToken, 'pMessageType', 'ERROR', 'pMessage', 'This process will exit due to an error');
		ProcessBreak;
	ENDIF;
ENDIF;

nDateCount = SubsetGetSize('GBL Date', 'Default');
nDateIndex = 1;

## Waste some time looping through the entire date dimension !
WHILE(nDateIndex <= nDateCount);
	sDateElem = SubsetGetElementName('GBL Date', 'Default', nDateIndex);
	nDateIndex = nDateIndex + 1;
END;

nRecord_Count = nRecord_Count + 1;
575,18

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
