601,100
602,"SYS.Cube.Create"
562,"NULL"
586,
585,
564,
565,"iFjrVWs[kam<_pSMkyVzUwIKQ_2^gKzpsHVSjPz9M7c\_2xtWqUlfAr?>A47?M>b;9F4dgbOXqMK1InDRy2rXfAGQ8O^`AyptU991PYvnD>7:oCDAU:PFUmc<>w^T2A0Q[FEiLtbkNKv2mj0kaCKuNOH_V@R`PO]Z=xVBOOa\rBbTSCb?2qjkK4dU@ZB99g5euC@w@fV"
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
560,34
pCubeName
pDimensionName1
pDimensionName2
pDimensionName3
pDimensionName4
pDimensionName5
pDimensionName6
pDimensionName7
pDimensionName8
pDimensionName9
pDimensionName10
pDimensionName11
pDimensionName12
pDimensionName13
pDimensionName14
pDimensionName15
pDimensionName16
pDimensionName17
pDimensionName18
pDimensionName19
pDimensionName20
pDimensionName21
pDimensionName22
pDimensionName23
pDimensionName24
pDimensionName25
pDimensionName26
pDimensionName27
pDimensionName28
pDimensionName29
pDimensionName30
pDimensionName31
pDimensionName32
pOverwrite
561,34
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
590,34
pCubeName,""
pDimensionName1,""
pDimensionName2,""
pDimensionName3,""
pDimensionName4,""
pDimensionName5,""
pDimensionName6,""
pDimensionName7,""
pDimensionName8,""
pDimensionName9,""
pDimensionName10,""
pDimensionName11,""
pDimensionName12,""
pDimensionName13,""
pDimensionName14,""
pDimensionName15,""
pDimensionName16,""
pDimensionName17,""
pDimensionName18,""
pDimensionName19,""
pDimensionName20,""
pDimensionName21,""
pDimensionName22,""
pDimensionName23,""
pDimensionName24,""
pDimensionName25,""
pDimensionName26,""
pDimensionName27,""
pDimensionName28,""
pDimensionName29,""
pDimensionName30,""
pDimensionName31,""
pDimensionName32,""
pOverwrite,"No"
637,34
pCubeName,""
pDimensionName1,""
pDimensionName2,""
pDimensionName3,""
pDimensionName4,""
pDimensionName5,""
pDimensionName6,""
pDimensionName7,""
pDimensionName8,""
pDimensionName9,""
pDimensionName10,""
pDimensionName11,""
pDimensionName12,""
pDimensionName13,""
pDimensionName14,""
pDimensionName15,""
pDimensionName16,""
pDimensionName17,""
pDimensionName18,""
pDimensionName19,""
pDimensionName20,""
pDimensionName21,""
pDimensionName22,""
pDimensionName23,""
pDimensionName24,""
pDimensionName25,""
pDimensionName26,""
pDimensionName27,""
pDimensionName28,""
pDimensionName29,""
pDimensionName30,""
pDimensionName31,""
pDimensionName32,""
pOverwrite,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,170

#****Begin: Generated Statements***
#****End: Generated Statements****

sTargetCubeName = pCubeName;
sOverwrite = LOWER(SUBST( pOverwrite, 1, 1 ));

IF( CubeExists(sTargetCubeName) <> 0 & sOverwrite @= 'y');
	CubeDestroy( sTargetCubeName );
ENDIF;

IF( CubeExists(sTargetCubeName) <> 0 );
	## Exist without error - the cube already exists and shuoldn't be overwritten
	ProcessBreak;
ENDIF;

IF(pDimensionName32 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26, pDimensionName27, pDimensionName28, pDimensionName29, pDimensionName30, pDimensionName31, pDimensionName32);
	ProcessBreak;
ENDIF;

IF(pDimensionName31 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26, pDimensionName27, pDimensionName28, pDimensionName29, pDimensionName30, pDimensionName31);
	ProcessBreak;
ENDIF;

IF(pDimensionName30 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26, pDimensionName27, pDimensionName28, pDimensionName29, pDimensionName30);
	ProcessBreak;
ENDIF;

IF(pDimensionName29 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26, pDimensionName27, pDimensionName28, pDimensionName29);
	ProcessBreak;
ENDIF;

IF(pDimensionName28 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26, pDimensionName27, pDimensionName28);
	ProcessBreak;
ENDIF;

IF(pDimensionName27 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26, pDimensionName27);
	ProcessBreak;
ENDIF;

IF(pDimensionName26 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25, pDimensionName26);
	ProcessBreak;
ENDIF;

IF(pDimensionName25 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24, pDimensionName25);
	ProcessBreak;
ENDIF;

IF(pDimensionName24 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23, pDimensionName24);
	ProcessBreak;
ENDIF;

IF(pDimensionName23 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22, pDimensionName23);
	ProcessBreak;
ENDIF;

IF(pDimensionName22 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21, pDimensionName22);
	ProcessBreak;
ENDIF;

IF(pDimensionName21 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20, pDimensionName21);
	ProcessBreak;
ENDIF;

IF(pDimensionName20 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19, pDimensionName20);
	ProcessBreak;
ENDIF;

IF(pDimensionName19 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18, pDimensionName19);
	ProcessBreak;
ENDIF;

IF(pDimensionName18 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17, pDimensionName18);
	ProcessBreak;
ENDIF;

IF(pDimensionName17 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16, pDimensionName17);
	ProcessBreak;
ENDIF;

IF(pDimensionName16 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15, pDimensionName16);
	ProcessBreak;
ENDIF;

IF(pDimensionName15 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14, pDimensionName15);
	ProcessBreak;
ENDIF;

IF(pDimensionName14 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13, pDimensionName14);
	ProcessBreak;
ENDIF;

IF(pDimensionName13 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12, pDimensionName13);
	ProcessBreak;
ENDIF;

IF(pDimensionName12 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11, pDimensionName12);
	ProcessBreak;
ENDIF;

IF(pDimensionName11 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10, pDimensionName11);
	ProcessBreak;
ENDIF;

IF(pDimensionName10 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9, pDimensionName10);
	ProcessBreak;
ENDIF;

IF(pDimensionName9 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8, pDimensionName9);
	ProcessBreak;
ENDIF;

IF(pDimensionName8 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7, pDimensionName8);
	ProcessBreak;
ENDIF;

IF(pDimensionName7 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6, pDimensionName7);
	ProcessBreak;
ENDIF;

IF(pDimensionName6 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5, pDimensionName6);
	ProcessBreak;
ENDIF;

IF(pDimensionName5 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4, pDimensionName5);
	ProcessBreak;
ENDIF;

IF(pDimensionName4 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3, pDimensionName4);
	ProcessBreak;
ENDIF;

IF(pDimensionName3 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2, pDimensionName3);
	ProcessBreak;
ENDIF;

IF(pDimensionName2 @<> '');
	CubeCreate(sTargetCubeName, pDimensionName1, pDimensionName2);
	ProcessBreak;
ENDIF;
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
