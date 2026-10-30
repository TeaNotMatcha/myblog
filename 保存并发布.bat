@echo off
chcp 936 >nul
title 保存并发布博客
cd /d "%~dp0"
echo.
echo   ==============================================
echo     第一步: 保存到本机 (备份)
echo   ==============================================
echo.
git add -A
git commit -m "Update %date% %time%"
echo.
echo   ==============================================
echo     第二步: 上传到 GitHub, 自动发布
echo   ==============================================
echo.
git push origin main
if errorlevel 1 goto failed
echo.
echo   完成! 等 1-2 分钟后打开:
echo   https://teanotmatcha.github.io/myblog/
echo   刷新就能看到新内容 (没变的话按 Ctrl+F5 强制刷新).
echo.
pause >nul
exit /b

:failed
echo.
echo   上传失败. 常见原因:
echo   1. 第一次使用, 需要在弹出的小窗口里登录 GitHub 并授权,
echo      登录完再双击一次这个文件就行.
echo   2. 没有联网.
echo.
echo   如果一直失败, 把上面的报错截图发给作者帮忙看.
pause >nul
