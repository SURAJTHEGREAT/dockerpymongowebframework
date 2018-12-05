**Objective** : To containerize **python web application which uses bottle framework and pymongo** interacting with **mongodb** using containerization tools **docker and docker-compose**
Also the compose file is written dynamically so that we can integrated applications running in **different framework** without any modifications .

**Web application** : **Blog application**

**Author name** : **Suraj**

**Mail id**: **suraj.gate2013@gmail.com**

Profiles [Linkedin profile](https://www.linkedin.com/in/suraj-s-8a2a4459/)

**Steps to bring up the project**

**Step0** - Create .env in this current folder , and enter your proxy details if available as
            **proxy=**

**Step1** : In .env file - fill your proxy details if setup needs to be brought up in firewall network

**Step2** : Run **make env** to create .env files inside **conf/** folder 
            **make help** will list all other make operations that can be performed with its syntax
            
**Step3** : Fill in the neccessary details

            In conf/mongo.env - the host name and port are pre-populated with the mongo container name as in docker-compose.yaml
            
            In conf/repo.env - provide the username,password of current gituser git_repo as a default is bottle-pymongo
                                   
            In conf/config.env - provide the path where the configuration details of your mongo host and password needs to be written
            
            In conf/proxy.env - provide your proxy details
            
**Step4** - Run **make up** to bring containers            

# **TRAVIS**
The build can be seen at https://travis-ci.org/SURAJTHEGREAT/dockerpymongowebframework
