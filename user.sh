#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

echo ""
echo '1.一键添加用户'
echo '2.添加用户'
echo '3.删除用户'
echo '4.修改用户'
echo '5.显示用户流量信息'
echo '6.显示用户名端口信息'
echo '7.生成用户二维码'
echo "直接回车返回上级菜单"

while :; do echo
	read -p "请选择： " userc
	[ -z "$userc" ] && ssr && break
	if [[ ! $userc =~ ^[1-7]$ ]]; then
		echo "输入错误! 请输入正确的数字!"
	else
		break	
	fi
done

if [[ $userc == 1 ]];then
	bash /usr/local/SSR-Bash-Python/user/easyadd.sh
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi

if [[ $userc == 2 ]];then
	bash /usr/local/SSR-Bash-Python/user/add.sh
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi

if [[ $userc == 3 ]];then
	bash /usr/local/SSR-Bash-Python/user/del.sh
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi

if [[ $userc == 4 ]];then
	bash /usr/local/SSR-Bash-Python/user/edit.sh
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi

if [[ $userc == 5 ]];then
	echo "1.使用用户名"
	echo "2.使用端口"
	echo ""
	while :; do echo
		read -p "请选择： " lsid
		if [[ ! $lsid =~ ^[1-2]$ ]]; then
			echo "输入错误! 请输入正确的数字!"
		else
			break	
		fi
	done
	if [[ $lsid == 1 ]];then
		read -p "输入用户名： " uid
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -l -u $uid
	fi
	if [[ $lsid == 2 ]];then
		read -p "输入端口号： " uid
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -l -p $uid
	fi
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi

if [[ $userc == 6 ]];then
	P_V=`python -V 2>&1 | awk '{print $2}'`
	P_V1=`python -V 2>&1 | awk '{print $2}' | awk -F '.' '{print $1}'`
	if [[ ${P_V1} == 3 ]];then
		echo "你当前的python版本不支持此功能"
		echo "当前版本：${P_V} ,请降级至2.x版本"
	else
		python /usr/local/SSR-Bash-Python/user/show_all_user_info.py
	fi
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi

if [[ $userc == 7 ]];then
	bash /usr/local/SSR-Bash-Python/user/qrcode.sh
	echo ""
	bash /usr/local/SSR-Bash-Python/user.sh
fi