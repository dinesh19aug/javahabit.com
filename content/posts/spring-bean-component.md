---
title: "Spring Bean vs Spring Component"
author: Dinesh
date: 2018-12-30T00:35:54-05:00

type: post
url: /2018/12/30/spring-bean-vs-component/
categories:
  - Tech Notes
---
# **The Difference Between @Bean and @Component and When to Use What?**

This is the most common question that new as well as experienced Spring users get confused about. There are literally hundreds of questions on this [Stackoverflow](https://www.stackoverflow.com). This article will clear all the confusion.

>### Similarities between  **@Bean** and **@Autowired**

**@Bean**

- *@Bean*  is an annotation based configuration and hence is used in *@Configuration* based class.
- This is an <u>**explicit**</u> way of defining a bean and is also used on the methods defined in configuration class.

**@Component**
- This is used in classes which you create in your app. This will only work after you enable component scan on the package that contains your class.
- With component scan, Spring framework will scan the classpath and add all the classes that are marked with a *@Component* annotation.
-This is also called the automated way of binding and discovering your bean.

So the bottom line is that both can do the job of wiring your bean. It's just that with *@Bean* you have to define each class explicitly and in case of *@Component*, Spring does this automatically for you. The *@Bean* way of wiring your bean is analogous to defining Beans in XML, prior to Spring 2.5. Now that you understand what each does(the end result is the same), let's take a look at what is the difference between the two and when you should choose one over the other.

>### Difference between **@Bean** and **@Autowired**

**Scenario**: We have a jar file which contains different services ex - Address check service, credit check service etc. This jar file is shared by many different applications/companies Ex - AT&T wants to use Address validator service while FICO wants to use only credit check service.

If you use *@Component* on those service classes and use component scan in the application, then both AT&T and FICO applications will end up detecting credit check in case of AT&T and address validator in case of FICO. As a result, you would face one of the two problems -
+ You will end up adjusting the filter on the component scan.
+ In case you have classes sharing the same name by any chance then you would have to add qualifier otherwise application would complain that it found more than two classes were found with same bean name and will fail to run.

Hence, in this scenario, you should use *@Bean*

**Scenario** : You downloaded a jar file from GitHub and it is not using Spring. The jar file is a simple and basic java program. Your app wants to use this third-party jar file but since your application is using Spring while the third party jar is not, you will have to write **new()** keyword to access the functionalities. You want to wire the third party classes.

Say your class name is MyClass.java and you want to use ThirdPartyClass.java. In this case if you write
```java

public class MyClass{
   .....
	 @Autowired
	 ThirdPartyClass thirdPartyClass;

}

```
 Your code will throw *NullPointerException* if you try and access any method of class object *thirdPartyClass*. In this scenario, you should use  *@Bean*.


>### Rule of Thumb

A simple way to decide between **@Component** and **@Bean** is that
- if you want to use third-party classes or jar then use *@Bean*.
- If you are writing your own classes for your application then use *Component*.
- If you want to use a third party class or jar that is not written using Spring Component then use *@Bean*.
