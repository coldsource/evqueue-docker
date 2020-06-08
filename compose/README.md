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

## Configuring
The following environement variables can be used to start the containers :

* **EVQUEUE_HTTP_PORT** : Port used for web interface. Default is 80.
* **EVQUEUE_API_PORT** : Port used for API. Default is 5000.
* **EVQUEUE_WS_PORT** : Port used for Websockets. Default is 5001.

To use it :

```
EVQUEUE_HTTP_PORT=8080 docker-compose up
```
