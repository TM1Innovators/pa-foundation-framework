601,100
602,"TST.Text.String.Create_Unique"
562,"NULL"
586,
585,
564,
565,"elRBiaip]ENT1J=ax=d=DQypVBJD>wS\@UdXK8V5]NoV^]k:rc8Sy=i9TvG;sm=aifSZX5uS<jVrA?aIeUjhy>`5Snf1Ao;4`ji\v@Im8>hOT<vIZT@YDbgPNB;atO]a4\@Y]qCk6FU[SqY^V6xrRpdDw4D8DRX6E0p9@^?DhZpLG[yFBLNC3JcO_67j=f?F7IurE^ws"
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
572,21

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputTempName');

sUnique_Create_Process_Name = 'SUB.Text.String.Create_Unique';

nCount = 65536;
nIndex = 1;

WHILE( nIndex <= nCount );

	ExecuteProcess( sUnique_Create_Process_Name, 'pPrefix', '', 'pSuffix', '' );
	sUnique = OutputTempName;

	ASCIIOUTPUT( '..\temp\unique.txt', sUnique );

	nIndex = nIndex + 1;

END;
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
