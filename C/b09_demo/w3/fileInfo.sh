while read file
do
    ls -l "$file"
    wc -l "$file"
done
