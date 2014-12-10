#!/bin/sh

IMG=$1
[ -z "$IMG" ] && echo "Usage: $0 <imagename>" && exit 1

cd $(dirname $0)

./prepare.sh || exit $?

docker build -t $IMG . || exit $?

./test.sh $IMG || exit $?

docker push $IMG || exit $?
