# evQueue docker compose

This Docker composer file provides a full evQueue environment including database, evqueue-core and evqueue-frontend-react.

## Using

``` 
docker-compose up
```

Using a browser, visit : https://localhost

Login with default: admin / admin

## Building

Building :

```
docker-compose build
```

To build a specific branch, use :

```
docker-compose build --build-arg branch=websockets
```

