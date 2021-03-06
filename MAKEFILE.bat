@ECHO OFF

ECHO Batch: Running Python file merger
python %~dp0\nmlc\merge_nml.py

ECHO Batch: Copying merged file to src/merged directory
copy /y /v %~dp0\nmlc\improved_town_industries.nml %~dp0\src\merged\improved_town_industries.nml

ECHO Batch: Running NMLC compiler
%~dp0\nmlc\nmlc -t src\custom_tags.txt -l src\lang --grf improved_town_industries.grf nmlc\improved_town_industries.nml

ECHO Batch: Cleaning up
RMDIR %~dp0\.nmlcache
DEL %~dp0\nmlc\improved_town_industries.nml

set /P c=Complete!
if /I "%c%" EQU "TT" (goto :copy
) else (exit)

:copy
ECHO Copying to NewGRF directory
copy /y /v %~dp0\improved_town_industries.grf C:\Users\tyler\Documents\OpenTTD\newgrf\
pause
exit
