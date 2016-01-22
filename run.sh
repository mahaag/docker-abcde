#!/bin/bash

docker run -ti -v $(readlink -f ./out):/abcde/out --device /dev/sr0 vidiben/abcde $@

