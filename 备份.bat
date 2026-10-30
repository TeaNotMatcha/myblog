@echo off
title 备份博客
cd /d "%~dp0"
echo.
echo   正在备份……
echo.
git add -A
git commit -m "Backup %date% %time%"
echo.
echo   如果上面显示 nothing to commit，说明这次没有改动，不用管。
echo   如果显示了一堆文件和数字，说明备份成功。
echo.
pause >nul