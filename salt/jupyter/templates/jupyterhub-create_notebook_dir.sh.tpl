#!/bin/bash

set -x

if [ $PAM_USER == {{ pnda_user }} ]; then exit; fi

DIR=/home/$PAM_USER
if [ ! -d $DIR ]; then
    mkdir $DIR
    chmod 0755 $DIR
    chown $PAM_USER:$PAM_USER $DIR
fi

DIR=$DIR/jupyter_notebooks
if [ ! -d $DIR ]; then
    mkdir $DIR
    chmod 0755 $DIR
    chown $PAM_USER:$PAM_USER $DIR
    ln -s {{ example_notebooks_dir }} $DIR/examples
fi
