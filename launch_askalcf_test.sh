#!/bin/bash
#export STREAMLIT_SERVER_BASE_URL_PATH="/user"
export GEMINI_API_KEY=AIzaSyDk14ocZjUkn8FmohDslpXMHF4_hh3DCUY
export ALCF_AUTH_TOKEN=$(bash /home/huihuo.zheng/askalcf/get_alcf_token.sh)
echo "ALCF_AUTH_TOKEN: $ALCF_AUTH_TOKEN"
source activate $HOME/askalcf/pyenvs/askalcf-test
export STREAMLIT_SERVER_PORT=8501
echo "Clearing up existing instances"
export PS=$(lsof -t -i:$STREAMLIT_SERVER_PORT || echo "")
if [[ "$PS" == "" ]]; then
   echo "No existing process"
else
    kill -9 $PS
    sleep 0.1
fi
echo "[`date`] Launched instance"
cd $HOME/askalcf/test-mode
streamlit run apps/app_convo_test.py \
  --server.port=$STREAMLIT_SERVER_PORT \
  --server.headless=true \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false
