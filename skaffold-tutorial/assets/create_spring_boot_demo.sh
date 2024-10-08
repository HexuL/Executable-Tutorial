#!/bin/bash

# 项目基本信息
GROUP_ID="com.example"
ARTIFACT_ID="demo"
PACKAGE="com/example/demo"

# 创建一个新的 Maven 项目
mvn archetype:generate -DgroupId=$GROUP_ID -DartifactId=$ARTIFACT_ID -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

# 进入项目目录
cd $ARTIFACT_ID || exit

# 修改 pom.xml，添加 Spring Boot 依赖和插件
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
            <version>2.7.6</version> <!-- 添加版本号 -->
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>2.7.6</version> <!-- 添加版本号 -->
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <version>2.7.6</version> <!-- 添加版本号 -->
            <scope>test</scope>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>2.7.6</version> <!-- 添加版本号 -->
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
        </plugins>
    </build>
</project>

EOL

# 创建源代码目录结构
mkdir -p src/main/java/$PACKAGE

# 创建 Application.java 主类
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

# 创建 HelloController.java 控制器
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

# 编译并运行 Spring Boot 项目
mvn clean install
mvn spring-boot:run
