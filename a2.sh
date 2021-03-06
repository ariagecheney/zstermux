#!/data/data/com.termux/files/usr/bin/bash

screen -wipe
screen -dmS aria2 aria2c --enable-rpc --rpc-listen-all
echo ""
echo -e "\033[31maria2服务已在后台运行\033[0m"
echo ""

if [ -d "$HOME/webui-aria2" ] ; then
	cd ~/webui-aria2
        screen -wipe
	screen -dmS webui node node-server.js
	echo ""
	echo -e "\033[31maria2面板已在后台运行\033[0m"
	echo -e "\033[31m请用chrome浏览器打开，127.0.0.1:8888\033[0m"
	echo ""
        am start -a android.intent.action.VIEW -d http://127.0.0.1:8888
        cd ~
        sh zs.sh
        

else
	crontab -l | { cat; echo "30 19 * * * $HOME/zstermux/trackers-list-aria2.sh"; } | crontab -
	cd ~
	mkdir -p .config/aria2
	cd zstermux
	cp aria2.conf ~/.config/aria2/aria2.conf
        cd ~
	echo -e "\033[31m正在安装aria2面板\033[0m"
	git clone https://github.com/ziahamza/webui-aria2.git
	cd webui-aria2
        screen -dmS webui node node-server.js
	echo ""
        echo -e "\033[31maria2面板已在后台运行\033[0m"
	echo -e "\033[31m请用chrome浏览器打开，127.0.0.1:8888\033[0m"
	echo ""
        am start -a android.intent.action.VIEW -d http://127.0.0.1:8888
        cd ~
        sh zs.sh
        
fi
exit
