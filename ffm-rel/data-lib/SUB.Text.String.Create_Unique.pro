601,100
602,"SUB.Text.String.Create_Unique"
562,"NULL"
586,
585,
564,
565,"fI2i_[a@Ug_uGKDvaX=u\MqQJ2Q2yjJ]@24>UDNQtXm=4wbKW=bGx6jXcFf5Ej\5f=GO?s4e1kTg8y=uAWzSK]8zNsOsSKZDlJpdAk:<A[YFZOzON4\_KKvu_4`7LD?3WNETYnoQhN<VNPH]WERhDjxdQz`<]EYz6i^km[2[g?W9t]1Zv@IBiM\7aTMRu@Nqm[AN7s@v"
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
pPrefix
pSuffix
561,2
2
2
590,2
pPrefix,"}"
pSuffix,"_tmp"
637,2
pPrefix,""
pSuffix,""
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

StringGlobalVariable('OutputTempName');

sPrefix = TRIM( pPrefix );
sSuffix = TRIM( pSuffix );

sTimeStamp = TIMST( Now, '\Y\m\d\h\i\s' );

# Rnd = SUBST(TRIM(STR(RAND(), 0, 9)), 2, 99999);
sRandomNumber = SUBST(TRIM(STR(10000000000 + RAND()*10000000000, 15, 0)), 2, 9);

OutputTempName = sPrefix | sTimeStamp | '_' | sRandomNumber | sSuffix;

# ASCIIOUTPUT( '..\temp\RAND.txt', OutputTempName );
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
