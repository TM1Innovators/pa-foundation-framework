601,100
602,"TST.Notification.Send_Email"
562,"NULL"
586,
585,
564,
565,"k[9C?\JRQfja_9ny8U^N^mh@SlABLhM7ZNryVjJ[ugxWdtJv\1imj]QVlW^;1Eypz<Yn3ZiOZT>5e3uguQY]dNY0mw?17X>DNZ?QWFA7lmN4:Vk5de\F^]kecZHIM\0ElF`2J8vfQkGJYVfh`;yXxlu>lT6Xd]fw:=43M6f>kx2CvD>Yateda8?jo^X0F?f2RFrzb8z1"
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
560,0
561,0
590,0
637,0
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,60

#****Begin: Generated Statements***
#****End: Generated Statements****

##
## Sending an email is easy. 
##
## Go to scripts/Reponder/Handlers and edit the file "Flow.Responder.Plugins.Default.dll.config" 
## The "EmailMappings" section allows you to configure message types (events), HTML Templates and Recipients.
##
## To begin, you'll need to define at least one Event Type.
## Each Event Type can have a different Recipient and HTML Template, for formatting.
## HTML templates provide the formatting of the email with their own arbitrary properties.
## 
## By default, there are two types of messages provided, "Default Message" and "TM1 Process Error".
## These may be anough for your needs, but if you need different message types, you can add them 
## in the EmailMappings section of the "Flow.Responder.Plugins.Default.dll.config" file
##
## The provided HTML Templates can be found in the "script\Responder\Templates" folder. 
## You can add your own templates here if you know HTML.
## A template file is just a valid HTML document with various parameters defined inside {% and %}
##
## For example, if you wanted to support a parameter called "Message" you would include
## a token "{%Message%}" in your template. When the SYS.Notification.Create process if called,
##
## The {%Message%} token will be replaced with the text passed to the "Message" parameter 
## Using the pPropertyNameList and pPropertyValueList parameters.
## To simplify this, you might want to create a wrapper TI for each new Event Type.
##
## Make sure you provide the details of a valid SMTP email server in the "appSettings" section.
##


sSend_Email_Error_Process_Name = 'SYS.Notification.Create.Error';
sSend_Email_Default_Process_Name = 'SYS.Notification.Create.Default';
sProcess_Queue_Process_Name = 'SYS.Notification.Process_Queue';

## Define the HTML tag for line breaks '<br/>', escaping illegal characters with valid XML
sLineBreak = '&lt;br/&gt;';

sMessageText = 'This is the message body, but since there was no error, there''s really not much to say. '
		| sLineBreak | sLineBreak 
		| 'Except be good to each other. You should always be good to each other.';

ExecuteProcess( sSend_Email_Error_Process_Name 
	,'pSubject', 'Test Error Notification Message'
	,'pHeaderText', 'There was no error, this is just a test'
	,'pMessage', sMessageText
	,'pButtonLink', 'https://google.com'
	,'pMoreLink', 'https://bing.com' );

ExecuteProcess( sSend_Email_Default_Process_Name 
	,'pSubject', 'Test Default Notification Message'
	,'pMessage', sMessageText
	,'pLink', 'https://google.com' );

## The Process Queue process is usually a scheduled chore, but in case 
## you have it turned off, you can call it manually as below:

# ExecuteProcess( sProcess_Queue_Process_Name );
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
