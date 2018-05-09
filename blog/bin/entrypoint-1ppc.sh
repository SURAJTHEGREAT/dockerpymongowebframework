#!/bin/bash

case "$WEB_SERVICE" in
  "bottle" )
    exec python /web/$git_repo/blog.py
    ;;
esac
