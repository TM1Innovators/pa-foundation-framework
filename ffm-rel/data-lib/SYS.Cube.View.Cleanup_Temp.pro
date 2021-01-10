601,100
602,"SYS.Cube.View.Cleanup_Temp"
562,"NULL"
586,
585,
564,
565,"b_as:`1=72BVk^V<G^c]e^79mMMCuh@ydG5fcNcGA^szs<D9R=[z2URruAZD8kAc2yPgz>:2EnbkR5P`c`ie5wZI5x2PsKheRxtYt<Env<22VO1=Y`D0Xaw8[:_Vd;Q^fsWOkfz\PA;I7hzRa`qf4R1riT_N=lW5g6xsaiaBgA>;_uh7?HU2zCGeU2l>`m8oT_@gS^Gh"
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
pCubeName
pViewName
pSubsetName
561,3
2
2
2
590,3
pCubeName,""
pViewName,""
pSubsetName,""
637,3
pCubeName,""
pViewName,""
pSubsetName,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,35

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputViewName');
StringGlobalVariable('OutputSubsetName');

sProcessName = GetProcessName();

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

sGetDimensionListProcessName = 'SUB.Cube.Dimension.Get_List';

vViewName = '';
IF(pViewName @<> '');
	vViewName = pViewName;
ELSE;
	vViewName = OutputViewName;
ENDIF;

vSubsetName = '';
IF(pSubsetName @<> '');
	vSubsetName = pSubsetName;
ELSE;
	vSubsetName = OutputSubsetName;
ENDIF;

ViewDestroy(pCubeName, vViewName);
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,25

#****Begin: Generated Statements***
#****End: Generated Statements****

StringGlobalVariable('OutputDimensionList');
ExecuteProcess(sGetDimensionListProcessName, 'pCubeName', pCubeName);
vDimensionList = OutputDimensionList;

NumericGlobalVariable('OutputItemCount');
ExecuteProcess(sListStringCountProcessName, 'pItemList', vDimensionList);
vDimensionCount = OutputItemCount;

vCurrentDimensionIndex = 1;
StringGlobalVariable('OutputItem');
WHILE(vCurrentDimensionIndex <= vDimensionCount);

	ExecuteProcess(sListStringReadProcessName, 'pItemList', vDimensionList, 'pItemIndex', vCurrentDimensionIndex, 'pTrimQuoteCharacters', 1);
	vCurrentDimensionName = OutputItem;

	IF(SubsetExists(vCurrentDimensionName, vSubsetName) = 1);
		SubsetDestroy(vCurrentDimensionName, vSubsetName);
	ENDIF;

	vCurrentDimensionIndex = vCurrentDimensionIndex + 1;
END;
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
