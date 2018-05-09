#!/usr/bin/env bash
###########################################################################
# Written by Suraj to create blog with mongodb as backend 
###########################################################################

set -vx

echo "=========================================================================="
echo "     STEP1:         GIT CLONE REPO                                        "
echo "=========================================================================="

git clone https://$git_user:$git_pwd@github.com/$git_user/$git_repo

echo "=========================================================================="
echo "     STEP2:         PIP INSTALL REQUIREMENTS.TXT                          "
echo "=========================================================================="
pip -v install -r $git_repo/requirements.txt
