#!/bin/bash
access_token=$(python $HOME/askalcf/inference_auth_token.py get_access_token)
echo $access_token
