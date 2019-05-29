#!/bin/bash

REPO="artifacts"
REMOTE="https://gitlab.corp.sldev.cz/trezor-public/artifacts.git"

cd upgrade

# TODO move to submodule
if [ ! -d $REPO ]
then
    git clone --quiet $REMOTE
else
    cd $REPO
    git pull
    cd ..
fi

cd $REPO
git checkout tsusanka/binary-fix
cd ..

python test_upgrades.py
