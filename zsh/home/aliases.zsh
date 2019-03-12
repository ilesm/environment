alias ff="find . -name target -prune -or -name .git -prune -or -name .idea -prune -or -name node_modules -prune -or -name bower_components -prune -or -type f -print0 | xargs -0 grep -i"
