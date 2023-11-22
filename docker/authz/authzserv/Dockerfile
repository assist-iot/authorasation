FROM tomcat:7

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/conf/context.xml
COPY FedAuthz.war /usr/local/tomcat/webapps/authzserver.war
CMD ["catalina.sh","run"]
