#!/bin/bash
# Based on a script originally written by maxiaohao in the aws-mock GitHub project:
# https://github.com/treelogic-swe/aws-mock/
# Original was MIT licensed (https://github.com/ReadyTalk/swt-bling/blob/master/LICENSE).

set -e
echo -e "Publishing output to gh-pages...\n"

git config --global user.email "jenkins-handlers@thelevelup.com"
git config --global user.name "Travis CI"
git fetch https://${GH_TOKEN}@github.com/TheLevelUp/developer.thelevelup.com refs/heads/gh-pages:travis-gh-pages
git checkout travis-gh-pages
git rm -r .
git checkout HEAD -- .gitignore
cp -R output/* ./
git add --all
git commit -m "Updates from Travis build [${TRAVIS_COMMIT:0:7}]"
git push -q https://${GH_TOKEN}@github.com/TheLevelUp/developer.thelevelup.com travis-gh-pages:gh-pages

echo -e "Done publishing to gh-pages.\n"
