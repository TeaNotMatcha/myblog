@echo off
chcp 936 >nul
title 新建一篇文章
cd /d "%~dp0"
echo.
echo   请输入文章标题, 然后按回车 (可以直接打中文):
echo.
set /p "title="
if "%title%"=="" goto cancelled
echo.
hugo new content "post/%title%/index.md"
echo.
echo   已创建, 正在用记事本打开...
if not defined MYBLOG_SELFTEST start "" notepad "content\%title%\index.md"
echo.
echo   写完按 Ctrl+S 保存, 浏览器会自动刷新看到效果.
pause >nul
exit /b

:cancelled
echo   没有输入标题, 已取消.
pause >nul
