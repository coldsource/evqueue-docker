# evqueue-core Docker image

## Building

``` 
docker build . --tag evqueue-core
```

## Building a specific branch

```
docker build --build-arg branch=websockets . --tag evqueue-core:3.0
```

## Run the container

```
docker run -p5000:5000 -p5001:5001 -e mysql_host=localhost -e mysql_user=evqueue -e mysql_password=evqueue evqueue-core
```

If you are running a MariaDB server on your host machine :

```
docker run --network=host -e mysql_host=127.0.0.1 -e mysql_user=evqueue -e mysql_password=evqueue evqueue-core
```

If database is not ready yet, container will wait for it to become ready.
