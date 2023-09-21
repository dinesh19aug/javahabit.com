---
title: "Git Commit Undo: Mastering Soft and Hard Resets for Local Commits"
date: 2023-09-20T20:58:19-04:00
author: Dinesh Arora
type: post
url: /how-to-undo-local-git-commits-soft-vs-hard-reset
image: "/resources/img/maven-plugin.jpg"
keywords:
  - Maven plugin development
  - Custom Maven plugin tutorial
  - Counting project dependencies in Maven
  - Dependency analysis with Maven plugin
  - Building Maven plugins
  - Java programming with Maven
  - Maven plugin examples
  - Software build automation
  - Effective project management with Maven
  - Java development best practices
  - Software engineering tutorials
  - Maven architecture and plugins
  - Software development tools
  - Maven plugin for dependency tracking
  - Maven project optimization
categories:
  - Tech Notes
description: Learn how to create a custom Maven plugin to effortlessly count project dependencies. Dive into step-by-step guidance and code examples to streamline your development process. Master the art of dependency management with this comprehensive tutorial.
---

{{< featuredImage alt="featured image" >}}
Creating a custom Maven plugin to count the number of dependencies in a project can be a useful addition to your build process, especially when you want to keep track of your project's dependencies. Below, I'll provide a step-by-step guide along with detailed code examples to help you achieve this.

{{< youtube 11YgSprg03M >}}

{{< alert theme="info" dir="ltr" >}}

## Step 1: Project Setup

{{< /alert >}}

First, ensure you have Maven installed on your system. You can check this by running __mvn -version__ in your terminal.

Now, create a new Maven project or use an existing one where you want to add this custom plugin. For demonstration purposes, let's create a new Maven project named "DependencyCounterPluginDemo

That's when the need to undo local Git commits arises. We want to rewind the clock and make things right. Let's dig into how you can do that.

```java
mvn archetype:generate -DgroupId=com.example -DartifactId=DependencyCounterPluginDemo -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

```

Change into your project directory:

```java
cd DependencyCounterPluginDemo

```

{{< alert theme="info" dir="ltr" >}}

## Step 2: Define the Plugin in pom.xml

{{< /alert >}}

Open the __pom.xml__ file of your project and add the plugin configuration. This configuration specifies the Maven plugin you want to create and provides details about its execution.

```xml
<build>
    <plugins>
        <plugin>
            <groupId>com.javahabit</groupId>
            <artifactId>dependency-counter-plugin</artifactId>
            <version>1.0-SNAPSHOT</version>
            <executions>
                <execution>
                    <phase>compile</phase>
                    <goals>
                        <goal>count-dependencies</goal>
                    </goals>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>

```
{{< alert theme="info" dir="ltr" >}}

## Step 3: Create the Maven Plugin Project

{{< /alert >}}

Now, let's create the Maven plugin project. In your project's root directory, create a new directory named __dependency-counter-plugin__:

```xml
mkdir dependency-counter-plugin

```

{{< alert theme="info" dir="ltr" >}}

## Step 4: Implement the Plugin

{{< /alert >}}


Inside the dependency-counter-plugin directory, create a Java class that will implement the custom plugin. Let's name it DependencyCounterMojo.java:

```java
package com.example.dependencycounterplugin;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;

@Mojo(name = "count-dependencies")
public class DependencyCounterMojo extends AbstractMojo {

    public void execute() throws MojoExecutionException {
        // Your logic to count dependencies goes here
        // For demonstration, we'll just print a message.
        getLog().info("Counting dependencies...");
    }
}
```

{{< alert theme="info" dir="ltr" >}}

## Step 5: Build the Plugin

{{< /alert >}}

Back in your project's root directory (where the pom.xml is located), build the custom plugin using Maven:

```java
mvn clean install

```

This will compile your plugin and install it in your local Maven repository.
{{< alert theme="info" dir="ltr" >}}

## Step 6: Run the Plugin

{{< /alert >}}


To run the custom Maven plugin, you can execute the compile phase (or any other phase where you configured your plugin to run) of your project:

```java
mvn compile

```

In this example, we configured the custom plugin to execute during the compile phase.
{{< alert theme="info" dir="ltr" >}}

## Step 7: Implement Dependency Count Logic
{{< /alert >}}

Inside the DependencyCounterMojo class, you can implement the logic to count project dependencies. For this example, we'll use the ProjectBuilder and ArtifactResolver from the Maven API to get the project's dependencies and count them:

```java
import org.apache.maven.model.Dependency;
import org.apache.maven.model.DependencyManagement;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;
import org.apache.maven.project.MavenProject;
import org.apache.maven.project.ProjectBuildingRequest;
import org.apache.maven.project.ProjectBuildingResult;
import org.apache.maven.shared.artifact.ArtifactResolver;
import org.apache.maven.shared.artifact.DefaultArtifactCoordinate;
import org.apache.maven.shared.artifact.resolve.ArtifactResolverException;
import org.codehaus.plexus.PlexusContainer;
import org.codehaus.plexus.component.repository.exception.ComponentLookupException;
import org.codehaus.plexus.logging.Logger;

import java.util.List;

@Mojo(name = "count-dependencies")
public class DependencyCounterMojo extends AbstractMojo {

    // Define the components we need to interact with Maven's internals
    private PlexusContainer container;
    private MavenProject project;
    private Logger logger;
    private ArtifactResolver artifactResolver;

    public void execute() throws MojoExecutionException {
        try {
            // Fetch the project's dependencies
            List<Dependency> dependencies = project.getDependencies();

            // Fetch dependencies from dependency management if present
            DependencyManagement dependencyManagement = project.getDependencyManagement();
            if (dependencyManagement != null) {
                dependencies.addAll(dependencyManagement.getDependencies());
            }

            int dependencyCount = dependencies.size();
            getLog().info("Total number of dependencies: " + dependencyCount);
        } catch (Exception e) {
            throw new MojoExecutionException("Error counting dependencies", e);
        }
    }
}

```
{{< alert theme="info" dir="ltr" >}}
## Step 8: Run the Plugin
{{< /alert >}}

Execute the custom Maven plugin by running the following Maven command in your project's root directory:

```java
mvn compile

```
This will execute the __count-dependencies__ goal of your custom plugin during the compile phase, and it will print the total number of dependencies in your project.

Congratulations! You've created a custom Maven plugin to count the number of dependencies in your project. You can further enhance this plugin to perform additional tasks or integrate it into your build process as needed.

Happy Coding!