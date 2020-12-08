docker kill mean-test
docker build -t mean-test .
docker run -it -p 8080:8080 mean-test