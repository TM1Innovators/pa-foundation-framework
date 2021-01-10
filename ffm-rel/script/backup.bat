@echo off

set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~7,2%
set CUR_DD=%date:~4,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set DEL_AFTER=%1

if not defined DEL_AFTER (
    set DEL_AFTER=90
)

set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

set BackupFile=.\backup\backup_%SUBFILENAME%.zip

cd..
del %BackupFile%
".\script\7zip-x64\7za.exe" a -mx=1 -tzip "%BackupFile%" @.\script\backup_include.txt
forfiles -p "backup" -s -m backup_*.zip -d -%DEL_AFTER% -c "cmd /c del @path"
cd script