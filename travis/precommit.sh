#!/bin/bash
function abort(){
    echo "Your commit not fit PaddlePaddle code style" 1>&2
    echo "Please use pre-commit scripts to auto-format your code" 1>&2
    exit 1
}

trap 'abort' 0
set -e
cd `dirname $0`
cd ..
export PATH=/usr/bin:$PATH
GOPATH=/tmp/go go get -u github.com/wangkuiyi/ipynb/markdown-to-ipynb
pre-commit install

if ! pre-commit run -a ; then
  git diff  --exit-code
fi

trap : 0
