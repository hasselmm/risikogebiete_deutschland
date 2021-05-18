#!/bin/bash

rm -fr /tmp/covidkids
mkdir /tmp/covidkids

echo "Downloading..."
git fetch origin
git checkout master

git log  --pretty=%H\ %ai\ %an origin/master -- assets/data/  | grep UpdateBot |\
while read h d x
do
	echo "Checking $d..."

	mkdir -p "assets/history/$d"
	for f in "data_latest.csv" "data_latest.json"
	do
		test -f "assets/history/$d/$f" && continue
		git rev-parse "$h:assets/data/$f" >/dev/null 2>&1 || continue

		echo "Extracting $f..."
		git show "$h:assets/data/$f" > "assets/history/$d/$f"
	done
done
