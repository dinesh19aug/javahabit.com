---
title: "Mockito Explained: How to Choose Between Mocks and Spies for Effective Unit Testing"
date: 2023-04-25T14:21:22-04:00
author: Dinesh Arora
type: post
url: /2023/04/25/How-to-Choose-Between-Mocks-and-Spies
image: "/resources/img/spy-mock.jpeg"
keywords:
  - Java
  - Mockito
  - spy
  - mock
  - junit
categories:
  - Tech Notes
description: This post explains the differences between the two types of test doubles in the Mockito Java testing framework - mocks and spies. Mocks are used to replace dependencies, while spies are used to wrap around real objects. The main difference between mocks and spies is that mocks are used to isolate the code under test from its dependencies, while spies are used to test real objects in isolation while allowing us to verify their behavior. Code examples are provided to illustrate the usage and differences of mocks and spies.

---
{{< featuredImage alt="featured image" >}}

Mockito is a popular Java testing framework that provides two types of test doubles: mocks and spies. Although they are both used for testing, they have different purposes and usage. In this post, we will explore the differences between mock and spy in Mockito with more code samples.

### Mock Objects

Mock objects are objects that simulate the behavior of real objects. They are used to replace dependencies in unit tests to make the tests run faster and more reliably. Mock objects are created using the __`mock`__ method provided by Mockito.

{{< codes java >}}
{{< code >}}

```java
List<String> mockedList = mock(List.class);
```

{{< /code >}}
{{< /codes >}}

In the above example, we are creating a mock object of the List class. We can then use this mock object to specify the behavior of the List class methods during the unit tests.

{{< codes java >}}
{{< code >}}

```java
// Set up behavior for the mock object
when(mockedList.size()).thenReturn(10);

// Verify that the mock object was called
verify(mockedList).size();
```

{{< /code >}}
{{< /codes >}}

In the above code, we are setting up the behavior of the __`size`__ method for the mock object and verifying that it was called during the unit tests.

### Spy Objects

Spy objects, on the other hand, are used to wrap around real objects. They are used to test real objects in isolation while allowing us to verify the behavior of the real objects. Spy objects are created using the spy method provided by Mockito.


{{< codes java >}}
{{< code >}}

```java
List<String> list = new ArrayList<>();
List<String> spyList = spy(list);
```
{{< /code >}}
{{< /codes >}}

In the above example, we are creating a spy object of the ArrayList class. We can then use this spy object to modify the behavior of the ArrayList class methods during the unit tests.

{{< codes java >}}
{{< code >}}

```java
// Set up behavior for the spy object
spyList.add("element");

// Verify that the spy object was called
verify(spyList).add("element");

```
{{< /code >}}
{{< /codes >}}


In the above code, we are modifying the behavior of the __`add`__ method for the spy object and verifying that it was called during the unit tests.

### Differences Between Mocks and Spies

The main difference between mocks and spies is that mocks are created using the mock method, while spies are created using the __`spy`__ method. Additionally, __`mocks`__ are used to replace dependencies, while spies are used to wrap around real objects.

Mocks are designed to isolate the code under test from its dependencies, while spies are designed to test real objects in isolation while allowing us to verify their behavior.

Another key difference is that mocks don't execute the real code of the methods being mocked, while spies execute the real code of the methods being spied upon, unless explicitly stubbed.

### When to Use Mocks and Spies

Mocks are useful when testing code that has dependencies on external resources such as databases or web services. By using mocks to replace these dependencies, developers can test the code in isolation without relying on the external resources.

Spies are useful when testing complex or legacy code that is difficult to refactor. By using spies, developers can wrap around the real objects and test their behavior while allowing the real objects to execute their original code.

Mocks are used to replace dependencies, while spies are used to wrap around real objects. The main difference between mocks and spies is that mocks are used to isolate the code under test from its dependencies, while spies are used to test real objects in isolation while allowing us to verify their behavior. Knowing the differences between mocks and spies is essential for writing effective and efficient unit tests using Mockito.


