::!/bin/sh
:: Author: fullarray
:: Description: Auto commit tool every 180 seconds. 
:: License: MIT License 
:: Copyright 2015-2020 fullarray
::#########################################
::## Automation tool for git auto commits
::#########################################
@echo off
set UserInputPath=%cd%
echo Current directory: %UserInputPath%
cd %UserInputPath%
:loop
::set /p UserInputPath=Enter your project directory path?

::# switch to branch you want to use
::git checkout develop
::# add all added/modified files
git add .
::git ignore auto-git.bat
git update-index --skip-worktree auto-git.bat
::# commit changes
::set /p CommitMessage=What would you like to say on your commit?
::read commitMessage
set Timestamp=%date:~4,2%%date:~7,2%%date:~10,4%_%time:~0,2%%time:~3,2%%time:~6,2%
git commit -m "Added new code %Timestamp%"
::# push to git remote repository
git push origin master
::###########################
::echo %CommitMessage% 
timeout /t 180
goto loop
echo Press Enter...

::read
