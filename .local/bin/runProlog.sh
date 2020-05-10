docker run -d --net=none --name=rserve swipl/rserve
docker run -d -p 3050:3050 --volumes-from rserve -v $(pwd):/data swipl/swish
