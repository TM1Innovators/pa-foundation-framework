601,100
602,"SYS.Cube.Data.Clear"
562,"NULL"
586,
585,
564,
565,"zHtu:qgZ>Cu:nwDfkhac^qmKqqaCEf66UUncqawO03=yHTd5X;djtvMrQuigewHAdRfZQvc9h?]oBNZf^eoZ]]gEkAxOQ5pUor:FD5;dGj23h5XQMhSekkoiJEJV1Y:w=D=[d6\GQ:_wN1QCf^1`Xba2JrwbKSD;0c<TU<ALT:kxKLua>eozw7UN99C>HSlK@f\yTw^y"
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
560,3
pCubeName
pSubsetTypeList
pSubsetElementList
561,3
2
2
2
590,3
pCubeName,""
pSubsetTypeList,""
pSubsetElementList,""
637,3
pCubeName,""
pSubsetTypeList,""
pSubsetElementList,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,20

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sProcessName = GetProcessName();
sViewCreateProcessName = 'SYS.Cube.View.Create_Temp';
sViewCleanupProcessName = 'SYS.Cube.View.Cleanup_Temp';

ExecuteProcess(sViewCreateProcessName, 'pCubeName', pCubeName, 'pSubsetTypeList', pSubsetTypeList, 'pSubsetElementList', pSubsetElementList);
sViewName = OutputViewName;
sSubsetName = OutputSubsetName;

ViewZeroOut(pCubeName, sViewName);

ExecuteProcess(sViewCleanupProcessName, 'pCubeName', pCubeName);
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
1217,1
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
