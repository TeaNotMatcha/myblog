@echo off
title 新建一篇文章
cd /d "%~dp0"
echo.
echo   请输入文章标题，然后按回车（可以直接打中文）：
echo.
set /p "title="
if "%title%"=="" (
  echo   没有输入标题，已取消。
  pause
  exit /b
)
echo.
hugo new content "post/%title%/index.md"
echo   已创建，正在用记事本打开……
start "" notepad "content\post\%title%\index.md"
echo.
echo   写完按 Ctrl+S 保存，浏览器会自动刷新看到效果。
echo   注意：新文章默认是草稿，启动博客时用的是带草稿的模式，所以能立刻看到。
pause >nul