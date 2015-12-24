### To run a nginx+uwsgi+flask+mxnet web server, just run command:
#nginx
#uwsgi test.ini
or
#uwsgi runserver.ini
Be sure of your Flask project was correct configured as the requirements in this document.


Then you can visit http://server-machine-ip:specifiedPort
Note that you need to map a host port to container's 80 port


To specify nginx http port, just edit /etc/nginx/nginx.conf Line 12
default port is modified to 80

If you want run with your own Flask project, just using 
sudo docker -v yourFlaskPrjPath:~/webroot
or edit the runserver.ini to specify your own web directory
and make sure that your entry py file is named to ”main.py"
and the app object is named to "app" 


### Explanation of testserver.ini
# uwsgi socket ip
socket = 127.0.0.1:3031
# Your Flask app location
chdir=./WebApp/
# Your Flask app filename
wsgi-file=Example.py
# Your Flask app Object name (such as "app = Flask(__name__)")
callable=app

### Run command:
sudo docker run -it -v /home/joe/:/homeOfJoe -p 8080:80 -p 8888:8888 --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 --name="mxweb" joe8767/mxnet-cuda-web

uwsgi --socket 127.0.0.1:3031 --chdir ./WebApp/ --wsgi-file Example.py --master --processes 4 --threads 2 --stats 127.0.0.1:9191
