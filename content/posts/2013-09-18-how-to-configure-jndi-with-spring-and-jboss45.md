---
title: How to configure JNDI with Spring and Jboss4/5
author: Dinesh
type: post
date: 2013-09-18T19:27:26+00:00
url: /2013/09/18/how-to-configure-jndi-with-spring-and-jboss45/
publicize_twitter_user:
  - dinesh19aug
  - dinesh19aug
dsq_thread_id:
  - 5447344056
  - 5447344056
categories:
  - Tech Notes

---
This is a simple process but if you try and search on the web you will come across various incomplete solutions which will leave you more confused than you already were. This configuration involves just four simple steps that I will walk through to help you set up JNDI on Jboss. I am using Jboss 4.3, but this should be valid for other version of Jboss as well.

I have a web application which is built on Spring 3.2 and uses Hibernate 4. To set up a new JNDI configuration we will first create a datasource xml file. This file needs to be deployed in Jboss/Deploy folder along with your war file.

_Step 1:_

Create a datasource file oracle-ds.xml. The content of the file will look like this
```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE datasources PUBLIC -//JBoss//DTD JBOSS JCA Config 1.5//EN" http://www.jboss.org/j2ee/dtd/jboss-ds_1_5.dtd">

<datasources>

  <local-tx-datasource>

    <jndi-name><strong>jdbc/listener-dss </jndi-name>

    <connection-url>jdbc:oracle:thin:@dbsrvossdevl:1521:US91</connection-url>

    <driver-class>oracle.jdbc.driver.OracleDriver</driver-class>

    <user-name>myuser</user-name>

    <password>mypassword</password>

    <min-pool-size>5</min-pool-size>

    <max-pool-size>50</max-pool-size>

    <idle-timeout-minutes>10</idle-timeout-minutes>

    <exception-sorter-class-name>org.jboss.resource.adapter.jdbc.vendor.OracleExceptionSorter</exception-sorter-class-name>

    <metadata>

      <type-mapping>Oracle9i</type-mapping>

    </metadata>

  </local-tx-datasource>

</datasources>
```


__Explanation:__
```xml
 <jndi-name>jdbc/listener-dss </jndi-name>
```
  This line tells what is the jndi name that we are going to use across configuration files.



_Step_  2:  Now open your web.xml file and add the resource-ref. This tells that jee container that your web application is using JNDI.

Your web.xml should be under WEB-INF  folder. Add the below lines in your web.xml (<strong>see the highlighted section ). This step is common whether you use Jboss or Tomcat or Websphere or any other application server.

```xml

<?xml version="1.0" encoding="UTF-8"?>

<web-app version="2.5" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

  xsi:schemaLocation="http://java.sun.com/xml/ns/javaee

  http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">

  <display-name>ACN Web Application</display-name>



    <servlet>

        <servlet-name>listener</servlet-name>

        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>

        <load-on-startup>1</load-on-startup>

    </servlet>



    <servlet-mapping>

        <servlet-name>listener</servlet-name>

        <url-pattern>/</url-pattern>

    </servlet-mapping>



    <context-param>

        <param-name>contextConfigLocation</param-name>

        <param-value>/WEB-INF/listener-servlet.xml</param-value>

    </context-param>

    <resource-ref>

         <description>Listener Database</description>

         <res-ref-name>jdbc/listener-dss</res-ref-name>

         <res-type>javax.sql.DataSource</res-type>

         <res-auth>Container</res-auth>

     </resource-ref>



    <listener>

        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>

    </listener>



  <welcome-file-list>

    <welcome-file>index.jsp</welcome-file>

  </welcome-file-list>



</web-app>
```


_Step 3_:  Next we will update the Spring context xml file to tell the Spring container that it needs to do a JNDI look up. My Spring context file name is listener-servlet.xml and this is under __WEB-INF__ folder. Add the following(See highlighted section)

```xml
<beans xmlns="http://www.springframework.org/schema/beans"

       xmlns:context="http://www.springframework.org/schema/context"

       xmlns:mvc="http://www.springframework.org/schema/mvc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xmlns:p="http://www.springframework.org/schema/p"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context-3.0.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
        http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx.xsd >
        <context:component-scan base-package="com.acn.cslistener" />
    <mvc:annotation-driven />
    <tx:annotation-driven/>
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix">
            <value>/WEB-INF/pages/</value>
        </property>
        <property name="suffix">
            <value>.jsp</value>
        </property>
    </bean>
   <bean id="sessionFactory" class="org.springframework.orm.hibernate4.LocalSessionFactoryBean">
         <property name="dataSource" ref="dataSource"/>
         <property name="hibernateProperties">
             <props>
                 <prop key="hibernate.dialect">org.hibernate.dialect.Oracle10gDialect</prop>
                 <prop key="hibernate.show_sql">true</prop>
             </props>
         </property>
         <property name="packagesToScan" value="com.acn.cslistener" />
     </bean>
      <bean id="dataSource" class="org.springframework.jndi.JndiObjectFactoryBean">
         <property name="jndiName" value="java:comp/env/jdbc/listener-dss"/>
     </bean>
    <bean id="transactionManager" class="org.springframework.orm.hibernate4.HibernateTransactionManager"
          p:sessionFactory-ref="sessionFactory">
    </bean>
    <bean id="persistenceAnnotation" class="org.springframework.orm.jpa.support.PersistenceAnnotationBeanPostProcessor" />
</beans>

```  

_Step 4:_  This is the crucial step. If you are using Jboss then it requires that you tell the web container that Jboss will provide the datasource .xml file where you have defined your jndi properties. Create a new file <strong>jboss-web.xml.  Place this file under <strong>WEB-INF  folder. The contents of the file whould like this.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<jboss-web>

    <resource-ref>

        <res-ref-name>jdbc/listener-dss</res-ref-name>

        <res-type>javax.sql.DataSource</res-type>

        <jndi-name>java:/jdbc/listener-dss</jndi-name>

    </resource-ref>

</jboss-web>

```  

That's all we need to do.



~~~~ Ciao.
