601,100
602,"SUB.Cube.Dimension.Get_List"
562,"NULL"
586,
585,
564,
565,"n5J\LyqEuQ2Qu:abokzLD4KFamZaiP0cx_bykAH]kazKqcAjqkg0EeqjkI4mE1tP_tY9C_`8gy^a;<X=Qw0e61_\MKGmt7F=hhQLKU<b9wt=\7RSHlPRYhdIV4y:e9;Vz48;][12<L[CE5:=c=j3@0CGVfLIlOa:Ig6a=\XifTGnzEsWiTTGnjF;gzK>l;Y[H`t2nhSA"
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
pItemSeparator
pItemQuoteCharacter
561,3
2
2
2
590,3
pCubeName,""
pItemSeparator,","
pItemQuoteCharacter,""""
637,3
pCubeName,""
pItemSeparator,""
pItemQuoteCharacter,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,80

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputDimensionList');

StringGlobalVariable('OutputItem');
StringGlobalVariable('OutputItemList');

sProcessName = GetProcessName();

sListStringAddProcessName = 'SUB.List.String.Add';
sListStringCountProcessName = 'SUB.List.String.Count';
sListStringFindProcessName = 'SUB.List.String.Find';
sListStringReadProcessName = 'SUB.List.String.Read';
sListStringRemoveProcessName = 'SUB.List.String.Remove';
sListStringReplaceProcessName = 'SUB.List.String.Replace';

vDimName1 = TabDim(pCubeName, 1);
vDimName2 = TabDim(pCubeName, 2);
vDimName3 = TabDim(pCubeName, 3);
vDimName4 = TabDim(pCubeName, 4);
vDimName5 = TabDim(pCubeName, 5);
vDimName6 = TabDim(pCubeName, 6);
vDimName7 = TabDim(pCubeName, 7);
vDimName8 = TabDim(pCubeName, 8);
vDimName9 = TabDim(pCubeName, 9);
vDimName10 = TabDim(pCubeName, 10);
vDimName11 = TabDim(pCubeName, 11);
vDimName12 = TabDim(pCubeName, 12);
vDimName13 = TabDim(pCubeName, 13);
vDimName14 = TabDim(pCubeName, 14);
vDimName15 = TabDim(pCubeName, 15);
vDimName16 = TabDim(pCubeName, 16);
vDimName17 = TabDim(pCubeName, 17);
vDimName18 = TabDim(pCubeName, 18);
vDimName19 = TabDim(pCubeName, 19);
vDimName20 = TabDim(pCubeName, 20);
vDimName21 = TabDim(pCubeName, 21);
vDimName22 = TabDim(pCubeName, 22);
vDimName23 = TabDim(pCubeName, 23);
vDimName24 = TabDim(pCubeName, 24);
vDimName25 = TabDim(pCubeName, 25);
vDimName26 = TabDim(pCubeName, 26);
vDimName27 = TabDim(pCubeName, 27);
vDimName28 = TabDim(pCubeName, 28);
vDimName29 = TabDim(pCubeName, 29);
vDimName30 = TabDim(pCubeName, 30);
vDimName31 = TabDim(pCubeName, 31);
vDimName32 = TabDim(pCubeName, 32);
vDimName33 = TabDim(pCubeName, 33);

IF(vDimName33 @= '');

	vDimensionList = pItemQuoteCharacter | vDimName1 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName2 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName3 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName4 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName5 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName6 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName7 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName8 | pItemQuoteCharacter | pItemSeparator | 
		pItemQuoteCharacter | vDimName9 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName10 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName11 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName12 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName13 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName14 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName15 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName16 | pItemQuoteCharacter | pItemSeparator | 
		pItemQuoteCharacter | vDimName17 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName18 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName19 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName20 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName21 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName22 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName23 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName24 | pItemQuoteCharacter | pItemSeparator | 
		pItemQuoteCharacter | vDimName25 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName26 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName27 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName28 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName29 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName30 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName31 | pItemQuoteCharacter | pItemSeparator | pItemQuoteCharacter | vDimName32 | pItemQuoteCharacter;

ENDIF;

vCurrentItemIndex = 32;

WHILE(vCurrentItemIndex > 0);
	ExecuteProcess(sListStringReadProcessName, 'pItemList', vDimensionList, 'pItemIndex', vCurrentItemIndex, 'pItemSeparator', pItemSeparator, 'pItemQuoteCharacterStart', pItemQuoteCharacter);
	vCurrentItem = OutputItem;

	IF(vCurrentItem @= pItemQuoteCharacter | pItemQuoteCharacter);
		ExecuteProcess(sListStringRemoveProcessName, 'pItemList', vDimensionList, 'pItemIndex', vCurrentItemIndex);
		vDimensionList = OutputItemList;
	ELSE;
		vCurrentItemIndex = 0;
	ENDIF;

	vCurrentItemIndex = vCurrentItemIndex - 1;
END;

OutputDimensionList = vDimensionList;
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
