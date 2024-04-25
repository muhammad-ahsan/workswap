#!/bin/bash

git config --global user.name $1
git config --global user.email $2

username=$(git config --global user.name)
email=$(git config --global user.email)

echo USERNAME + EMAIL updated successfully
echo user.name=$username
echo user.email=$email 
