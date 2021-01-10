601,100
602,"}Drill_Dimension Control to Log Message"
562,"NULL"
586,
585,
564,
565,"fNGcIxa@DE9T8;fQ9ZYhyhv>hZi<J?=LF7ugCR2RrgyNhtsmjET0aPy5q2BUX>eMD43_A8:6k_13XO72oeSHWqSTyEdcZ:SScV>>EAvdi`29<qzp]TTsGMQK9g7s=pS5d9=4;m;Ay[PLdeAYZDo7dHqE=bl?D6m<oGdbe4g26PH`MnH^h\Q37cW0mo534QVfYim?lT?J"
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
560,4
cubename
BLD Build Profile
BLD Dimension List
BLD Dimension Control Measure
561,4
2
2
2
2
590,4
cubename,"BLD Dimension Control"
BLD Build Profile,"Default"
BLD Dimension List,"GBL Company"
BLD Dimension Control Measure,"Action"
637,4
cubename,""
BLD Build Profile,""
BLD Dimension List,""
BLD Dimension Control Measure,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,5

#****Begin: Generated Statements***
#****End: Generated Statements****


573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,32

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputFilteredText');
sText_Filter_Process_Name = 'Sub.Text.Filter_Chars';

sTarget_View_Name = GetProcessName() | ' - ' | TM1User();
ExecuteProcess( sText_Filter_Process_Name, 'pInputText', sTarget_View_Name );
sTarget_View_Name = OutputFilteredText;

ExecuteProcess('SYS.Cube.View.Create'
	,'pCubeName', 'ADM Log Message'
	,'pViewName', sTarget_View_Name
	,'pTitleDimensionList', 'GBL Date,ADM Log Source'
	,'pTitleSubsetList', 'Current Day,Leaf Elements'
	,'pColumnDimensionList', 'ADM Log Message Measure'
	,'pColumnSubsetList', 'Default'
	,'pRowDimensionList', 'ADM Log Entry,ADM Log Line'
	,'pRowSubsetList', 'All Descending,Default'
	,'pSuppressZero', 1, 'pOverwriteView', 1
);

sSelectedLogSourceElement = 'BLD.Model.Update.All.Dimensions';
sSelectedLogSourceIndex = SubsetElementGetIndex('ADM Log Source', 'Leaf Elements', sSelectedLogSourceElement);
ViewTitleElementSet('ADM Log Message', sTarget_View_Name, 'ADM Log Source', sSelectedLogSourceIndex);

# RETURNVIEWHANDLE( 'ADM Log Message', sTarget_View_Name );



RETURNVIEWHANDLE( 'ADM Log Message', sTarget_View_Name );
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
