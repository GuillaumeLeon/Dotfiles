# !/bin/bash

mkdir -p  out
rm -rf out/*

for dir in .config/*
do 
		dir=${dir%*/}
		tar czf ./out/${dir##*/}.tar.gz ${dir}

		echo "${dir##*/} compressed"
done

echo "Done!"
