# carshare
-> cd carshare

-> sudo apt install docker-cli
     sudo apt install docker-compose

-> sudo docker-compose up --build

(user:tomcat & passwd:tomcat)
phpmyadmin : localhost:8091
app : localhost:8090/carshare-app

apres chaque modification faire : 
sudo docker-compose down -v --rmi all
mvn clean install 
puis recopier coller dans /var/lib/tomcat10/webapp
sudo  docker-compose up --build
