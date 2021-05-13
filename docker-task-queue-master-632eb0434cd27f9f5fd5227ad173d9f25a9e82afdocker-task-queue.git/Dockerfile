# 这是服务器环境的Docker,会安装好php,nginx等环境，并且进行配置
# author:jiangpengfei
# date: 2017-04-19

FROM ubuntu:16.04
RUN apt-get update --fix-missing\
    && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libssl1.0 \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libgd-dev \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libcurl4-openssl-dev \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libjpeg-dev \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libpng-dev \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libfreetype6-dev

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-imagick

# RUN DEBIAN_FRONTEND=noninteractive apt-get install -y spawn-fcgi


RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php7.0
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-redis
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-mysql 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-mbstring 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-gd 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-curl 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-mongodb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-bcmath
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php-xml
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor \
    && apt-get autoremove \
    && apt-get autoclean
# 上面是从ubuntu的源中安装必要组件，下面开始进行配置
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld64.so.1

# RUN mkdir /home/search/ \
#     && mkdir /etc/search/

##设置语言环境，防止中文乱码
ENV LANG C.UTF-8

#设置redis
COPY redis/redis.so /usr/lib/php/20151012/
COPY redis/redis.ini /etc/php/7.0/fpm/conf.d/

#设置php_dv
COPY php_dv/php_dv.so /usr/lib/php/20151012/
COPY php_dv/php_dv.ini /etc/php/7.0/fpm/conf.d/
COPY php_dv/php_dv.ini /etc/php/7.0/cli/conf.d/
COPY php_dv/libphpx.so /usr/lib/

#设置md2pic
COPY md2pic/md2pic.so /usr/lib/php/20151012/
COPY md2pic/md2pic.ini /etc/php/7.0/fpm/conf.d/
COPY md2pic/md2pic.ini /etc/php/7.0/cli/conf.d/

#设置opencc4php
COPY opencc4php/20151012/opencc.so /usr/lib/php/20151012/
COPY opencc4php/20151012/opencc.ini /etc/php/7.0/fpm/conf.d/
COPY opencc4php/20151012/opencc.ini /etc/php/7.0/cli/conf.d/
COPY opencc4php/ubuntu16.04/libopencc.so.2 /usr/lib/

COPY mail_supervisor.conf /etc/supervisor/conf.d/
COPY post_supervisor.conf /etc/supervisor/conf.d/
COPY delete_post_supervisor.conf /etc/supervisor/conf.d/
COPY msg_supervisor.conf /etc/supervisor/conf.d/
COPY delete_question_supervisor.conf /etc/supervisor/conf.d/
COPY question_supervisor.conf /etc/supervisor/conf.d/
COPY im_supervisor.conf /etc/supervisor/conf.d/
COPY FamilyTreePDFProcess.conf /etc/supervisor/conf.d/
COPY ocr-task.conf /etc/supervisor/conf.d/
COPY info_supervisor.conf /etc/supervisor/conf.d/
COPY delete_info_supervisor.conf /etc/supervisor/conf.d/
COPY infoPostProcess.conf /etc/supervisor/conf.d/
COPY deleteInfoProcess.conf /etc/supervisor/conf.d/

COPY start.sh /usr/local/bin

CMD ["start.sh"]
