NEXTVERSION=$(cat VERSION | awk -F. -v OFS=. '{$NF += 1 ; print}')
echo $NEXTVERSION > VERSION
yyyymmdd=$(date '+%Y%m%d')
tag=$yyyymmdd-$NEXTVERSION
echo $tag > TAG
docker build . -t shioaji_doc:$tag