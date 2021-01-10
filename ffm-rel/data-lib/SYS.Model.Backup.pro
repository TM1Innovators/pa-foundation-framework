601,100
602,"SYS.Model.Backup"
562,"NULL"
586,
585,
564,
565,"zsIYAAL>[XNrQnP>]KYGGeU6]RaiR>hfbfdo^m4KQvwI\QJhL:76mpmq0qThZ6efI==iJV;Z<Zebielq^w<1H4IH<`XJYa_TZzD9wGy:OpOF@N4GesX>q\bkGN?tM0qxq_lftJ9mJa0M2;mw99Qq5egqtLcW_hXx12stBnKpElD=E982l1Ze1htZVW]7<>5_PRd7giw="
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
pDeleteAfterDays
561,1
2
590,1
pDeleteAfterDays,""
637,1
pDeleteAfterDays,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,3

#****Begin: Generated Statements***
#****End: Generated Statements****
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,17

#****Begin: Generated Statements***
#****End: Generated Statements****

sDelete_After_Days = pDeleteAfterDays;

## TODO: Read default from SYS Control cube
IF( sDelete_After_Days @= '');
	sDelete_After_Days = CellGetS( 'SYS Control', 'Current Environment', 'Delete Backups After (Days)');
ENDIF;

ExecuteCommand(
	'..\script\backup.bat'
	   | IF( sDelete_After_Days @<> ''
		,' ' | sDelete_After_Days
		, '')
	, 0);
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
