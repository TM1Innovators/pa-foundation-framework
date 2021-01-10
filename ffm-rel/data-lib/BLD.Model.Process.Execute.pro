601,100
602,"BLD.Model.Process.Execute"
562,"NULL"
586,
585,
564,
565,"jkF88>g_Xja;1s=NGBt<28=@D0bAaRn^JoRxfz;FufcsYfTw9S8rk8XRJ\`uNrns4SGxxViq^XE0vC_q0=Rw7m`FZL6kDs3uux<<nd]j:9PYgny1z_X4kRaGPI76U6=AgEyOBQvmNQV8vs_N3O=HYhx[\a4OJDUUM[KdNeBil?saX]Lf\4StZLOacIwE9U5LvC]?Ey_U"
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
560,18
pProcessName
pProcessParameterSet
pParameter01Name
pParameter01Value
pParameter02Name
pParameter02Value
pParameter03Name
pParameter03Value
pParameter04Name
pParameter04Value
pParameter05Name
pParameter05Value
pParameter06Name
pParameter06Value
pParameter07Name
pParameter07Value
pParameter08Name
pParameter08Value
561,18
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
2
590,18
pProcessName,""
pProcessParameterSet,""
pParameter01Name,""
pParameter01Value,""
pParameter02Name,""
pParameter02Value,""
pParameter03Name,""
pParameter03Value,""
pParameter04Name,""
pParameter04Value,""
pParameter05Name,""
pParameter05Value,""
pParameter06Name,""
pParameter06Value,""
pParameter07Name,""
pParameter07Value,""
pParameter08Name,""
pParameter08Value,""
637,18
pProcessName,""
pProcessParameterSet,""
pParameter01Name,""
pParameter01Value,""
pParameter02Name,""
pParameter02Value,""
pParameter03Name,""
pParameter03Value,""
pParameter04Name,""
pParameter04Value,""
pParameter05Name,""
pParameter05Value,""
pParameter06Name,""
pParameter06Value,""
pParameter07Name,""
pParameter07Value,""
pParameter08Name,""
pParameter08Value,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,598

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

sProcessParameterSourceCubeName = 'BLD Process Parameter Source';

## Create comma-separated lists for parameter names and parameter values, ignoring blank names

sParameterNameList = '';
sParameterValueList = '';

## Look at each process parameter and add to list if name is not blank

IF(pParameter01Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter01Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter01Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter02Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter02Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter02Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter03Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter03Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter03Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter04Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter04Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter04Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter05Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter05Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter05Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter06Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter06Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter06Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter07Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter07Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter07Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(pParameter08Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', pParameter08Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', pParameter08Value);

	sParameterValueList = OutputItemList;
ENDIF;

## If a Parameter Set is specified in the pProcessParameterSet parameter, read all parameter names and values from the BLD Process Parameter Source cube

IF( pProcessParameterSet @<> '' );
	sParameter01Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 01', 'Name');
	sParameter01Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 01', 'Value');
	sParameter02Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 02', 'Name');
	sParameter02Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 02', 'Value');
	sParameter03Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 03', 'Name');
	sParameter03Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 03', 'Value');
	sParameter04Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 04', 'Name');
	sParameter04Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 04', 'Value');
	sParameter05Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 05', 'Name');
	sParameter05Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 05', 'Value');
	sParameter06Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 06', 'Name');
	sParameter06Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 06', 'Value');
	sParameter07Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 07', 'Name');
	sParameter07Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 07', 'Value');
	sParameter08Name = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 08', 'Name');
	sParameter08Value = CellGetS( sProcessParameterSourceCubeName, pProcessName, pProcessParameterSet, 'Parameter 08', 'Value');
ENDIF;

## Look at each process parameter read from the cube and add to list if name is not blank

IF(sParameter01Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter01Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter01Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter02Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter02Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter02Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter03Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter03Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter03Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter04Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter04Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter04Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter05Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter05Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter05Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter06Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter06Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter06Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter07Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter07Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter07Value);

	sParameterValueList = OutputItemList;
ENDIF;

IF(sParameter08Name @<> '');
	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterNameList
		,'pItemIndex', 9999
		,'pNewItem', sParameter08Name);

	sParameterNameList = OutputItemList;

	ExecuteProcess( sList_Add_Process_Name
		,'pItemList', sParameterValueList
		,'pItemIndex', 9999
		,'pNewItem', sParameter08Value);

	sParameterValueList = OutputItemList;
