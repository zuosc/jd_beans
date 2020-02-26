docker rm -f jd_beans

docker rmi cronjob:latest


docker build -t cronjob:latest .


docker run --name jd_beans -d   --restart=always  -u root  cronjob:latest  crond -f -d 8