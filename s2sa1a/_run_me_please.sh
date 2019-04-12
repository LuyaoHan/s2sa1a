#!/bin/bash

#echo "Copy paste your repository url here(http://...):"
#read URL
#echo $URL

#echo "Copy Paste Your repository name here:"
#echo "Github Robot" $(date)
#exit 0
#read RepoName



DATE=$(date)
USER=$(sed -n "7p" .credentials.txt)


#echo $USER
PASSWD=$(sed -n "9p" .credentials.txt)
#exit 0;

RepoName="s2sa1a"
#rm -rf $RepoName
echo $RepoName
#exit 0;
curl -u $USER https://api.github.com/user/repos -d '{"name":"'$RepoName'"}'

URL="https://github.com/${USER//[[:blank:]]/}/${RepoName//[[:blank:]]/}"

#echo $URL
#exit 0 
echo "Makeing a zip for all files in current folder: backup.tar.gz"

#exit 0

rm -rf backup
rm -f backup.tar.gz
#tar -czvf backup.tar.gz ./*

git config --global user.name "$USER"
git config --global user.password "$PASSWD"

cp ./.expectCallback.exp ..

git clone $URL
cp .expectCallback.exp ./$RepoName
#
#cp !(./$RepoName) ./$RepoName 
#mv ./backup.tar.gz ./$RepoName 
cp -r ./* ./$RepoName 
cd ./$RepoName

chmod a+x ./.expectCallback.exp
./.expectCallback.exp ${PASSWD} ${RepoName} ${USER} ${URL}




