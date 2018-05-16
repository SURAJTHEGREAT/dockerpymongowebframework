#!/bin/bash

case "$WEB_SERVICE" in
  "bottle" )
    # RUN PYTEST MODULE  
    pytest /web/$git_repo/tests > test_output.log
    a=`grep 'FAILURES' /web/test_output.log`
    if [ -z $a ]; then
    exec python /web/$git_repo/blog.py
    else
    # IF TEST FAILS - DO NOT EXECUTE THE APP
    echo "Test failed please check if all environment variables are filled"
    fi
    ;;
esac
