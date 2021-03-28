601,100
602,"Cub.Data Load SYS Calendar MASTER"
562,"NULL"
586,
585,
564,
565,"dD1:aKwJGY5COkNWEhquo5hT6OXn]qGrApJz8aE``o6fPsfYzPiF2LbWaI<2rA8PGjeFb\\pnVocb>j3c1p7jUJ^K`;7_Zpk5ILsJqRZbXR2=K9QsMNDc]JDh;CV61bNIu9uSRTgg1NN2PEt>YzS50MYJhe`k9rcXhQLBRpNtnL]:QCwDU>0sCd1HyIIwilDgjxYMA1l"
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
560,0
561,0
590,0
637,0
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,17

#****Begin: Generated Statements***
#****End: Generated Statements****

sView_Zero_Process_Name = 'SYS.Cube.Data.Clear';
sLoad_Weekends_Process_Name = 'Cub.Data Load SYS Calendar Weekends';
sLoad_Holidays_Process_Name = 'Cub.Data Load SYS Calendar Public Holidays';
sLoad_OBL_Process_Name = 'Cub.Data Load SYS Calendar OBL';

sTarget_Cube_Name = 'SYS Calendar';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';

ExecuteProcess( sView_Zero_Process_Name,'pCubeName', sTarget_Cube_Name );

ExecuteProcess( sLoad_Weekends_Process_Name );
ExecuteProcess( sLoad_Holidays_Process_Name );
ExecuteProcess( sLoad_OBL_Process_Name );
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
