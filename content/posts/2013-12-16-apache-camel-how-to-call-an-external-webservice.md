---
title: 'Apache Camel : How to call  java webservice'
author: Dinesh
type: post
date: 2013-12-16T03:55:12+00:00
url: /2013/12/16/apache-camel-how-to-call-an-external-webservice/
publicize_facebook_url:
  - https://facebook.com/10152123374678698
  - https://facebook.com/10152123374678698
publicize_twitter_user:
  - dinesh19aug
  - dinesh19aug
publicize_twitter_url:
  - http://t.co/d5YszNc2eq
  - http://t.co/d5YszNc2eq
publicize_linkedin_url:
  - 'http://www.linkedin.com/updates?discuss=&scope=20656194&stype=M&topic=5818196411220512769&type=U&a=3zgu'
  - 'http://www.linkedin.com/updates?discuss=&scope=20656194&stype=M&topic=5818196411220512769&type=U&a=3zgu'
snapIP:
  - 's:252:"a:1:{i:0;a:8:{s:4:"doIP";s:1:"1";s:12:"rpstPostIncl";s:7:"nxsi0ip";s:11:"SNAPformatT";s:7:"%TITLE%";s:10:"SNAPformat";s:9:"%EXCERPT%";s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:9:"574571257";s:5:"pDate";s:19:"2015-04-30 22:57:39";}}";'
  - 's:252:"a:1:{i:0;a:8:{s:4:"doIP";s:1:"1";s:12:"rpstPostIncl";s:7:"nxsi0ip";s:11:"SNAPformatT";s:7:"%TITLE%";s:10:"SNAPformat";s:9:"%EXCERPT%";s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:9:"574571257";s:5:"pDate";s:19:"2015-04-30 22:57:39";}}";'
snap_MYURL:
  -
  -
snapEdIT:
  - 1
  - 1
snapDI:
  - 's:102:"a:1:{i:0;a:3:{s:4:"doDI";s:1:"1";s:11:"SNAPformatT";s:7:"%TITLE%";s:10:"SNAPformat";s:9:"%EXCERPT%";}}";'
  - 's:102:"a:1:{i:0;a:3:{s:4:"doDI";s:1:"1";s:11:"SNAPformatT";s:7:"%TITLE%";s:10:"SNAPformat";s:9:"%EXCERPT%";}}";'
snapDL:
  - 's:130:"a:1:{i:0;a:4:{s:4:"doDL";s:1:"1";s:12:"rpstPostIncl";s:1:"0";s:11:"SNAPformatT";s:7:"%TITLE%";s:10:"SNAPformat";s:9:"%EXCERPT%";}}";'
  - 's:130:"a:1:{i:0;a:4:{s:4:"doDL";s:1:"1";s:12:"rpstPostIncl";s:1:"0";s:11:"SNAPformatT";s:7:"%TITLE%";s:10:"SNAPformat";s:9:"%EXCERPT%";}}";'
snapFB:
  - 's:281:"a:1:{i:0;a:9:{s:4:"doFB";s:1:"1";s:12:"rpstPostIncl";s:1:"0";s:8:"postType";s:1:"I";s:10:"AttachPost";s:1:"2";s:10:"SNAPformat";s:51:"New post (%TITLE%) has been published on %SITENAME%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";}}";'
  - 's:281:"a:1:{i:0;a:9:{s:4:"doFB";s:1:"1";s:12:"rpstPostIncl";s:1:"0";s:8:"postType";s:1:"I";s:10:"AttachPost";s:1:"2";s:10:"SNAPformat";s:51:"New post (%TITLE%) has been published on %SITENAME%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";}}";'
snapLI:
  - 's:293:"a:1:{i:0;a:9:{s:4:"doLI";s:1:"1";s:12:"rpstPostIncl";s:1:"0";s:10:"AttachPost";s:1:"1";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";}}";'
  - 's:293:"a:1:{i:0;a:9:{s:4:"doLI";s:1:"1";s:12:"rpstPostIncl";s:1:"0";s:10:"AttachPost";s:1:"1";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";}}";'
dsq_thread_id:
  - 5292097481
  - 5292097481
categories:
  - Tech Notes

---
I have made up my mind to get rid of WSO2 ESB at my office. It is clumsy, buggy, hard to test, no body wants to work on it and the documentation is horrible. I looked at various alternative and <a title="Apache Camel" href="http://camel.apache.org/" target="_blank">Apache Camel</a> was free and easy to set up and work with me.

To cut the story short, I was able to run most of the example but was struggling with <a title="CXF" href="http://cxf.apache.org/" target="_blank">CXF</a> to call a third party service hosted at a random url. The documentation on the website is focused on exposing web service built in <a title="Apache Camel" href="http://camel.apache.org" target="_blank">Camel</a>. I was finally able to figure this out with a couple of slide show on slideshare.

Here's the scenario: I have a third party webservice hosted on the web which gives you the the conversion rate between two currencies. I am going to call this web service and log the response.

