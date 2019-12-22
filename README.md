# docker-abcde

[abcde](http://abcde.einval.com) in an alpine container. 


```
docker run -ti -v $(readlink -f ./out):/abcde/out --device /dev/sr0 vidiben/abcde
```
