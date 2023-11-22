FROM tomcat:7

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY FedAuthzPDP.war /usr/local/tomcat/webapps/pdp.war
CMD ["catalina.sh","run"]
