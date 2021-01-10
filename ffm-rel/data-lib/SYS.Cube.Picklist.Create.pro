601,100
602,"SYS.Cube.Picklist.Create"
562,"NULL"
586,
585,
564,
565,"fmw\`ca=Ya`C;dRmr@orz10xK@U9B\pqS8Lgj3fhnAaxyH8ofXmJpQ?ktkjcsW2PXZ^90o<cCd^XdrGX@R5qvkqt;BT_Fr[fv?VmwrHUbMD]E:eEs2Fk`dovP`\CUlyt55p@Cxer=C;oEI1nM3BRpYVwBSLBChS?T?kN0j52yQ<==mWARi8LDuepzTCuB?Xg[:o5q;f>"
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
pCubeName
pOverwrite
561,2
2
2
590,2
pCubeName,""
pOverwrite,"No"
637,2
pCubeName,""
pOverwrite,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,208

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputPicklistCubeName');

sTargetCubeName = '}Picklist_' | pCubeName;
sPicklistMeasureName = '}Picklist';

OutputPicklistCubeName = sTargetCubeName;

sOverwrite = LOWER(SUBST( pOverwrite, 1, 1 ));
IF( CubeExists(sTargetCubeName) <> 0 & sOverwrite @= 'y');
	CubeDestroy( sTargetCubeName );
ENDIF;

sDimensionName1 = TABDIM( pCubeName, 1);
sDimensionName2 = TABDIM( pCubeName, 2);
sDimensionName3 = TABDIM( pCubeName, 3);
sDimensionName4 = TABDIM( pCubeName, 4);
sDimensionName5 = TABDIM( pCubeName, 5);
sDimensionName6 = TABDIM( pCubeName, 6);
sDimensionName7 = TABDIM( pCubeName, 7);
sDimensionName8 = TABDIM( pCubeName, 8);
sDimensionName9 = TABDIM( pCubeName, 9);
sDimensionName10 = TABDIM( pCubeName, 10);
sDimensionName11 = TABDIM( pCubeName, 11);
sDimensionName12 = TABDIM( pCubeName, 12);
sDimensionName13 = TABDIM( pCubeName, 13);
sDimensionName14 = TABDIM( pCubeName, 14);
sDimensionName15 = TABDIM( pCubeName, 15);
sDimensionName16 = TABDIM( pCubeName, 16);
sDimensionName17 = TABDIM( pCubeName, 17);
sDimensionName18 = TABDIM( pCubeName, 18);
sDimensionName19 = TABDIM( pCubeName, 19);
sDimensionName20 = TABDIM( pCubeName, 20);
sDimensionName21 = TABDIM( pCubeName, 21);
sDimensionName22 = TABDIM( pCubeName, 22);
sDimensionName23 = TABDIM( pCubeName, 23);
sDimensionName24 = TABDIM( pCubeName, 24);
sDimensionName25 = TABDIM( pCubeName, 25);
sDimensionName26 = TABDIM( pCubeName, 26);
sDimensionName27 = TABDIM( pCubeName, 27);
sDimensionName28 = TABDIM( pCubeName, 28);
sDimensionName29 = TABDIM( pCubeName, 29);
sDimensionName30 = TABDIM( pCubeName, 30);
sDimensionName31 = TABDIM( pCubeName, 31);
sDimensionName32 = TABDIM( pCubeName, 32);

IF( CubeExists(sTargetCubeName) <> 0 );
	## Exit without error - the picklist cube already exists and shouldn't be overwritten.
	ProcessBreak;
ENDIF;

IF(sDimensionName32 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sDimensionName27, sDimensionName28, sDimensionName29, sDimensionName30, sDimensionName31, sDimensionName32, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName31 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sDimensionName27, sDimensionName28, sDimensionName29, sDimensionName30, sDimensionName31, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName30 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sDimensionName27, sDimensionName28, sDimensionName29, sDimensionName30, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName29 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sDimensionName27, sDimensionName28, sDimensionName29, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName28 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sDimensionName27, sDimensionName28, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName27 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sDimensionName27, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName26 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sDimensionName26, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName25 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sDimensionName25, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName24 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sDimensionName24, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName23 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sDimensionName23, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName22 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sDimensionName22, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName21 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sDimensionName21, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName20 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sDimensionName20, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName19 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sDimensionName19, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName18 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sDimensionName18, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName17 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sDimensionName17, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName16 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sDimensionName16, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName15 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sDimensionName15, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName14 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sDimensionName14, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName13 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sDimensionName13, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName12 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sDimensionName12, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName11 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sDimensionName11, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName10 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sDimensionName10, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName9 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sDimensionName9, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName8 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sDimensionName8, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName7 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sDimensionName7, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName6 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sDimensionName6, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName5 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sDimensionName5, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName4 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sDimensionName4, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName3 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sDimensionName3, sPicklistMeasureName);
	ProcessBreak;
ENDIF;

IF(sDimensionName2 @<> '');
	CubeCreate(sTargetCubeName, sDimensionName1, sDimensionName2, sPicklistMeasureName);
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