As usual I will start from scratch. My webservice is hosted at this url -<a title="http://www.webservicex.net/CurrencyConvertor.asmx?WSDL" href="http://www.webservicex.net/CurrencyConvertor.asmx?WSDL" target="_blank">http://www.webservicex.net/CurrencyConvertor.asmx?WSDL</a>. This webservice exposes a operation called - &#8220;ConversionRate".

I am using Fuse Ide(free - Developer version) but you can use Intellij Or Eclipse.

Prerequisites - Must have Maven.

__Step 1:__ Create a new Camel-Spring project.

__Step 2:__ Add the following dependencies in your __pom.xml. &#8220;camel-cxf"__

```xml
<scope><dependency>

      <groupId>org.apache.camel</groupId>

      <artifactId>camel-cxf</artifactId>

      <version>2.10.0.redhat-60024</version>

    </dependency></scope>
```

My pom.xml looks like this -

```xml

<!-?xml version="1.0" encoding="UTF-8"?>

 xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">

  

   <modelVersion>4.0.0</modelVersion>

  

   <groupId>com.mycompany</groupId>

   <artifactId>camel-spring</artifactId>

   <packaging>jar</packaging>

   <version>1.0.0-SNAPSHOT</version>

   <name>A Camel Spring Route</name>

   <url>http://www.myorganization.org</url>

   <properties>

     <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>

     <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>

   </properties>

   <repositories>

     <repository>

      <id>release.fusesource.org</id>

       FuseSource Release Repository

       <url>http://repo.fusesource.com/nexus/content/repositories/releases</url>

       <snapshots>

         <enabled>false</enabled>

       </snapshots>

       <releases>

         <enabled>true</enabled>

       </releases>

     </repository>

     <repository>

       <id>snapshot.fusesource.org</id>

       FuseSource Snapshot Repository

       <url>http://repo.fusesource.com/nexus/content/repositories/snapshots</url>

       <snapshots>

         <enabled>true</enabled>

       </snapshots>

       <releases>

         <enabled>false</enabled>

       </releases>

     </repository>

   </repositories>

   <pluginRepositories>

     <pluginRepository>

       <id>release.fusesource.org</id>

       FuseSource Release Repository

       <url>http://repo.fusesource.com/nexus/content/repositories/releases</url>

       <snapshots>

         <enabled>false</enabled>

       </snapshots>

       <releases>

         <enabled>true</enabled>

       </releases>

     </pluginRepository>

     <pluginRepository>

       <id>snapshot.fusesource.org</id>

       FuseSource Snapshot Repository

       <url>http://repo.fusesource.com/nexus/content/repositories/snapshots</url>

       <snapshots>

         <enabled>true</enabled>

       </snapshots>

       <releases>

         <enabled>false</enabled>

       </releases>

     </pluginRepository>  

   </pluginRepositories>

  

   <dependencies>

     <dependency>

       <groupId>org.apache.camel</groupId>

       <artifactId>camel-core</artifactId>

       <version>2.10.0.redhat-60024</version>

     </dependency>

     <dependency>

       <groupId>org.apache.camel</groupId>

       <artifactId>camel-spring</artifactId>

       <version>2.10.0.redhat-60024</version>

     </dependency>

     <!- logging ->

     <dependency>

       <groupId>org.slf4j</groupId>

       <artifactId>slf4j-api</artifactId>

       <version>1.6.6</version>

     </dependency>

     <dependency>

       <groupId>org.slf4j</groupId>

       <artifactId>slf4j-log4j12</artifactId>

       <version>1.6.6</version>

     </dependency>

     <dependency>

       <groupId>log4j</groupId>

       <artifactId>log4j</artifactId>

       <version>1.2.17</version>

     </dependency>

     <!- testing ->

     <dependency>

       <groupId>org.apache.camel</groupId>

       <artifactId>camel-test-spring</artifactId>

       <version>2.10.0.redhat-60024</version>

       <scope>test</scope>

     </dependency>

 <dependency>

       <groupId>org.apache.camel</groupId>

       <artifactId>camel-cxf</artifactId>

       <version>2.10.0.redhat-60024</version>

     </dependency>

   </dependencies>

   <build>

     <defaultGoal>install</defaultGoal>

     <plugins>

       <plugin>

         <groupId>org.apache.maven.plugins</groupId>

         <artifactId>maven-compiler-plugin</artifactId>

         <version>2.5.1</version>

         <configuration>

           <source>1.6</source>

           <target>1.6</target>

         </configuration>

       </plugin>

       <plugin>

         <groupId>org.apache.maven.plugins</groupId>

         <artifactId>maven-resources-plugin</artifactId>

         <version>2.4.3</version>

         <configuration>

           <encoding>UTF-8</encoding>

         </configuration>

       </plugin>

       <!- allows the route to be ran via mvn camel:run ->

       <plugin>

         <groupId>org.apache.camel</groupId>

         <artifactId>camel-maven-plugin</artifactId>

         <version>2.10.0.redhat-60024</version>

       </plugin>

     </plugins>

   </build>

 </project>
```
__Step 2:__ Under src/main.resources/META-INF folder(if not there then create one) create file called __camel-context.xml__ Your camel file should like this -

