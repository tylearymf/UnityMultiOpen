::Unity��Ŀ�࿪
@echo off

::�Թ���ԱȨ������
::https://www.zhihu.com/question/34541107/answer/243592603
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit


::������Ŀ
set linkFolders=Assets ProjectSettings Packages
set copyFolders=Library
set /p projectFolder=��������������Ŀ��·��:
set /p linkNum=��������Ŀ�࿪������:
for /l %%i in (1,1,%linkNum%) do (
echo �� %%i ����ĿĿ¼���ӿ�����ʼ
echo �� %%i ����ĿĿ¼������...
for %%s in (%linkFolders%) do (
    call:CreateLink %projectFolder%_Link%%i %%s %projectFolder%
)
echo �� %%i ����ĿĿ¼������...
for %%s in (%copyFolders%) do (
    call:CopyAsset %projectFolder%_Link%%i %%s %projectFolder%
)
echo �� %%i ����ĿĿ¼���ӿ������
)
pause

:CreateLink
if not exist %1 mkdir %1
if not exist %1\%2 (mklink /D %1\%2 %3\%2) else (echo %1\%2 �ļ����Ѵ��ڣ�����������)
goto:eof

:CopyAsset
if not exist %1\%2 (robocopy /E /NFL /NDL /NJH %3\%2 %1\%2) else (echo %1\%2 �ļ����Ѵ��ڣ������п���)
goto:eof