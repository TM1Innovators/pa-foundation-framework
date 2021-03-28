601,100
602,"Cub.Data Load SYS Calendar Weekends"
562,"SUBSET"
586,"GBL Date"
585,"GBL Date"
564,
565,"zztFikncj^R=sinc2Z@_mpVqKzayhxEs<gla4j3LzqUJh]_sE2a`^_Zocb05zF0h:[;>fUJ7RfYQr;I`IHm@04j;[Y>2e:kLn]A8xWRh@niqGjait\y8JRF<aAs]zjYjKX4bBBltb9xzC7vxR;`_Poylug30THqASUXTCNT?=m2^BWNBe_H:J\ln`r\P50JCxKaWY436"
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
571,Leaf Elements Dates
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,1
vDate
578,1
2
579,1
1
580,1
0
581,1
0
582,2
VarType=32ColType=827
VarName=vIsWeekendVarType=33ColType=827VarFormula=sDayName = UPPER( ATTRS( 'GBL Date', vDate, 'CAL Day Name Short' ));:vIsWeekend = IF( sDayName @= 'SAT' % sDayName @= 'SUN', 1, 0);:VarFormulaDestination=DATA
603,0
572,13

#****Begin: Generated Statements***
#****End: Generated Statements****

sTarget_Cube_Name = 'SYS Calendar';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';

CubeSetLogChanges( sTarget_Cube_Name, 0);

sLocation_Dimension_Name = 'SYS Calendar Location';
sLocation_Subset_Name = 'Leaf Elements';
nLocation_Subset_Count = SubsetGetSize( sLocation_Dimension_Name, sLocation_Subset_Name );

573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,15

#****Begin: Generated Statements***
sDayName = UPPER( ATTRS( 'GBL Date', vDate, 'CAL Day Name Short' ));
vIsWeekend = IF( sDayName @= 'SAT' % sDayName @= 'SUN', 1, 0);
#****End: Generated Statements****



nCurrent_Location_Index = 1;
WHILE( nCurrent_Location_Index <= nLocation_Subset_Count );
	sLocation_Element_Name = SubsetGetElementName( sLocation_Dimension_Name, sLocation_Subset_Name, nCurrent_Location_Index );
	CellPutN( 1, sTarget_Cube_Name, vDate, sLocation_Element_Name, 'Calendar Day' );
	CellPutN( vIsWeekend, sTarget_Cube_Name, vDate, sLocation_Element_Name, 'Weekend' );
	nCurrent_Location_Index = nCurrent_Location_Index + 1;
END;
575,5

#****Begin: Generated Statements***
#****End: Generated Statements****

CubeSetLogChanges( sTarget_Cube_Name, 1);
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