```xml
 <?xml version="1.0" encoding="UTF-8"?>

 xmlns="http://www.springframework.org/schema/beans"

         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

         xmlns:cxf="http://camel.apache.org/schema/cxf"

         xsi:schemaLocation="

         http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd

         http://camel.apache.org/schema/cxf http://camel.apache.org/schema/cxf/camel-cxf.xsd

         http://camel.apache.org/schema/spring http://camel.apache.org/schema/spring/camel-spring.xsd">

 <cxf:<span class="hiddenSpellError">cxfEndpoint id="wsdlEndpoint"

                      address="http://www.webservicex.net/CurrencyConvertor.asmx"

                      endpointName="c:SOAPOverHTTP"

                      serviceName="c:CurrencyConvertor"

                      xmlns:s="http://www.webserviceX.NET"/>

   

   <camelContext xmlns="http://camel.apache.org/schema/spring">

   <route>

         here is a sample which processes the input files

          (leaving them in place - see the &#8216;noop' flag)

          then performs content based routing on the message using XPath</description>

         src/data/order?noop=true"/>

         <log message="${body}"/>

         wsdl&serviceName={http://www.webserviceX.NET/}CurrencyConvertor&portName={http://www.webserviceX.NET/}CurrencyConvertorSoap&dataFormat=MESSAGE"/>

          <log message="${body}"/>

     </route>

 </camelContext>

  

 </beans>
```
__Step 4:__ Place the payload or input data xml in src/data/input/order.xml. The __order.xml__ should like this -
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://www.webserviceX.NET/">

    <soapenv:Header/>

    <soapenv:Body>

       <web:ConversionRate>

          <web:FromCurrency>AUD</web:FromCurrency>

          <web:ToCurrency>USD</web:ToCurrency>

       </web:ConversionRate>

    <!-<span class="hiddenSpellError">soapenv:Body>->

</soapenv:Envelope>
```

That's it!!!!
The interesting part is all in the camel-context.xml. Here's what is happening in this file

> src/data/order?noop=true"/>

This line reads the file order.xml. The option noop=true makes the file to be read again and again. By default this values is false. If this value is false, then after one read, camel marks it as read and when you run the example for second time, it will not read this file.

> <log message="${body}"/>

This line will simply log the contents of __order.xml.__

>serviceName={http://www.webserviceX.NET/}CurrencyConvertor&portName={http://www.webserviceX.NET/}CurrencyConvertorSoap&dataFormat=MESSAGE"/>

This line tells __cxf__ component that it needs to call the webservice -  
>http://www.webservicex.net/CurrencyConvertor.asmx?wsdl

-URL - is the url of the wsdl 
>http://www.webservicex.net/CurrencyConvertor.asmx?wsdl

>   serviceName - is the name of the service. Remember it is the name of teh service not the oepration!! The value between {} is the namespace. If you do not want to write {http://&#8230;.} then add another tag_xmlns >  {http://www.webserviceX.NET/}CurrencyConvertor. 
>   portName - is the name of the port.

> portName={http://www.webserviceX.NET/}CurrencyConvertorSoap. This is again preceded by {http://&#8230;} which is the namespace value. This value is defined in the wsdl as -<wsdl:port name="CurrencyConvertorSoap" binding="tns:CurrencyConvertorSoap">

The last piece is __dataFormat__ - __dataFormat=MESSAGE__ This tells that the body is of type message.

__Part 2__ - In production you would want to avoid writing cxf in the above format as it is prone to error because the string value is very long and difficult to test independently and cannot be reused if you want to call the service in another route. So the best way is to define this as cxf endpoint. All you need to do is slightly modify the __camel-context.xml__

  1. Add this(be sure to remove the earlier version of <to uri="cxf&#8230;.")

> <to uri="cxf:bean:wsdlEndpoint?dataFormat=MESSAGE"/>

  1. Define the cxf endpoint called __wsdlEndpoint__ (You call it whatever you want).
```xml
 <cxf:<span class="hiddenSpellError">cxfEndpoint id="wsdlEndpoint"

                     address="http://www.webservicex.net/CurrencyConvertor.asmx"

                     endpointName="c:SOAPOverHTTP"

                     serviceName="c:CurrencyConvertor"

                     xmlns:s="http://www.webserviceX.NET"/>
```
That's it.

Now just run the app. This will print the following-
```xml
 [ead #0 - file://src/data/order] route1                         INFO

<soapenv:Header/>

<soapenv:Body>

<web:ConversionRate>

<web:FromCurrency>AUD</web:FromCurrency>

<web:ToCurrency>USD</web:ToCurrency>

</web:ConversionRate>

</soapenv:Body>->

</soapenv:Envelope>->


```
~ Enjoy Cameling &#8230;.
