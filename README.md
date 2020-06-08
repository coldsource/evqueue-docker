# Build evQueue docker images

This repository provides Dockerfile to build your own evQueue docker images.

For documentation and binary download, [visit the official website!](http://www.evqueue.net/)

## Building

Please see :

* [compose](compose) for a ready to use environment
* [evqueue-core](evqueue-core) for the core daemon (you will need a MariaDB database to use)
* [evqueue-frontend-react](evqueue-frontend-react) for the frontend (requires core daemon)

You are not required to use the web frontend, you can also use the [Firefox plugin](https://addons.mozilla.org/fr/firefox/addon/evqueue/) which is ready to use.

### Packages

If you are looking for pre-compiled packages, see [our debian repository](https://packagecloud.io/coldsource/evqueue).
