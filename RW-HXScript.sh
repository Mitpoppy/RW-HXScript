#!/bin/bash
LANG=en_US.UTF-8

# if [ $(whoami) != "root" ];then
	# echo "请使用root权限执行安装命令！"
	# exit 1;
# fi

echo "---------------------------------
  ____ __        __      _   _ __  __ ____               _         _   
 |  _ \\ \      / /     | | | |\ \/ // ___|   ___  _ __ (_) _ __  | |_ 
 | |_) |\ \ /\ / /_____ | |_| | \  / \___ \  / __|| '__|| || '_ \ | __|
 |  _ <  \ V  V /|_____||  _  | /  \  ___) || (__ | |   | || |_) || |_ 
 |_| \_\  \_/\_/        |_| |_|/_/\_\|____/  \___||_|   |_|| .__/  \__|
                                                           |_|         
---------------------------------"
echo -e "${RED}简介${RES}"
echo "欢迎使用RW-HPS_HX(幻想)安装脚本，本脚本基于RW-HPS服务端
如果你不知道RW-HPS是什么，请访问：https://github.com/RW-HPS/RW-HPS
RW-HXScript Github仓库：https://github.com/Mitpoppy/RW-HXScript"
echo "---------------------------------"
echo -e "${RED}注意${RES}"
echo "1.请不要重复使用此脚本，出现问题概不负责 
2.请确保您已经安装好了JAVA环境（版本随意）
3.由于技术不精湛可能导致些许的bug
4.本脚本仅供学习或娱乐使用，请勿用于违法行为"
echo "---------------------------------"
read -p "为空回车默认继续安装(稍后再安装填 "no" ):" start
if [ "$start" == "no" ];then
    exit
fi

read -p "请输入默认安装目录以/开头，以/结尾(为空回车则默认安装到用户目录~/rw):" home
if [ -z "$home" ];then
    cd ~
	sleep 0.1s
    mkdir rw
	sleep 0.1s
	home=~/rw/
fi
echo "已设置安装目录[${home}]"

sleep 0.5s

read -p "版本选择：
---------------------
1.14  [1.14服务器核心]
1.15  [1.15服务器核心]
 --------------------
请选择要安装的服务器版本（为空则取消安装）
请直接填写版本号后回车:" xz
if [ "$xz" == "1.14" ];then
wget https://github.com/RW-HPS/RW-HPS/releases/download/6.4.0/151-1.14.jar -O ${home}Server.jar
fi

if [ "$xz" == "1.15" ];then
wget https://github.com/RW-HPS/RW-HPS/releases/download/6.4.0/173-1.15.P10.jar -O ${home}Server.jar
fi

if [ -z "$xz" ];then
    exit
fi

rw="rw"
screen -dmS $rw
sleep 0.5s
screen -x -S $rw -p 0 -X stuff "cd ${home}
"
echo "screen RW-HPS服务器窗口创建完成"
sleep 0.5s
screen -x -S $rw -p 0 -X stuff "java -Xmx512M -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 -jar Server.jar
"
echo "screen RW-HPS开启服务器完成"
sleep 1s
echo "正在进入RW-HPS服务器窗口..."
sleep 1.5s
screen -r rw
