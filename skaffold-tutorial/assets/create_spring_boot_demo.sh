#!/bin/bash


GROUP_ID="com.example"
ARTIFACT_ID="demo"
PACKAGE="com/example/demo"


if [ -d "$ARTIFACT_ID" ]; then
  echo " $ARTIFACT_ID is already exist"
  rm -rf $ARTIFACT_ID
fi


mvn archetype:generate -DgroupId=$GROUP_ID -DartifactId=$ARTIFACT_ID -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false


cd $ARTIFACT_ID || exit


cat > pom.xml <<EOL
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>$GROUP_ID</groupId>
    <artifactId>$ARTIFACT_ID</artifactId>
    <version>1.0-SNAPSHOT</version>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
            <version>2.7.6</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>2.7.6</version>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>2.7.6</version>
                <configuration>
                    <!-- Main class to run the application -->
                    <mainClass>$GROUP_ID.demo.Application</mainClass>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>11</source>
                    <target>11</target>
                </configuration>
            </plugin>
            <!-- Jib Plugin Configuration -->
            <plugin>
                <groupId>com.google.cloud.tools</groupId>
                <artifactId>jib-maven-plugin</artifactId>
                <version>1.8.0</version>
                <configuration>
                    <!-- Base image (JDK version) -->
                    <from>
                        <image>openjdk:11-jre-slim</image>
                    </from>

                    <!-- Destination image repository -->
                    <to>
                        <image>docker.io/${docker.image.prefix}/demo</image>
                        <tags>
                            <tag>${project.version}</tag>
                        </tags>
                    </to>

                    <!-- Main class configuration -->
                    <container>
                        <mainClass>com.example.demo.Application</mainClass>
                        <user>nobody</user>
                        <ports>
                            <port>8080</port>
                        </ports>
                    </container>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
EOL

EOL


mkdir -p src/main/java/$PACKAGE


cat > src/main/java/$PACKAGE/Application.java <<EOL
package $GROUP_ID.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
EOL


cat > src/main/java/$PACKAGE/HelloController.java <<EOL
package $GROUP_ID.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HelloController {

    @RequestMapping("/hello")
    public String hello() {
        StringBuilder message = new StringBuilder("Hello Skaffold!");
        try {
            InetAddress ip = InetAddress.getLocalHost();
            message.append(" From host: ").append(ip);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        return message.toString();
    }
}
EOL

rm -rf src/test


echo "The Spring Boot project has been created. You can run the project using the following command in the demo directory:"
echo "mvn spring-boot:run"
