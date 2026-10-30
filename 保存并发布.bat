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
set "tries=0"
:retry
set /a tries+=1
if %tries% EQU 3 goto directtry
if %tries% EQU 4 goto directtry
echo   第 %tries% 次尝试 (走代理)...
git push origin main
goto checkresult

:directtry
echo   第 %tries% 次尝试 (直连)...
git -c http.proxy= -c https.proxy= push origin main

:checkresult
if not errorlevel 1 goto success
if %tries% GEQ 4 goto failed
echo.
echo   这次没成功. 国内连 GitHub 有时会断, 3 秒后自动重试...
ping -n 4 127.0.0.1 >nul
goto retry

:success
echo.
echo   完成! 等 1-2 分钟后打开:
echo   https://teanotmatcha.github.io/myblog/
echo   刷新就能看到新内容 (没变的话按 Ctrl+F5 强制刷新).
echo.
pause >nul
exit /b

:failed
echo.
echo   试了 4 次都没成功. 常见原因:
echo   1. 第一次使用, 需要在弹出的小窗口里登录 GitHub 并授权,
echo      登录完再双击一次这个文件就行.
echo   2. 代理软件 (Clash 之类) 没开, 或者端口变了.
echo      把代理软件打开, 再双击一次这个文件.
echo   3. 网络暂时连不上 GitHub, 过几分钟再试.
echo.
echo   如果一直失败, 把上面的报错截图发给作者帮忙看.
pause >nul
