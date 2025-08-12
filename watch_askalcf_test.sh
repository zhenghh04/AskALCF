#!/bin/bash
i=0
while true; do
  if ! pgrep -f "launch_askalcf_test.sh" > /dev/null; then
    echo "[`date`] Starting AskALCF[TEST] mode..."
    nohup /home/huihuo.zheng/askalcf/test-mode/launch_askalcf_test.sh > /tmp/launch_askalcf_test.log 2 >& 1
  else
    echo "[`date`] AskALCF[TEST] already running." >& /home/huihuo.zheng/askalcf/launch_askalcf_test.log
  fi
  sleep 10
  i=$((i+1))
  if [[ $i -gt 36000 ]]; then
      conda activate globus_env
      python inference_auth_token.py authenticate
      i=0
  fi
done
