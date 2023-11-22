# Use the DockerCompose_EnvSet to set the environment for docker containers.
### Run as root
````
chmod 777 DockerCompose_EnvSet
````

### Run as root with the tag -i to install
````
./DockerCompose_EnvSet -i
````

# Initiate all the services using InitService
### This is for simplify the Authz deployment.

````
    HELP

        Inicialization services for Authorization Server

        OPTIONS FLAGS:

        * start
            Starting the authorization server.

            * -b
                Building from source the Authorization Server and starting all services. 
        
        * stop
            Stopping the authorization server.
        
        * -l
            Showing the authorization server logs.
        
        * -s
            Showing the authorization services running.

        * -h
            Showing the help.


        EXAMPLE WITH OPTIONS FLAGS USSAGE:

        * python3 InitService.py start

        * ./InitService start


        * python3 InitService.py start -b

        * ./InitService start -b


        * python3 InitService.py stop

        * ./InitService stop


        * python3 InitService.py -l

        * ./InitService -l


        * python3 InitService.py -s

        * ./InitService -s

````
# Installation


### Starting the authorization server and building from source code.
````
./InitService start -b
````

````
python3 InitService.py start -b
````

### Starting the authorization server.
````
./InitService start
````

````
python3 InitService.py start
````

### Stoping the authorization server.
````
./InitService stop
````

````
python3 InitService.py stop
````

### Showing Help.
````
./InitService -h
````

````
python3 InitService.py -h
````

## AuthServer

### Verify you ip address bind to the internet.
````
clear;!sudo apt install net-tools -qq 2>/dev/null >/dev/null;clear && IP=$(ip addr show $(route | grep '^default' | grep -o '[^ ]*$') | awk {'print $1,$2'} |grep -oE 'inet \b([0-9]{1,3}\.){3}[0-9]{1,3}\b' |awk {'print $2'}); echo -e "\e[1;31m $IP \e[0m"
````

#### *$IP* will be you ip address.
````
$IP
````
#### Authz Server url.
````
http://$IP:9000/authzserver
````