ENDIF;

## Count how many parameters we ended up with

ExecuteProcess( sList_Count_Process_Name 
	,'pItemList', sParameterNameList );

nItemCount = OutputItemCount;

## Read each item from our name and value delimited lists and assign back to process variables in sequence

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 1 );
sParameter01Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 1 );
sParameter01Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 2 );
sParameter02Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 2 );
sParameter02Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 3 );
sParameter03Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 3 );
sParameter03Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 4 );
sParameter04Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 4 );
sParameter04Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 5 );
sParameter05Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 5 );
sParameter05Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 6 );
sParameter06Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 6 );
sParameter06Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 7 );
sParameter07Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 7 );
sParameter07Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 8 );
sParameter08Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 8 );
sParameter08Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 9 );
sParameter09Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 9 );
sParameter09Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 10 );
sParameter10Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 10 );
sParameter10Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 11 );
sParameter11Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 11 );
sParameter11Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 12 );
sParameter12Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 12 );
sParameter12Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 13 );
sParameter13Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 13 );
sParameter13Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 14 );
sParameter14Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 14 );
sParameter14Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 15 );
sParameter15Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 15 );
sParameter15Value = OutputItem;

ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterNameList, 'pItemIndex', 16 );
sParameter16Name = OutputItem;
ExecuteProcess( sList_Read_Process_Name, 'pItemList', sParameterValueList, 'pItemIndex', 16 );
sParameter16Value = OutputItem;

## Call ExecuteProcess with the right number of parameters

IF( nItemCount = 16 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value
		,sParameter11Name, sParameter11Value
		,sParameter12Name, sParameter12Value
		,sParameter13Name, sParameter13Value
		,sParameter14Name, sParameter14Value
		,sParameter15Name, sParameter15Value
		,sParameter16Name, sParameter16Value);
ENDIF;

IF( nItemCount = 15 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value
		,sParameter11Name, sParameter11Value
		,sParameter12Name, sParameter12Value
		,sParameter13Name, sParameter13Value
		,sParameter14Name, sParameter14Value
		,sParameter15Name, sParameter15Value);
ENDIF;

IF( nItemCount = 14 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value
		,sParameter11Name, sParameter11Value
		,sParameter12Name, sParameter12Value
		,sParameter13Name, sParameter13Value
		,sParameter14Name, sParameter14Value);
ENDIF;

IF( nItemCount = 13 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value
		,sParameter11Name, sParameter11Value
		,sParameter12Name, sParameter12Value
		,sParameter13Name, sParameter13Value);
ENDIF;

IF( nItemCount = 12 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value
		,sParameter11Name, sParameter11Value
		,sParameter12Name, sParameter12Value);
ENDIF;

IF( nItemCount = 11 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value
		,sParameter11Name, sParameter11Value);
ENDIF;

IF( nItemCount = 10 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value
		,sParameter10Name, sParameter10Value);
ENDIF;

IF( nItemCount = 9 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value
		,sParameter09Name, sParameter09Value);
ENDIF;

IF( nItemCount = 8 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value
		,sParameter08Name, sParameter08Value);
ENDIF;

IF( nItemCount = 7 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value
		,sParameter07Name, sParameter07Value);
ENDIF;

IF( nItemCount = 6 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value
		,sParameter06Name, sParameter06Value);
ENDIF;

IF( nItemCount = 5 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value
		,sParameter05Name, sParameter05Value);
ENDIF;

IF( nItemCount = 4 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value
		,sParameter04Name, sParameter04Value);
ENDIF;

IF( nItemCount = 3 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value
		,sParameter03Name, sParameter03Value);
ENDIF;

IF( nItemCount = 2 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value
		,sParameter02Name, sParameter02Value);
ENDIF;

IF( nItemCount = 1 );
	ExecuteProcess( pProcessName
		,sParameter01Name, sParameter01Value);
ENDIF;
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
