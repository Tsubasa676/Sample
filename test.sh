#!/bin/sh

echo "Hello, World!"

echo "カレントディレクトリ内の対象ファイルをループ"
for file in `ls -r *.jpg`
do
    echo $file
done

#*:0文字以上、?:任意の1文字、[]内の任意の１文字(例[0-9])、{}内の組み合わせ（{}内のすべての組み合わせが展開、{}のしようにはちゅうい）、{}に{}や[]をつけられる
echo "あるディレクトリ配下のファイル抽出"
for FILE in `find ./TE -type f -name 't*.t*'`
do
    echo $FILE
done

#配列に入れる
files="./TE/*"
fileary=()
dirary=()
for filepath in $files; do
if [ -f $filepath ] ; then
fileary+=("$filepath")
elif [ -d $filepath ] ; then
dirary+=("$filepath")
fi
done

echo "ファイル一覧"
for i in ${fileary[@]}; do
echo $i
done

echo "ディレクトリ一覧"
for i in ${dirary[@]}; do
echo $i
done

echo "ファイル名一覧 pass ls -r"
#tempdir="./TE"
#commandlist=$(ls -r "${tempdir}")
#for command in $commandlist
for command in `ls -r ./TE`
do
if [[ $command == *".csv" ]]
then
echo $command
cat ./TE/$command >> ./TE/TE2/INPUT.csv
fi
done

# >上書き、>>追記
#cat ./TE/*.csv > ./TE/TE2/INPUT.csv



echo "------------------------------END------------------------------"


