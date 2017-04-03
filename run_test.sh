#!/bin/bash

OUTPUT=$(docker run --rm -it node:$tag node -e "process.stdout.write(process.versions.node)")
  if [ "$OUTPUT" != "$tag" ]; then
    fatal "Test of $tag failed!"
  else
    info "Test of $tag succeeded."
fi
