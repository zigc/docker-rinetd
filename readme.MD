# rinetd

## Usage

Simple run:
```shell
docker run -d --name [proxy] -p [new-port]:8000 zigac/rinetd [host] [port]
```

Web example:
```shell
# run a web server
docker run --name web -p 8080:8080 -d zigac/hello-web

# Run a port proxy with link:
docker run --name web-proxy -p 8000:8000 --link web:web -d zigac/rinetd web 8080

# Run a port proxy without link:
docker run --name web-proxy -p 8000:8000 -d zigac/rinetd [IP] 8080
```

MySQL example:
```shell
# run a mysql server
docker run --name mysql -d mysql

# Run a port proxy with link:
docker run --name mysql-proxy -p 3306:8000 --link mysql:mysql -d zigac/rinetd mysql 3306
```
