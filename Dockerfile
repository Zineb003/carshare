FROM tomcat

# Supprimer le dossier existant pour permettre le déploiement du .war
RUN rm -rf /usr/local/tomcat/webapps/carshare-app

# Copier le .war Maven
COPY target/carshare-app.war /usr/local/tomcat/webapps/carshare-app.war

# Copie du driver JDBC
COPY conf/mysql-connector-j-9.3.0.jar /usr/local/tomcat/lib/

# Copie du fichier context.xml pour activer le JNDI
COPY conf/context.xml /usr/local/tomcat/conf/context.xml

# Copie du fichier tomcat-users.xml pour accéder au manager app
COPY conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Désactiver RemoteAddrValve dans manager/host-manager
RUN sed -i 's/^\(.*RemoteAddrValve.*\)$/<!-- \1 -->/' /usr/local/tomcat/webapps/manager/META-INF/context.xml
RUN sed -i 's/^\(.*RemoteAddrValve.*\)$/<!-- \1 -->/' /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
