601,100
602,"SYS.Notification.Create"
562,"NULL"
586,
585,
564,
565,"lqP5mxpfV?rPaRwtL3FvX73]]DRPQD24;hiul4hWmt\n`fCLvd3_vHhmH@z[?K?;5ZMHtv7j?ehL[kF>aY?O3eh[W@OEmkFzOmYCBE@BUr5Xl^Z5XSgF5i5c=wR56_ra0VVANPtWOO^l>7PZMKc3lZhls0oOwfL:PJadiBqG5H^DY?Y?UjBxL=Gx=2pAe9IKOTX]ym86"
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
560,7
pEventName
pSubject
pMessage
pPropertyNameList
pPropertyValueList
pNotificationPath
pTempPath
561,7
2
2
2
2
2
2
2
590,7
pEventName,""
pSubject,""
pMessage,""
pPropertyNameList,""
pPropertyValueList,""
pNotificationPath,""
pTempPath,""
637,7
pEventName,""
pSubject,""
pMessage,""
pPropertyNameList,""
pPropertyValueList,""
pNotificationPath,""
pTempPath,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,21

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemCount');
StringGlobalVariable('OutputTempName');

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

sUniqueStringCreateProcessName = 'SUB.Text.String.Create_Unique';

ExecuteProcess( sUniqueStringCreateProcessName, 'pPrefix', '', 'pSuffix', '' );
sTempFileName = OutputTempName;

sText = '';
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,44

#****Begin: Generated Statements***
#****End: Generated Statements****

sTimeStamp = NumberToString( Now );
sDate = DATE(Now, 1);
sTime = TIME();

sCR = CHAR(13);

sText = sText | '<Notification>' | sCR
	| '	<property name="NotificationHandlerList" value="TemplatedEmailNotifier" />' | sCR
	| '	<property name="EventID" value="' | pEventName | '" />' | sCR
	| '	<property name="Subject" value="' | pSubject | '" />' | sCR
	| '	<property name="Message" value="' | pMessage | '" />' | sCR;


ExecuteProcess( sListStringCountProcessName, 'pItemList', pPropertyNameList );
nPropertyCount = OutputItemCount;

nPropertyIndex = 1;

WHILE( nPropertyIndex <= nPropertyCount );

	ExecuteProcess( sListStringReadProcessName, 'pItemList', pPropertyNameList, 'pItemIndex', nPropertyIndex, 'pTrimQuoteCharacters', 1 );
	sCurrentPropertyName = OutputItem;

	ExecuteProcess( sListStringReadProcessName, 'pItemList', pPropertyValueList, 'pItemIndex', nPropertyIndex, 'pTrimQuoteCharacters', 1 );
	sCurrentPropertyValue = OutputItem;

	sText = sText | EXPAND('	<property name="%sCurrentPropertyName%" value="%sCurrentPropertyValue%" />') | sCR;

	nPropertyIndex = nPropertyIndex + 1;
END;


sText = sText | '</Notification>';

DatasourceASCIIQuoteCharacter = '';

sTempFilePath = pTempPath | '\' | sTempFileName | '.xml';

ASCIIOUTPUT(sTempFilePath, sText);
ExecuteCommand('xcopy "' | sTempFilePath | '" "' | pNotificationPath | '"', 0);
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
