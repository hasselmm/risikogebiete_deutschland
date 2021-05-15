#!/bin/bash

rm -fr /tmp/covidkids
mkdir /tmp/covidkids

git log  --pretty=%H\ %ai\ %an origin/master -- assets/data/  | grep UpdateBot |\
while read h d x
do 
	git checkout $h
	mkdir /tmp/covidkids/$d
	cp -r assets/data/data_latest.* /tmp/covidkids/$d
done	

git checkout master

rm -fr assets/history
mv /tmp/covidkids assets/history
