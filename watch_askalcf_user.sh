#!/bin/bash

while true; do
  if ! pgrep -f "launch_askalcf_user.sh" > /dev/null; then
    echo "[`date`] Starting AskALCF[USER] mode..."
    nohup /home/huihuo.zheng/askalcf/user-mode/launch_askalcf_user.sh > /tmp/launch_askalcf_user.log 2 >& 1
  else
    echo "[`date`] AskALCF[USER] already running." >& /home/huihuo.zheng/askalcf/launch_askalcf_user.log
  fi
  sleep 10
done
