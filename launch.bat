@echo off
REM 下班倒计时挂件启动脚本
REM 使用 Microsoft Edge 以应用模式启动，实现无边框浮窗效果

REM 获取脚本所在目录
set script_dir=%~dp0

REM 获取 widget.html 的完整路径
set widget_path=%script_dir%widget.html

REM 检查 widget.html 文件是否存在
if not exist "%widget_path%" (
    echo 错误: 找不到 widget.html 文件
    echo 请确保 launch.bat 和 widget.html 在同一目录下
    pause
    exit /b 1
)

REM 尝试使用 Microsoft Edge
where msedge >nul 2>&1
if %ERRORLEVEL% equ 0 (
    start msedge --app="file:///%script_dir:~0,-1%/widget.html" --window-size=300,400
    exit /b 0
)

REM 如果 Edge 不存在，尝试使用 Chrome
where chrome >nul 2>&1
if %ERRORLEVEL% equ 0 (
    start chrome --app="file:///%script_dir:~0,-1%/widget.html" --window-size=300,400
    exit /b 0
)

REM 如果都不存在，尝试使用默认浏览器
start "" "%widget_path%"
exit /b 0
