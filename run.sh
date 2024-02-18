docker rm -f shioaji_doc
tag=`cat TAG`
echo $tag
docker run -it \
    --name shioaji_doc \
    -d shioaji_doc:$tag 