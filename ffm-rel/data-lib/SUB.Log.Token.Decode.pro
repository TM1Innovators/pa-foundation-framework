601,100
602,"SUB.Log.Token.Decode"
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
pLogToken
561,1
2
590,1
pLogToken,"Harvey^2020-03-26^Entry 1^Admin^18:11:08"
637,1
pLogToken,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,29

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputLogSource');
StringGlobalVariable('OutputLogDate');
StringGlobalVariable('OutputLogEntry');
StringGlobalVariable('OutputLogUser');
StringGlobalVariable('OutputLogTime');

sLogToken = pLogToken;

nEndIndex = SCAN('^', sLogToken);
OutputLogSource = SUBST(sLogToken, 1, nEndIndex - 1);
sLogToken = SUBST(sLogToken, nEndIndex + 1, 999999);

nEndIndex = SCAN('^', sLogToken);
OutputLogDate = SUBST(sLogToken, 1, nEndIndex - 1);
sLogToken = SUBST(sLogToken, nEndIndex + 1, 999999);

nEndIndex = SCAN('^', sLogToken);
OutputLogEntry = SUBST(sLogToken, 1, nEndIndex - 1);
sLogToken = SUBST(sLogToken, nEndIndex + 1, 999999);

nEndIndex = SCAN('^', sLogToken);
OutputLogUser = SUBST(sLogToken, 1, nEndIndex - 1);
sLogToken = SUBST(sLogToken, nEndIndex + 1, 999999);

OutputLogTime = SUBST(sLogToken, 1, 999999);
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
