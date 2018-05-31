#!/bin/sh
###############
# PERFECT PHP #
###############

# To make this file runnable:
#    $ chmod +x *.sh.command

projectHome=$(cd $(dirname $0); pwd)
webPath=centerkey.com/php

publish() {
   cd $projectHome
   pwd
   echo
   publishWebRoot=$(grep ^DocumentRoot /private/etc/apache2/httpd.conf | awk -F\" '{ print $2 }')
   publishFolder=$publishWebRoot/$webPath
   copyFiles() {
      echo "Copying:"
      cp -v *.css *.html *.php $publishFolder
      mv -v $publishFolder/perfect.html $publishFolder/perfect.html.txt
      }
   test -w $publishFolder && copyFiles
   echo
   }

gistReminder() {
   echo "Checkin (git push):"
   echo "   Push commits from the command line using a personal access"
   echo "   token (github.com --> Settings) for the password."
   echo
   }

launchBrowser() {
   url=http://localhost/$webPath
   echo "Opening:"
   echo $url
   sleep 2
   open $url
   echo
   }

echo
echo "Publish PERFECT PHP"
echo "==================="
publish
gistReminder
launchBrowser
