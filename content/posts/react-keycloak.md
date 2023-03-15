---
title: "Securing React Apps with Keycloak: A Comprehensive Guide"
image: "/resources/img/keycloak/keycloak.jpeg"
date: 2023-03-14T22:46:04-04:00
author: Dinesh Arora
type: post
url: /2023/03/14/Securing-react-app-keycloak/
keywords:
  - Java
  - React
  - keycloak
  - Typescript
  - npm
categories:
  - Tech Notes
description: Creating a login page is the one of the first things you need when creating a website. However, you dont have to struggle trying to create the schema from scratch. Keycloak is one such tool that provides functionalities such as user management, social logins and much more.
---

{{< featuredImage alt="featured image" >}}
While there are a variety of authentication services available, including Firebase Authentication and Auth0, there may be situations in your project where you require greater flexibility and control over your user management and authorization with advanced features.

In such cases, Keycloak is an ideal choice as it offers a wide range of features out of the box. Keycloak includes built-in support for OpenID Connect and SAML 2.0, as well as integrations with popular social networks like Google, GitHub, Facebook, and Twitter.

Let's take a look at how to create a login page using React and keycloak.
_Note_ We will not go over how to install keycloak. You can view the installation of keycloak [here](https://www.keycloak.org/getting-started/getting-started-docker)

{{< alert theme="info" dir="ltr" >}}
**Step 1:** Install Keycloak JavaScript adapter for React  
{{< /alert >}}

You can install the Keycloak JavaScript adapter for React using npm. In your project directory, run the following command:  
{{< codes javascript >}}
{{< code >}}

```javascript
npm install @react-keycloak/web keycloak-js
```

{{< /code >}}

{{< /codes >}}

{{< alert theme="info" dir="ltr" >}}
**Step 2:** Set up Keycloak instance
{{< /alert >}}

You need to set up a Keycloak instance in your React application. You can do this by creating a Keycloak configuration file with the following code:

{{< codes javascript >}}
{{< code >}}

```javascript
import Keycloak from "keycloak-js";

const keycloak = new Keycloak({
  url: "https://your-keycloak-server/auth",
  realm: "your-realm",
  clientId: "your-client-id",
});

export default keycloak;
```

{{< /code >}}
{{< /codes >}}

Replace the url, realm, and clientId values with your Keycloak server URL, realm name, and client ID.

{{< alert theme="info" dir="ltr" >}}
**Step 3:** Wrap the app with KeycloakProvider
{{< /alert >}}  
Wrap your React application with the KeycloakProvider component to provide the Keycloak context to your app. You can do this by adding the following code to your index.js file:

{{< codes javascript >}}
{{< code >}}

```javascript
import React from "react";
import ReactDOM from "react-dom";
import { KeycloakProvider } from "@react-keycloak/web";
import keycloak from "./keycloak";

ReactDOM.render(
  <KeycloakProvider keycloak={keycloak}>
    <App />
  </KeycloakProvider>,
  document.getElementById("root")
);
```

{{< /code >}}
{{< /codes >}}
Replace App with the name of your main component.

{{< alert theme="info" dir="ltr" >}}
**Step 4:** Create a login page component
{{< /alert >}}  
Create a new component for the login page. This component should contain a form with two input fields for the username and password, and a submit button to submit the form. You can use the following code as a starting point:

{{< codes javascript >}}
{{< code >}}

```javascript
import React, { useState } from "react";
import { useKeycloak } from "@react-keycloak/web";

function LoginPage() {
  const { keycloak } = useKeycloak();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      await keycloak.login({
        username,
        password,
      });
    } catch (error) {
      console.error("Failed to log in", error);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Username"
        value={username}
        onChange={(event) => setUsername(event.target.value)}
      />
      <input
        type="password"
        placeholder="Password"
        value={password}
        onChange={(event) => setPassword(event.target.value)}
      />
      <button type="submit">Log in</button>
    </form>
  );
}

export default LoginPage;
```

{{< /code >}}
{{< /codes >}}

{{< alert theme="info" dir="ltr" >}}
**Step 5:** Use the login page component
{{< /alert >}}  
You can use the login page component in your main component or any other component in your app. You can also add a link to the login page in your app navigation. Here's an example of how to use the login page component in your main component:

{{< codes javascript >}}
{{< code >}}

```javascript
import React from 'react';
import { useKeycloak } from '@react-keycloak/web';
import LoginPage from './LoginPage';

function App() {
  const { keycloak, initialized } = useKeycloak();

  if (!initialized) {
    return <div>Loading...</div>;
  }

  if (!keycloak.authenticated) {
    return <LoginPage />;
  }
  return (
    <div>)
```

{{< /code >}}
{{< /codes >}}

That's it! With these steps, you should be able to create a login page using React and Keycloak.

Ciao
