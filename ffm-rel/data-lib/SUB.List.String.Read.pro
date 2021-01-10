601,100
602,"SUB.List.String.Read"
562,"NULL"
586,
585,
564,
565,"l5GeE=b1OvGmaRlxs005kD74EVhQNECuoOjycIeNEi2CyUBKN^eqwfwCWm9[5T[]b@MtD^wlMgfIvp?j;dUX@Yz:5MwO0IX54rK]HCCY0<GCls8`Qsw>[vaQj:cW2InnkP^7ZhROc=c\uQVGEdW<jQUEJ10Zdy9?OoU9u>h;kOAVtopE8TLa`E[vLVm1pS@EzSqgPFA2"
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
pItemList
pItemIndex
pItemSeparator
pItemQuoteCharacterStart
pItemQuoteCharacterEnd
pTrimWhitespace
pTrimQuoteCharacters
561,7
2
1
2
2
2
1
1
590,7
pItemList,"A,B,C,D"
pItemIndex,4
pItemSeparator,","
pItemQuoteCharacterStart,""""
pItemQuoteCharacterEnd,""
pTrimWhitespace,0
pTrimQuoteCharacters,0
637,7
pItemList,""
pItemIndex,""
pItemSeparator,""
pItemQuoteCharacterStart,""
pItemQuoteCharacterEnd,""
pTrimWhitespace,""
pTrimQuoteCharacters,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,97

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

StringGlobalVariable('OutputItem');
NumericGlobalVariable('OutputItemIndex');
NumericGlobalVariable('OutputItemLocation');

vItemSeparatorLength = LONG(pItemSeparator);
vItemQuoteCharacterStart = pItemQuoteCharacterStart;

IF(pItemQuoteCharacterEnd @= '');
	vItemQuoteCharacterEnd = vItemQuoteCharacterStart;
ELSE;
	vItemQuoteCharacterEnd = pItemQuoteCharacterEnd;
ENDIF;

vItemQuoteCharacterStartLength = LONG(vItemQuoteCharacterStart);
vItemQuoteCharacterEndLength = LONG(vItemQuoteCharacterEnd);

vCurrentItemList = pItemList;
vCurrentItem = '';
vCurrentSearchResult = 0;
vQuoteSearchResult = 0;
vCurrentItemIndex = 1;
vCurrentItemLocation = 0;
vCurrentItemIsQuoted = 0;

WHILE(vCurrentItemIndex <= pItemIndex & vCurrentItemList @<> '');

	vCurrentItemIsQuoted = 0;

	# Look for the next item separator
	vCurrentSearchResult = SCAN(pItemSeparator, vCurrentItemList);
	IF(vCurrentSearchResult <> 0);
		# If a separator is found, remove the text before the separator
		vCurrentItem = SUBST(vCurrentItemList, 1, vCurrentSearchResult - 1);
		vCurrentItemList = SUBST(vCurrentItemList, vCurrentSearchResult + vItemSeparatorLength, 99999);

		IF(vItemQuoteCharacterStart @<> '');
			# Check if the current string contains a quote character
			vQuoteSearchResult = SCAN(vItemQuoteCharacterStart, vCurrentItem);

			IF(vQuoteSearchResult <> 0);
				vCurrentItemIsQuoted = 1;

				# Check if the current string also includes the closing quote
				vTempItem = SUBST(vCurrentItem, vQuoteSearchResult + vItemQuoteCharacterStartLength, 99999);
				vClosingQuoteSearchResult = SCAN(vItemQuoteCharacterEnd, vTempItem);
				IF(vClosingQuoteSearchResult = 0);
					# Find the closing quote in the remaining list string
					vQuoteSearchResult = SCAN(vItemQuoteCharacterEnd, vCurrentItemList);
					# Add the remaining text up to and including the found quote character
					vCurrentItem = vCurrentItem | pItemSeparator | SUBST(vCurrentItemList, 1, vQuoteSearchResult - 1 + vItemQuoteCharacterEndLength);
					vCurrentItemList = SUBST(vCurrentItemList, vQuoteSearchResult + vItemQuoteCharacterEndLength, 99999);
					vCurrentSearchResult = SCAN(pItemSeparator, vCurrentItemList);
					vCurrentItemList = SUBST(vCurrentItemList, vCurrentSearchResult + vItemSeparatorLength, 99999);
				ENDIF;
			ENDIF;
		ENDIF;
	ELSE;
		vCurrentItem = vCurrentItemList;
		vCurrentItemList = '';
		vQuoteSearchResult = SCAN(vItemQuoteCharacterStart, vCurrentItem);
		IF(vQuoteSearchResult <> 0);
			vCurrentItemIsQuoted = 1;
		ENDIF;
	ENDIF;

	IF(vCurrentItemIndex <> pItemIndex);
		vCurrentItemLocation = vCurrentItemLocation + LONG(vCurrentItem) + vItemSeparatorLength;
	ENDIF;

	vCurrentItemIndex = vCurrentItemIndex + 1;
END;

IF((vCurrentItemIndex-1) = pItemIndex);

	IF(pTrimQuoteCharacters = 1 & vCurrentItemIsQuoted = 1);
		vCurrentItem = SUBST(vCurrentItem, vItemQuoteCharacterStartLength + 1, LONG(vCurrentItem) - (vItemQuoteCharacterStartLength + vItemQuoteCharacterEndLength));
	ENDIF;

	IF(pTrimWhitespace = 0);
		OutputItem = vCurrentItem;
	ELSE;
		OutputItem = TRIM(vCurrentItem);
	ENDIF;
ELSE;
	OutputItem = '';
ENDIF;

IF(vCurrentItemLocation = 0); vCurrentItemLocation = 1; ENDIF;

OutputItemIndex = vCurrentItemIndex - 1;
OutputItemLocation = vCurrentItemLocation;
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
