@echo off
chcp 936 >nul
title 我的博客 - 本地预览
cd /d "%~dp0"
echo.
echo   ==============================================
echo     正在启动博客, 请稍等 3-5 秒
echo     浏览器会自动打开: http://localhost:1313
echo.
echo     这个黑色窗口不要关, 关了博客就停了.
echo     看完想关博客? 直接关掉这个窗口就行.
echo   ==============================================
echo.
if not defined MYBLOG_SELFTEST start "打开浏览器" /min cmd /c "timeout /t 5 /nobreak >nul && explorer http://localhost:1313"
hugo server -D
echo.
echo   博客已停止, 按任意键关闭窗口.
pause >nul
