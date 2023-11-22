# Authorization

Authorization (AuthzServer) enabler is be responsible for the authorization phase in the access control process. The AuthzServer is capable to decouple authorization conditions from the application perspective implementing an authorization security policy. AuthzServer enabler verifies if an application previously authenticated via IdM (Identitiy Manager enabler) can perform the action requested and matches the inputs with the different rules (AND/OR rules). This video provides an easy view of both enablers working together and how user is logged in and how is shown the result of the access policy rule evaluation.

Authorization enabler is based on XACML standard security policies, results on obligations actions to be deployed after the evaluation process.

# Authorization enabler deployment

- [x] Must have docker and docker-compose installed.

### Go to the folder.
````
cd authorization/docker/authz
````

##### On the path over the docker-compose.yml file excecute on the terminal.

````
docker-compose up -d
````


# For more info on Authorization enabler see wiki page. [here](https://assist-iot-enablers-documentation.readthedocs.io/en/latest/verticals/cybersecurity/authorization_enabler.html)

# For a step by step configuration of Authorization enabler see this document. [here](docker/docs/ASSIST-IoT_AuthServer_step_by_step.pdf)

