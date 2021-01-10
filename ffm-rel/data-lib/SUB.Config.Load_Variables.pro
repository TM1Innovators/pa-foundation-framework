601,100
602,"SUB.Config.Load_Variables"
562,"SUBSET"
586,"SYS Control Measure"
585,"SYS Control Measure"
564,
565,"u62^j_O:3l4>U]LboBSIIa?K0z[eCJGJ`]12?TygPXm`:hmy`3UkOS>YRtM[iw3SWN^sv]3cp5EUiQKWe8U[crk5RTwuj8nWwx2wo[tATl4?4;w;pCSw72>RyJN0H`t]>asaTWpeO[<M[l3f4Dwx1l=?aDAPYHp6?s1C`7x;=m50jL;FE0=ajz\C3q?ezf:aKuFVTFj:"
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
571,Global Variables
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,1
V1
578,1
2
579,1
1
580,1
0
581,1
0
582,1
VarType=32ColType=827
603,0
572,77

#****Begin: Generated Statements***
#****End: Generated Statements****

sControl_Cube_Name = 'SYS Control';
sControl_Measure_Dimension_Name = sControl_Cube_Name | ' Measure';

StringGlobalVariable('sGlobal_V1');
StringGlobalVariable('sGlobal_V2');
StringGlobalVariable('sGlobal_V3');
StringGlobalVariable('sGlobal_V4');
StringGlobalVariable('sGlobal_V5');
StringGlobalVariable('sGlobal_V6');
StringGlobalVariable('sGlobal_V7');
StringGlobalVariable('sGlobal_V8');
StringGlobalVariable('sGlobal_V9');
StringGlobalVariable('sGlobal_V10');
StringGlobalVariable('sGlobal_V11');
StringGlobalVariable('sGlobal_V12');
StringGlobalVariable('sGlobal_V13');
StringGlobalVariable('sGlobal_V14');
StringGlobalVariable('sGlobal_V15');
StringGlobalVariable('sGlobal_V16');
StringGlobalVariable('sGlobal_V17');
StringGlobalVariable('sGlobal_V18');
StringGlobalVariable('sGlobal_V19');
StringGlobalVariable('sGlobal_V20');
StringGlobalVariable('sGlobal_V21');
StringGlobalVariable('sGlobal_V22');
StringGlobalVariable('sGlobal_V23');
StringGlobalVariable('sGlobal_V24');

StringGlobalVariable('sGlobal_Current_Environment');

StringGlobalVariable('sGlobal_Current_Day');
StringGlobalVariable('sGlobal_Current_Month');
StringGlobalVariable('sGlobal_Current_Year');
StringGlobalVariable('sGlobal_Current_Date');
StringGlobalVariable('sGlobal_Current_CAL_Year');
StringGlobalVariable('sGlobal_Current_CAL_Half');
StringGlobalVariable('sGlobal_Current_CAL_Quarter');
StringGlobalVariable('sGlobal_Current_CAL_Month');
StringGlobalVariable('sGlobal_Current_CAL_Month_Name_Short');
StringGlobalVariable('sGlobal_Current_CAL_Month_Name_Long');
StringGlobalVariable('sGlobal_Current_CAL_Day');
StringGlobalVariable('sGlobal_Current_CAL_Day_Of_Year');
StringGlobalVariable('sGlobal_Current_CAL_Day_Name_Short');
StringGlobalVariable('sGlobal_Current_CAL_Day_Name_Long');
StringGlobalVariable('sGlobal_Current_FIN_Year');
StringGlobalVariable('sGlobal_Current_FIN_Half');
StringGlobalVariable('sGlobal_Current_FIN_Quarter');
StringGlobalVariable('sGlobal_Current_FIN_Month');
StringGlobalVariable('sGlobal_Current_FIN_Day');
StringGlobalVariable('sGlobal_Current_FIN_Day_Of_Year');

sGlobal_Current_Environment = CellGetS( sControl_Cube_Name, 'Current Environment', 'Server Details');

