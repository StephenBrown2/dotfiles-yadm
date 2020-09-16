#!/bin/sh
curl -so $HOME/bin/ssltool-cli https://devel.ssltool.rackspace.com/cli/ssltool-cli.osx &&
  chmod +x $HOME/bin/ssltool-cli &&
  sudo ssltool-cli rscerts