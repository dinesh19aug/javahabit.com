---
title: "Mockito and PowerMock: How to Test Final and Static Methods with Ease"
date: 2023-04-25T12:40:27-04:00
author: Dinesh Arora
type: post
url: /2023/04/25/Mockito-PowerMock-Test-Final-Static-Methods
image: "/resources/img/mocking-static-method-calls-with-mockito.png"
keywords:
  - Java
  - Mockito
  - PowerMockito
  - final
  - static
  - junit
categories:
  - Tech Notes
description: How to use Mockito with PowerMock to test final and static methods in Java. It outlines a step-by-step guide, from adding necessary dependencies to verifying method calls.
---

{{< featuredImage alt="featured image" >}}
Mockito is a powerful Java testing framework that enables developers to create mock objects for unit testing purposes. It allows developers to test their code in isolation by replacing dependencies with mock objects that simulate the behavior of real objects. Mockito can also be used to test final and static methods, which can be challenging to test with other testing frameworks.

Testing final and static methods can be tricky because they are tightly coupled to the implementation of the class. Mockito provides a way to create mocks for final and static methods using a special plugin called "PowerMock." In this post, we will explore how to use Mockito with PowerMock to test final and static methods.

{{< alert theme="info" dir="ltr" >}}
Step 1: Add Mockito and PowerMock Dependencies
{{< /alert >}}

The first step is to add the necessary dependencies to your project. You can add the following dependencies to your build.gradle or pom.xml file:
{{< codes groovy >}}
{{< code >}}

```groovy
testImplementation 'org.mockito:mockito-core:3.11.2'
testImplementation 'org.powermock:powermock-module-junit4:2.0.9'
testImplementation 'org.powermock:powermock-api-mockito3:2.0.9'
```

{{< /code >}}
{{< /codes >}}

{{< alert theme="info" dir="ltr" >}}
Step 2: Enable PowerMockitoRunner
{{< /alert >}}
The next step is to enable the PowerMockitoRunner in your JUnit test class. The PowerMockitoRunner is responsible for initializing the PowerMock framework.

{{< codes java >}}
{{< code >}}

```java
@RunWith(PowerMockRunner.class)
@PrepareForTest({ClassName.class})
public class ClassNameTest {
```

{{< /code >}}
{{< /codes >}}

The **@RunWith(PowerMockRunner.class)** annotation tells JUnit to use the PowerMockitoRunner, while **@PrepareForTest** tells PowerMock which class needs to be prepared for testing.

{{< alert theme="info" dir="ltr" >}}
Step 3: Mocking Final and Static Methods
{{< /alert  >}}
To mock final and static methods, you need to use the PowerMockito framework. PowerMockito provides a **mockStatic** method that you can use to create a mock object for a static method. Similarly, it provides a **mockFinal** method to mock final methods.

{{< codes java >}}
{{< code >}}

```java
@Test
public void testFinalMethod() {
    final ClassName mockObject = mock(ClassName.class);
    when(mockObject.finalMethod()).thenReturn("Mock Value");
    assertEquals("Mock Value", mockObject.finalMethod());
}

@Test
public void testStaticMethod() {
    mockStatic(ClassName.class);
    when(ClassName.staticMethod()).thenReturn("Mock Value");
    assertEquals("Mock Value", ClassName.staticMethod());
}
```

{{< /code >}}
{{< /codes >}}

The **'mock'** method is used to create a mock object for the class, and the **'when'** method is used to specify the behavior of the method. The **'mockStatic'** method is used to create a mock object for a static method.

{{< alert theme="info" dir="ltr" >}}
Step 4: Verify the Method Calls
{{< /alert >}}
Finally, you need to verify that the mocked method was called during the test.

{{< codes java >}}
{{< code >}}

```java
verify(mockObject).finalMethod();
verifyStatic(ClassName.class);
ClassName.staticMethod();
```

{{< /code >}}
{{< /codes >}}

The **'verify'** method is used to verify that a method was called on a mock object. The **'verifyStatic'** method is used to verify that a static method was called.

By using Mockito with PowerMock, developers can create mock objects for final and static methods, which can be challenging to test with other testing frameworks. This approach enables developers to write more robust and reliable unit tests for their code.
