#!/bin/bash
image_and_tag="$1"
image_and_tag_array=(${image_and_tag//:/ })
if [[ "$(docker images ${image_and_tag_array[0]} | grep ${image_and_tag_array[1]} 2> /dev/null)" != "" ]]; then
  echo "exists"
  docker rmi -f $image_and_tag
else
  echo "$image_and_tag doesn't exist"
fi