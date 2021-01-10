601,100
602,"SYS.Cube.Rule.Attach_From_File"
562,"NULL"
586,
585,
564,
565,"v6tqK9y\zQdV3WQvawOKXsaMj97js;0nVi;GYn>X[wALAT@<xu@cSStIh4izxM=nU^g_4sAg]FQ50px[ErfIk6;0^b_^_QSzFJIP4X@d@Uo@ABJA`_H[uYV]2H@JBsG>FHI<mo^]_oWhU1S6m:wCaQnm>MiIBe[Y9\9z^f<l_OFuxP>xsNu7Tp<P<3^D\PYZ`BfaKmsv"
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
569,0
592,0
599,1000
560,3
pCubeName
pRuleFilePath
pRuleFileName
561,3
2
2
2
590,3
pCubeName,""
pRuleFilePath,"../Source/RUX"
pRuleFileName,""
637,3
pCubeName,"pCubeName: Enter the name of the cube to which you'd like to attach the rule file."
pRuleFilePath,"pRuleFilePath: Enter the path where the rule text files reside."
pRuleFileName,"pRuleFileName: Enter the name of the file to load rules from for this cube. Leave blank to assume the filename is the same as the cube name, with a .txt extension."
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,23

#****Begin: Generated Statements***
#****End: Generated Statements****


nProcessAborted = 0;

sCubeName = pCubeName;

IF( CubeExists( sCubeName ) = 0 );
	nProcessAborted = 1;
	ItemReject( 'The cube ' | sCubeName | ' does not exist. Aborting process.' );
ENDIF;

sFilePath = pRuleFilePath;
sFileName = IF( pRuleFileName @= '', pCubeName | '.txt', pRuleFileName );

sFullPath = sFilePath | '\' | sFileName;

IF( FileExists( sFullPath ) = 0 );
	nProcessAborted = 1;
	ItemReject( 'The path ' | sFullPath | ' is invalid. Aborting process.' );
ENDIF;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,9

#****Begin: Generated Statements***
#****End: Generated Statements****

IF(nProcessAborted = 0);

	RuleLoadFromFile(sCubeName, sFullPath);

ENDIF;
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
