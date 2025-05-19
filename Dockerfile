FROM tomcat

# Initialisation de tomcat
RUN cp -R webapps.dist/* webapps/

# Ajout d'un utilisateur admin pour accéder au manager app
RUN echo '\
<role rolename="manager-gui"/>\n\
<role rolename="manager-script"/>\n\
<role rolename="manager-jmx"/>\n\
<role rolename="manager-status"/>\n\
<role rolename="admin-gui"/>\n\
<user username="tomcat" password="tomcat" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui"/>' > /usr/local/tomcat/conf/tomcat-users.xml