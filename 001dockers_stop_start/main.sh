#!/bin/bash
function onekey_deal_dockers() {
    IPS=(192.168.0.1 192.168.0.2 192.168.0.3)

    # 执行杀死docker进程操作
    if [[ $1 = 'kill' ]]; then
      for ip in ${IPS[@]}
      do
          scp kill_docker.sh root@${ip}:/
          ssh -t root@${ip} 'sh /kill_docker.sh'
      done

    # 执行开启docker进程操作
    elif [[ $1 = 'start' ]]; then
      for ip in ${IPS[@]}
      do
        scp start_docker.sh root@${ip}:/
        ssh -t root@${ip} 'sh /start_docker.sh'
      done
    fi
}

onekey_deal_dockers $1