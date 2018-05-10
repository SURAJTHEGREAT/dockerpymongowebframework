#!/bin/bash

case "$WEB_SERVICE" in
  "bottle" )
    pytest /web/$git_repo/tests > test_output.log
    a=`grep -rnw 'raise AssertionError()' /web/test_output.log`
    if [ -z $a ]; then
    exec python /web/$git_repo/blog.py
    else
    echo "Some mandatory config is missed please check"
    fi
    ;;
esac
