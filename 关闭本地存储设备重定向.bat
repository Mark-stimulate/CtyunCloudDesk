@echo off
title 关闭出方向445端口
color 0A

:: 检查是否以管理员权限运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo 错误：权限不足！
    echo 请右键点击该 .bat 文件，选择“以管理员身份运行”。
    echo.
    pause
    exit /b 1
)

echo 正在配置 Windows 防火墙规则...
echo.

:: 添加规则：阻止出方向的 TCP 445 端口
netsh advfirewall firewall add rule name="Block Outbound Port 445 (TCP)" dir=out action=block protocol=TCP remoteport=445

:: 添加规则：阻止出方向的 UDP 445 端口（可选，为了更全面的防护）
netsh advfirewall firewall add rule name="Block Outbound Port 445 (UDP)" dir=out action=block protocol=UDP remoteport=445

echo.
echo ===================================================
echo 防火墙规则添加成功！出方向的 445 端口现已被阻止。
echo ===================================================
echo.
pause