601,100
602,"SYS.Notification.Create.Error"
562,"NULL"
586,
585,
564,
565,"u<SqCSjj>?rfV3IDs4=q0a69H6dV]SU2^8sH]oczrnyP=9bp1q3]l]3I4FwH1PH1qywlR5C1qWaGGjK8`uoM\3n2O^KmWUNP9dFC5beH`VHZVrxBw0P8=dC\eSw1iYBU==[mpDiEyiJwEGOyN7u]tGA5XdQiOhur9PE<D`bX3t8M2\A4uSBGHtuuFU1?ZLiRaQt95>jH"
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
560,5
pSubject
pHeaderText
pMessage
pButtonLink
pMoreLink
561,5
2
2
2
2
2
590,5
pSubject,""
pHeaderText,""
pMessage,""
pButtonLink,""
pMoreLink,""
637,5
pSubject,""
pHeaderText,""
pMessage,""
pButtonLink,""
pMoreLink,""
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

sEventName = 'TM1 Process Error';
sPropertyNameList = 'HeaderText,ButtonLink,MoreLink';
sPropertyValueList = pHeaderText | ',' | pButtonLink | ',' | pMoreLink;
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
