#!/bin/bash

rm -fr /tmp/covidkids

git log  --pretty=%H\ %ai\ %an data/  | grep UpdateBot |\
while read h d x
do 
	git checkout $h
	cp -r data/ /tmp/covidkids/$d
done	

git checkout master

rm -fr assets/history
mv /tmp/covidkids assets/history
