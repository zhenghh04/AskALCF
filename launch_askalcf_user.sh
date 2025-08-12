#!/bin/bash
#export STREAMLIT_SERVER_BASE_URL_PATH="/user"
export GEMINI_API_KEY=AIzaSyDk14ocZjUkn8FmohDslpXMHF4_hh3DCUY
source activate $HOME/askalcf/pyenvs/askalcf-user
export STREAMLIT_SERVER_PORT=9505
echo "Clearing up existing instances"
export PS=$(lsof -t -i:$STREAMLIT_SERVER_PORT || echo "")
if [[ "$PS" == "" ]]; then
   echo "No existing process"
else
    kill -9 $PS
    sleep 0.1
fi
echo "[`date`] Launched instance"
cd $HOME/askalcf/user-mode
streamlit run apps/app_convo.py \
  --server.port=$STREAMLIT_SERVER_PORT \
  --server.headless=true \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false
