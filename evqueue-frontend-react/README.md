# evqueue-core Docker image

## Building

``` 
docker build . --tag evqueue-frontend-react
```

## Building a specific branch

```
docker build --build-arg branch=websockets evqueue-core --tag evqueue-frontend-react:3.0
```

