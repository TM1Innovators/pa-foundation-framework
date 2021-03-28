601,100
602,"Cub.Data Load SYS Calendar OBL"
562,"VIEW"
586,"SYS Calendar"
585,"SYS Calendar"
564,
565,"ycH]S\bRLbjuyjIjVemT:nK?iaxmR:>8o;`K88rZLyN]islL2z\>ABrT7[E@gea6zUK@Yfm<JDTnXjYtQ12Z<LsKoA5JWLtJXC]JSTmuYTThyvX7v>M=iJCXyJuwIA3txW=VkbQ8?N63Qa=T?Quy^r7D@=luRfIxlph6m7Xw`v\]R;CT_?4Rj_=RrJ=Yb>Y@<:[M0=aU"
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
570,zTI - OBL Source
571,Leaf Elements Dates
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,7
vDate
vLocation
vMeasure
vValue
NVALUE
SVALUE
VALUE_IS_STRING
578,7
2
2
2
1
1
2
1
579,7
1
2
3
4
0
0
0
580,7
0
0
0
0
0
0
0
581,7
0
0
0
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=33ColType=827
603,0
572,11

#****Begin: Generated Statements***
#****End: Generated Statements****

sTarget_Cube_Name = 'SYS Calendar';
sTarget_Measure_Name = sTarget_Cube_Name | ' Measure';

CubeSetLogChanges( sTarget_Cube_Name, 0);



573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,14

#****Begin: Generated Statements***
#****End: Generated Statements****



sCurrent_Year_Element = SUBST( DimensionElementPrincipalName( 'GBL Date', vDate ), 12, 4);
sNext_Year_Element = ATTRS( 'GBL Year', sCurrent_Year_Element, 'Next Year' );
sOBL_Element_Name = 'OBL-' | sNext_Year_Element;

IF( DIMIX( 'GBL Date', sOBL_Element_Name ) <> 0 );
	vValue = CellGetN( sTarget_Cube_Name, vDate, vLocation, vMeasure );
	CellPutN( vValue, sTarget_Cube_Name, sOBL_Element_Name, vLocation, vMeasure );
ENDIF;
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
