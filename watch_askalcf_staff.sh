#!/bin/bash
i=0
while true; do
  if ! pgrep -f "launch_askalcf_staff.sh" > /dev/null; then
    echo "[`date`] Starting AskALCF[STAFF] mode..."
    nohup /home/huihuo.zheng/askalcf/staff-mode/launch_askalcf_staff.sh > /tmp/launch_askalcf_staff.log 2 >& 1
  else
    echo "[`date`] AskALCF[STAFF] already running." >& /home/huihuo.zheng/askalcf/launch_askalcf_staff.log
  fi
  sleep 10
  i=$((i+1))
  if [[ $i -gt 36000 ]]; then
      conda activate globus_env
      python inference_auth_token.py authenticate
      i=0
  fi
done
