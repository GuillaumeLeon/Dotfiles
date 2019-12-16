#!/bin/bash

if[-d "~/.config/"];then
    cp -r .config/* ~/.config/;
else
    mkdir ~/.config;
    cp -r .config/* ~/.config/;
fi

if[-d "~/.themes/"];then
    cp -r .config/* ~/.config/;
else
    mkdir ~/.themes;
    cp -r .themes/* ~/.themes/;
fi

cp .bashrc ~/.bashrc
cp .Xressources ~/.Xressources
