#!/bin/bash
#export STREAMLIT_SERVER_BASE_URL_PATH="/user"
export GEMINI_API_KEY=AIzaSyDk14ocZjUkn8FmohDslpXMHF4_hh3DCUY
#export ALCF_AUTH_TOKEN=054xZO6OUljn1fBMiw6dSIcNc6w4f9
export ALCF_AUTH_TOKEN=$(bash /home/huihuo.zheng/askalcf/get_alcf_token.sh)
echo "ALCF_AUTH_TOKEN: $ALCF_AUTH_TOKEN"
source activate $HOME/askalcf/pyenvs/askalcf-staff
export PATH=$HOME/askalcf/pyenvs/askalcf-staff/bin/:$PATH
export STREAMLIT_SERVER_PORT=8505
echo "Clearing up existing instances"
export PS=$(lsof -t -i:$STREAMLIT_SERVER_PORT || echo "")
if [[ "$PS" == "" ]]; then
   echo "No existing process"
else
    kill -9 $PS
    sleep 0.1
fi
echo "[`date`] Launched instance"
cd $HOME/askalcf/staff-mode
streamlit run apps/app_user_support_convo.py \
  --server.port=8505 \
  --server.headless=true \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false

