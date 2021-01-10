601,100
602,"SYS.Dimension.Hierarchy.Flatten"
562,"NULL"
586,
585,
564,
565,"liKrrWbMPS^taJL_ku;htXR_5c[:A\ZeJTt5K^sL4Bkw6qs8aT_yul3acoP1d6g<etHB_UidKslcuRxenbyksNCn1UZ5WC]3r?:p`d8VFDtIRUif^LCt_ydQ[EUlZoALEL0q:?P^8tH]iUprIeu=B8G>1JWg6cEnF3@:oZI8uw0s1`fQim\f<IdZt>R_tUwQWoisxbFN"
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
560,2
pDimensionName
pHierarchyName
561,2
2
2
590,2
pDimensionName,""
pHierarchyName,""
637,2
pDimensionName,""
pHierarchyName,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,27

#****Begin: Generated Statements***
#****End: Generated Statements****

sDimensionName = pDimensionName;
sHierarchyName = pHierarchyName;

IF(sHierarchyName @= '');
	sHierarchyName = sDimensionName;
ENDIF;

nElement_Count = ElementCount( sDimensionName, sHierarchyName );
nElement_Index = 1;

WHILE( nElement_Index <= nElement_Count );
	sElement_Name = ElementName( sDimensionName, sHierarchyName, nElement_Index );

	nChild_Count = ElementComponentCount( sDimensionName, sHierarchyName, sElement_Name );
	nChild_Index = 1;

	WHILE( nChild_Index <= nChild_Count );
		sChild_Name = ElementComponent( sDimensionName , sHierarchyName, sElement_Name, 1);
		HierarchyElementComponentDelete( sDimensionName, sHierarchyName, sElement_Name, sChild_Name );
		nChild_Index = nChild_Index +1;
	END;
	nElement_Index = nElement_Index + 1;
END;
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
