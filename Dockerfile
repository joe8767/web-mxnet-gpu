# Start with CUDA base image
FROM kaixhin/cuda-mxnet
MAINTAINER Machine Intellegence Lab at SCU "http://www.machineilab.org"

#### install web components begin

RUN apt-get update

RUN apt-get install -y build-essential 

RUN apt-get install -y python python-dev python-setuptools

# install nginx
RUN apt-get install -y nginx

RUN apt-get install -y python-pip

# install uwsgi
RUN pip install uwsgi

RUN pip install Flask

# Add nginx conf 
RUN rm /etc/nginx/nginx.conf
ADD Example/nginx.conf /etc/nginx/

# Add uwsgi ini  testserver.ini runserver.ini
RUN mkdir ~/example
ADD Example/testserver.ini ~/example/
ADD Example/runserver.ini ~/example/

# Add example Example.py
RUN mkdir ~/example/WebApp
ADD Example/WebApp/Example.py ~/example/WebApp/

# Add readme
ADD Example/Readme ~/example/ 

WORKDIR ~/example/

#### install web components end

#### install jupyter begin

RUN pip install ipython

RUN pip install notebook

#### install jupyter end

# CMD ["nginx"]

EXPOSE 80