创建容器,在出现404的情况下使用--no-cache参数，不使用缓存
docker build -t xinhuo_task_queue:1.0 .

启动容器的执行语句,内部9090端口是网站服务(-d参数可以daemon方式运行):
docker run -v /etc/localtime:/etc/localtime:ro -d --name xinhuo_task_queue_1_3 -it -v /alidata/www/family-task-queue:/var/www/family-task-queue joyme/xinhuo_task_queue_server:1.3

正式服务器
docker run -v /etc/localtime:/etc/localtime:ro -d --name xinhuo_task_queue_1_3 -it -v /var/www/family-task-queue:/var/www/family-task-queue joyme/xinhuo_task_queue_server:1.3


进入容器的语句:
PID=$(docker inspect --format "{{ .State.Pid }}" <container>)
nsenter --target $PID --mount --uts --ipc --net --pid

列出镜像
docker ps

移除某个镜像服务
docker rm server_name

tag 服务
docker tag xinhuo_task_queue:1.0 joyme/xinhuo_task_queue_server:1.3

push

docker push joyme/xinhuo_task_queue_server:1.3