601,100
602,"}Drill_Dimension Control to Build Dimension"
562,"NULL"
586,"ADM Log Message"
585,"ADM Log Message"
564,
565,"vN?urqfIZlBePZ[gna8o<]a`M]=\hGTh4zy=_09M9I0KqSOE?oh9VTi7E9j2p=tM:J@UtJQYx_DdIToIR8KqOi`^[I8@=y[Xu9m6gz@C?Cwv1KOvXJA@J7eK?huOFssHlWLRXinai7srArygLr1`S[nR>AbWg_rxh@r[53>9E\:MR]]?e@X74Cp?C;5YTT\kSKG]cJP3"
559,1
928,1
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
570,Process Detail
571,
569,0
592,0
599,1000
560,4
cubename
pBuildProfile
pDimensionList
pMeasure
561,4
2
2
2
2
590,4
cubename,"BLD Dimension Control"
pBuildProfile,"Default"
pDimensionList,"GBL Company"
pMeasure,"Action"
637,4
cubename,""
pBuildProfile,""
pDimensionList,""
pMeasure,""
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

ExecuteProcess('BLD.Model.Update.All.Dimensions', 'pBuildProfile', pBuildProfile, 'pDimensionList', pDimensionList);
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
