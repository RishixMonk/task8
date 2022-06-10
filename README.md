1)First in docker-compose made 2 containers of same rails application building from same dockerfile,but in ports section for each container mention host ports to be 5000,5001,5002 which will connect to default port which is 3000.

2)Then in nginx container added dependecies on other two servers.

3)Then in nginx.conf added the two new containers servers link to upstream part.

4)Now by ruuning docker-compose build and docker-compose up will be able to see the website by going to localhost:8080.
