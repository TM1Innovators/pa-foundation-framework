601,100
602,"SYS.Notification.Create.Default"
562,"NULL"
586,
585,
564,
565,"j=eDQ>Xy\PaWVHzMbZoB1snv:58:<5M8nxQ6wHg35qrqJ5`e<K:Hgv1AC3nS\wKMK1[yXI>R`ublo4\BC^05q9=6gOLbP4Y<9^jbAwH=WvZrWCU:PY7w9uRZkt9W]O2__?S0P3NOiJR`;2Zr4IR_ZzHC5?IOc\4EYX9_RO9DjF<CEf3g;nDihzGfP>;Yin`1Ffwrx`CA"
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
560,3
pSubject
pMessage
pLink
561,3
2
2
2
590,3
pSubject,""
pMessage,""
pLink,""
637,3
pSubject,""
pMessage,""
pLink,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,13

#****Begin: Generated Statements***
#****End: Generated Statements****

sCreate_Notification_Process_Name = 'SYS.Notification.Create';
sControl_Cube_Name = 'SYS Control';

sNotificationPath = CellGetS( sControl_Cube_Name, 'Current Environment', 'Responder Queue Path' );
sTempPath = CellGetS( sControl_Cube_Name, 'Current Environment', 'Temp Data Path' );

sEventName = 'Default Message';
sPropertyNameList = 'Link';
sPropertyValueList = pLink;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,12

#****Begin: Generated Statements***
#****End: Generated Statements****

ExecuteProcess( sCreate_Notification_Process_Name
	,'pEventName', sEventName
	,'pSubject', pSubject
	,'pMessage', pMessage
	,'pPropertyNameList', sPropertyNameList
	,'pPropertyValueList', sPropertyValueList
	,'pNotificationPath', sNotificationPath
	,'pTempPath', sTempPath );
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
