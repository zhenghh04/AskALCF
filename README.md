# AskALCF ChatBot

This directory contains scripts for monitoring the chatbot instances.

## Monitor and Restart Scripts
The following scripts check whether the corresponding Streamlit app is running.  
If not, they will launch the instance automatically:

- `watch_askalcf_staff.sh`
- `watch_askalcf_user.sh`
- `watch_askalcf_test.sh`

The logs are launch_askalcf_[MODE].log. 

## Auto-Start on System Reboot
We use `crontab -e` to configure three jobs so that each `watch_*` script starts automatically whenever the system restarts.
```bash
@reboot nohup /home/huihuo.zheng/askalcf/watch_askalcf_staff.sh > /tmp/watch_askalcf_staff.log 2>&1 &
@reboot nohup /home/huihuo.zheng/askalcf/watch_askalcf_user.sh > /tmp/watch_askalcf_user.log 2>&1 &
@reboot nohup /home/huihuo.zheng/askalcf/watch_askalcf_test.sh > /tmp/watch_askalcf_test.log 2>&1 &
```

## Update to each instance

When code inside an instance is updated, the corresponding website will automatically reload with the latest changes.

If you modify any launch*.sh scripts in $ASKALCF/askalcf-user/, you can apply the changes immediately by running the updated launch script in the background. This will terminate the existing instance and start a new one using the updated script.
