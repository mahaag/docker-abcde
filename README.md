# docker-abcde

[abcde](http://abcde.einval.com) in a debian jessie container. 


```
docker run -ti -v $(readlink -f ./out):/abcde/out --device /dev/sr0 vidiben/abcde
```
