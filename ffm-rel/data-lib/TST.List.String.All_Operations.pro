601,100
602,"TST.List.String.All_Operations"
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
560,2
pItemList
pOutputFolder
561,2
2
2
590,2
pItemList,"A,B,C,D,E,F"
pOutputFolder,"..\temp"
637,2
pItemList,""
pOutputFolder,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,86

#****Begin: Generated Statements***
#****End: Generated Statements****

DatasourceASCIIQuoteCharacter = '';

NumericGlobalVariable('OutputItemCount');
StringGlobalVariable('OutputItem');
StringGlobalVariable('OutputItemList');
NumericGlobalVariable('OutputItemIndex');
NumericGlobalVariable('OutputItemLocation');
NumericGlobalVariable('OutputSearchItemIndex');

sList_Add_Process_Name = 'SUB.List.String.Add';
sList_Count_Process_Name = 'SUB.List.String.Count';
sList_Find_Process_Name = 'SUB.List.String.Find';
sList_Read_Process_Name = 'SUB.List.String.Read';
sList_Remove_Process_Name = 'SUB.List.String.Remove';
sList_Replace_Process_Name = 'SUB.List.String.Replace';

sOutput_File = pOutputFolder | '\' | GetProcessName() | '_Output.txt';

ASCIIOUTPUT(sOutput_File, 'Working on list [' | pItemList | ']');

ExecuteProcess(sList_Count_Process_Name, 'pItemList', pItemList);

nItem_Count = OutputItemCount;

ASCIIOUTPUT( sOutput_File, 'Item count: ' | TRIM(STR(nItem_Count, 4, 0)));

ExecuteProcess(sList_Add_Process_Name, 'pItemList', pItemList, 'pItemIndex', 4, 'pNewItem', 'Added');
sCurrent_Item_List = OutputItemList;

ASCIIOUTPUT( sOutput_File, 'Item added at index 4: [' | sCurrent_Item_List | ']');

ExecuteProcess(sList_Remove_Process_Name, 'pItemList', sCurrent_Item_List, 'pItemIndex', 2);
sCurrent_Item_List = OutputItemList;

ASCIIOUTPUT( sOutput_File, 'Item removed at index 2: [' | sCurrent_Item_List | ']');

ExecuteProcess(sList_Replace_Process_Name, 'pItemList', sCurrent_Item_List, 'pItemIndex', 5, 'pNewItem', 'Replaced');
sCurrent_Item_List = OutputItemList;

ASCIIOUTPUT( sOutput_File, 'Item replaced at index 5: [' | sCUrrent_Item_List | ']');

ASCIIOUTPUT( sOutput_File, 'Finding index of item "F"...');

ExecuteProcess(sList_Find_Process_Name, 'pItemList', sCurrent_Item_List, 'pSearchItem', 'F');
nCurrent_Search_Item_Index = OutputSearchItemIndex;

ASCIIOUTPUT( sOutput_File, 'Index of search item: ' | TRIM(STR(nCurrent_Search_Item_Index, 15, 0)) );

ASCIIOUTPUT( sOutput_File, 'Finding index of item "G"...');

ExecuteProcess( sList_Find_Process_Name, 'pItemList', sCurrent_Item_List, 'pSearchItem', 'G');
nCurrent_Search_Item_Index = OutputSearchItemIndex;

ASCIIOUTPUT( sOutput_File, 'Index of search item: ' | TRIM(STR(nCurrent_Search_Item_Index, 15, 0)) );

ASCIIOUTPUT( sOutput_File, 'Listing all current items...');

nCurrent_Item_Index = 1;
sCurrent_Item = '';

WHILE(nCurrent_Item_Index <= nItem_Count);
	ExecuteProcess( sList_Read_Process_Name, 'pItemList', sCurrent_Item_List, 'pItemIndex', nCurrent_Item_Index);
	sCurrent_Item = OutputItem;

	ASCIIOUTPUT( sOutput_File, '[' | TRIM(STR( nCurrent_Item_Index, 4, 0)) | ']' | ' = ' | sCurrent_Item);

	nCurrent_Item_Index = nCurrent_Item_Index + 1;
END;

ASCIIOUTPUT( sOutput_File, 'Listing all original items...');

nCurrent_Item_Index = 1;
sCurrent_Item = '';

WHILE( nCurrent_Item_Index <= nItem_Count);
	ExecuteProcess( sList_Read_Process_Name, 'pItemList', pItemList, 'pItemIndex', nCurrent_Item_Index);
	sCurrent_Item = OutputItem;

	ASCIIOUTPUT( sOutput_File, '[' | TRIM(STR( nCurrent_Item_Index, 4, 0)) | ']' | ' = ' | sCurrent_Item);

	nCurrent_Item_Index = nCurrent_Item_Index + 1;
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
