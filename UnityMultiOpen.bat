::Unity项目多开
@echo off

::以管理员权限运行
::https://www.zhihu.com/question/34541107/answer/243592603
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit


::链接项目
set linkFolders=Assets ProjectSettings
set /p projectFolder=请输入或复制黏贴项目根路径:
set /p linkNum=请输入项目多开的数量:
for /l %%i in (1,1,%linkNum%) do (
for %%s in (%linkFolders%) do (
    call:CreateLink %projectFolder%_Link%%i %%s %projectFolder%
)
)
pause

:CreateLink
if not exist %1 mkdir %1
if not exist %1\%2 (mklink /D %1\%2 %3\%2) else (echo %1\%2 文件夹已存在，不进行链接)
goto:eof