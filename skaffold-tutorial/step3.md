# Creating the Demo Application

In this section, we'll create a simple Spring Boot demo application using Spring MVC to create a REST endpoint that returns a welcome message.

To create this demo application using a script, you can use the provided `create_spring_boot_demo.sh` script. This script will automatically generate the necessary project structure and files for you. Before using script, you need install maven.

`sudo apt update`

`sudo apt install maven -y`

And also update permission:

`chmod +x /root/test/create_spring_boot_demo.sh`

Then you can using script:

 `/root/test/create_spring_boot_demo.sh`

Once the project is created, you can **navigate into the project directory(demo)** and run the following command to start the Spring Boot application:

`mvn spring-boot:run`

This will start the Spring Boot application, and you can access the `/hello` endpoint to see the welcome message. In Killercoda using command:

`curl http://localhost:8080/hello`

If everything going well, you will see:

*Hello Skaffold! From host: ubuntu/127.0.0.1*

 