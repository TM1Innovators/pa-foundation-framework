601,100
602,"}Drill_Cube Control to Log Message"
562,"NULL"
586,
585,
564,
565,"wpqxdYegeSg`G]<\s<JQ?0@ayGL8KFhKHz26lGRyR59NyMwfAMavA4s=cOT700C5g3URsj@G_9wliyDvAEjMUF[oTuehA8=I1\Cp7Imxqem>U2zGN@`]DcQ2p[I1NAq7JaWa8kT62M9SC\_B`ugLj5cVry6T6\]ZrW]3\zkM>r9p<yVua=V4mU4Lr=pVRXwv6WriYu<B"
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
BLD Cube List
BLD Cube Control Measure
561,4
2
2
2
2
590,4
cubename,"BLD Cube Control"
BLD Build Profile,"Default"
BLD Cube List,"REV Sales Import"
BLD Cube Control Measure,"Action"
637,4
cubename,""
BLD Build Profile,""
BLD Cube List,""
BLD Cube Control Measure,""
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
575,31

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

sSelectedLogSourceElement = 'BLD.Model.Update.All.Cubes';
sSelectedLogSourceIndex = SubsetElementGetIndex('ADM Log Source', 'Leaf Elements', sSelectedLogSourceElement);
ViewTitleElementSet('ADM Log Message', sTarget_View_Name, 'ADM Log Source', sSelectedLogSourceIndex);

# RETURNVIEWHANDLE('ADM Log Message', sTarget_View_Name);


RETURNVIEWHANDLE('ADM Log Message', sTarget_View_Name);
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
