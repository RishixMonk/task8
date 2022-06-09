1)Created two dockerfiles one for building railsapp and other for ngnix.

2)Now creating nginx.conf files which informs nginx where to direct page requests to.

3)Then in nginx dockerfile downloading nginx image and copying nginx.conf file

4)Finally,creating docker-compose file which says building images for railsapp,nginx and coonecting postgres database to railsapp.

5)Now running localhost:8080 should open the website.