sGlobal_Current_Day = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current Day');
sGlobal_Current_Month = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current Month');
sGlobal_Current_Year = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current Year');
sGlobal_Current_Date = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current Date');
sGlobal_Current_CAL_Year = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Year');
sGlobal_Current_CAL_Half = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Half');
sGlobal_Current_CAL_Quarter = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Quarter');
sGlobal_Current_CAL_Month = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Month');
sGlobal_Current_CAL_Month_Name_Short = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Month Name Short');
sGlobal_Current_CAL_Month_Name_Long = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Month Name Long');
sGlobal_Current_CAL_Day = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Day');
sGlobal_Current_CAL_Day_Of_Year = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Day Of Year');
sGlobal_Current_CAL_Day_Name_Short = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Day Name Short');
sGlobal_Current_CAL_Day_Name_Long = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current CAL Day Name Long');
sGlobal_Current_FIN_Year = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current FIN Year');
sGlobal_Current_FIN_Half = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current FIN Half');
sGlobal_Current_FIN_Quarter = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current FIN Quarter');
sGlobal_Current_FIN_Month = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current FIN Month');
sGlobal_Current_FIN_Day = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current FIN Day');
sGlobal_Current_FIN_Day_Of_Year = CellGetS( sControl_Cube_Name, 'Current Environment', 'Current FIN Day Of Year');
573,5

#****Begin: Generated Statements***
#****End: Generated Statements****


574,30

#****Begin: Generated Statements***
#****End: Generated Statements****

sGlobal_Variable_ID = ATTRS(sControl_Measure_Dimension_Name, V1, 'Global Variable ID');

sGlobal_V1 = IF( sGlobal_Variable_ID @= 'sGlobal_V1', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V1);
sGlobal_V2 = IF( sGlobal_Variable_ID @= 'sGlobal_V2', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V2);
sGlobal_V3 = IF( sGlobal_Variable_ID @= 'sGlobal_V3', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V3);
sGlobal_V4 = IF( sGlobal_Variable_ID @= 'sGlobal_V4', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V4);
sGlobal_V5 = IF( sGlobal_Variable_ID @= 'sGlobal_V5', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V5);
sGlobal_V6 = IF( sGlobal_Variable_ID @= 'sGlobal_V6', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V6);
sGlobal_V7 = IF( sGlobal_Variable_ID @= 'sGlobal_V7', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V7);
sGlobal_V8 = IF( sGlobal_Variable_ID @= 'sGlobal_V8', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V8);
sGlobal_V9 = IF( sGlobal_Variable_ID @= 'sGlobal_V9', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V9);
sGlobal_V10 = IF( sGlobal_Variable_ID @= 'sGlobal_V10', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V10);
sGlobal_V11 = IF( sGlobal_Variable_ID @= 'sGlobal_V11', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V11);
sGlobal_V12 = IF( sGlobal_Variable_ID @= 'sGlobal_V12', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V12);
sGlobal_V13 = IF( sGlobal_Variable_ID @= 'sGlobal_V13', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V13);
sGlobal_V14 = IF( sGlobal_Variable_ID @= 'sGlobal_V14', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V14);
sGlobal_V15 = IF( sGlobal_Variable_ID @= 'sGlobal_V15', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V15);
sGlobal_V16 = IF( sGlobal_Variable_ID @= 'sGlobal_V16', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V16);
sGlobal_V17 = IF( sGlobal_Variable_ID @= 'sGlobal_V17', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V17);
sGlobal_V18 = IF( sGlobal_Variable_ID @= 'sGlobal_V18', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V18);
sGlobal_V19 = IF( sGlobal_Variable_ID @= 'sGlobal_V19', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V19);
sGlobal_V20 = IF( sGlobal_Variable_ID @= 'sGlobal_V20', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V20);
sGlobal_V21 = IF( sGlobal_Variable_ID @= 'sGlobal_V21', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V21);
sGlobal_V22 = IF( sGlobal_Variable_ID @= 'sGlobal_V22', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V22);
sGlobal_V23 = IF( sGlobal_Variable_ID @= 'sGlobal_V23', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V23);
sGlobal_V24 = IF( sGlobal_Variable_ID @= 'sGlobal_V24', CellGetS( sControl_Cube_Name, 'Current Environment', V1), sGlobal_V24);
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
