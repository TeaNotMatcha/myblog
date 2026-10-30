@echo off
chcp 936 >nul
title 备份博客
cd /d "%~dp0"
echo.
echo   正在备份...
echo.
git add -A
git commit -m "Backup %date% %time%"
echo.
echo   显示 nothing to commit 表示这次没改动, 不用管.
echo   显示一堆文件名和数字, 表示备份成功.
pause >nul
