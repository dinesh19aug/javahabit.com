---
title: How to send email in PhoneGap (Android) using a gmail account
author: Dinesh
type: post
date: 2012-09-23T05:26:13+00:00
url: /2012/09/23/how-to-send-email-in-phonegap-android-using-a-gmail-account/
publicize_reach:
  - 'a:2:{s:7:"twitter";a:1:{i:0;i:50;}s:2:"wp";a:1:{i:0;i:0;}}'
  - 'a:2:{s:7:"twitter";a:1:{i:0;i:50;}s:2:"wp";a:1:{i:0;i:0;}}'
dsq_thread_id:
  - 5292097486
  - 5292097486
categories:
  - Tech Notes

---
For the last one month, I have been working on an [android][1] app for a grocery store.

I have been using [PhoneGap][2] to develop the solution as the client wanted both Android and Iphone version.

I have tried building the app in native Android but going through the hassle of designing css was just too much for me and plus I did not had time to learn Iphone development.

There was a short learning phase for PhoneGap and the results were awesome. However there was one area where I spent hours and ran into several issues. The customer wanted a Feedback section where the user could fill in feedback in a TextArea and hits Submit, which would send an email to customer in the background.

Now PhoneGap has plugin called [WebIntent][3] which will open a Email composer where you have to hit Send. This is not what I wanted as customer would have to hit a SUBMIT button, which would open a Email composer window on Phone and then hit Send again. Also this solution also meant user&#8217;s email address would be displayed to Grocery store.

I wanted to send the feedback in the background anonymously to Grocery store. I decided to use Java email Api and create a dummy email for grocery store which would be used to send feedback to the Grocery store&#8217;s main email address.

I did not find any good tutorial except <a title="this" href="http://smus.com/android-phonegap-plugins/" target="_blank">this</a> one. This is an incomplete tutorial and did not tell you how to create Java classes for Plugin or that you had to make entries in config.xml. So here is the actual tutorial.

Before I begin, let me tell you that I am using latest version of Cordova 2.1.0. This is will not work for Cordova 1.9.0(I will explain the issue below).

Step 1: Add cordova-2.1.0.jar in the project classpath

Step 2: Add cordova-2.1.0.js in the assets/www/js folder.

Step 3: create a new Java class called **EmailComoposer.java**
```java
package com.dinesh.pb;
import org.apache.cordova.api.Plugin;
import org.apache.cordova.api.PluginResult;
import org.apache.cordova.api.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.text.Html;
import com.dinesh.pb.utility.Mail;
 
@SuppressLint("ParserError")
public class EmailComposer extends Plugin {
public final String ACTION_SEND_EMAIL = "sendEmail";

 @Override
 public PluginResult execute(String action, JSONArray arg1, String callbackId) {
 PluginResult result = new PluginResult(Status.INVALID_ACTION);
 if (action.equals(ACTION_SEND_EMAIL)) {
 try {
 String message = arg1.getString(0);
 this.sendEmailViaGmail(message);
 result = new PluginResult(Status.OK);

 }
 catch (JSONException ex) {
 result = new PluginResult(Status.JSON_EXCEPTION, ex.getMessage());
 } catch (Exception e) {
 // TODO Auto-generated catch block
 e.printStackTrace();
 }
 }
 return result;
 }

 private void sendEmailViaGmail(String body) throws Exception{
 Mail m = new Mail("From_email_address@gmail.com", "your password");
 String[] toArr = {"TO_EMAIL_ADDRESS@gmail.com"};
 m.set_to(toArr);
 m.set_from("FROM_EMAIL_ADDRESS@gmail.com");
 m.set_body(body);
 m.set_subject("TEST SUBJECT");
 boolean sendFlag = m.send();

 }

}
```
Step 4. copy this Mail.java in package of your choice. My package name is com.dinesh.pb.utility.
```java
package com.dinesh.pb.utility;
import java.util.Date;
import java.util.Properties;
import javax.activation.CommandMap;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.activation.MailcapCommandMap;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
public class Mail extends javax.mail.Authenticator {
 private String _user;
 private String _pass;

 private String[] _to;
 private String _from;

 private String _port;
 private String _sport;

 private String _host;

 private String _subject;
 private String _body;

 private boolean _auth;

 private boolean _debuggable;

 private Multipart _multipart;

 public Mail() {
 _host = "smtp.gmail.com"; // default smtp server
 _port = "465"; // default smtp port
 _sport = "465"; // default socketfactory port

 _user = ""; // username
 _pass = ""; // password
 _from = ""; // email sent from
 _subject = ""; // email subject
 _body = ""; // email body

 _debuggable = false; // debug mode on or off - default off
 _auth = true; // smtp authentication - default on

 _multipart = new MimeMultipart();

 // There is something wrong with MailCap, javamail can not find a handler for the multipart/mixed part, so this bit needs to be added.
 MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
 mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
 mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
 mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
 mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
 mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
 CommandMap.setDefaultCommandMap(mc);
 }

 public Mail(String user, String pass) {
 this();

 _user = user;
 _pass = pass;
 }

 public boolean send() throws Exception {
 Properties props = _setProperties();

 if(!_user.equals("") && !_pass.equals("") && _to.length > 0 && !_from.equals("") && !_subject.equals("") && !_body.equals("")) {
 Session session = Session.getInstance(props, this);

 MimeMessage msg = new MimeMessage(session);

 msg.setFrom(new InternetAddress(_from));

 InternetAddress[] addressTo = new InternetAddress[_to.length];
 for (int i = 0; i < _to.length; i++) {
 addressTo[i] = new InternetAddress(_to[i]);
 }
 msg.setRecipients(MimeMessage.RecipientType.TO, addressTo);

 msg.setSubject(_subject);
 msg.setSentDate(new Date());

 // setup message body
 BodyPart messageBodyPart = new MimeBodyPart();
 messageBodyPart.setText(_body);
 _multipart.addBodyPart(messageBodyPart);

 // Put parts in message
 msg.setContent(_multipart);

 // send email
 Transport.send(msg);

 return true;
 } else {
 return false;
 }
 }

 public void addAttachment(String filename) throws Exception {
 BodyPart messageBodyPart = new MimeBodyPart();
 DataSource source = new FileDataSource(filename);
 messageBodyPart.setDataHandler(new DataHandler(source));
 messageBodyPart.setFileName(filename);

 _multipart.addBodyPart(messageBodyPart);
 }

 public String[] get_to() {
 return _to;
 }
public void set_to(String[] _to) {
 this._to = _to;
 }
public String get_from() {
 return _from;
 }
public void set_from(String _from) {
 this._from = _from;
 }
public String get_body() {
 return _body;
 }
public void set_body(String _body) {
 this._body = _body;
 }
@Override
 public PasswordAuthentication getPasswordAuthentication() {
 return new PasswordAuthentication(_user, _pass);
 }

 private Properties _setProperties() {
 Properties props = new Properties();

 props.put("mail.smtp.host", _host);

 if(_debuggable) {
 props.put("mail.debug", "true");
 }

 if(_auth) {
 props.put("mail.smtp.auth", "true");
 }

 props.put("mail.smtp.port", _port);
 props.put("mail.smtp.socketFactory.port", _sport);
 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
 props.put("mail.smtp.socketFactory.fallback", "false");

 return props;
 }
public String get_subject() {
 return _subject;
 }
public void set_subject(String _subject) {
 this._subject = _subject;
 }

 // more of the getters and setters …..
 }
 ```

Step 5: Update the config.xml and add the details about the new plugin class EmailComposer.java.

Mine looks like this -
```xml
 <plugin name="EmailComposer" value="com.dinesh.pb.EmailComposer"/>. Please update the package name value="com.dinesh.pb.EmailComposer" with your package path.

<?xml version="1.0" encoding="utf-8"?> 
<cordova>
    <access origin="http://127.0.0.1*"/> <!-- allow local pages --> 
    <access origin=".*"/> 
    <log level="DEBUG"/>
    <preference name="useBrowserHistory" value="false" />
    <preference name="exit-on-suspend" value="false" />
<plugins>
    <plugin name="App" value="org.apache.cordova.App"/>
    <plugin name="Geolocation" value="org.apache.cordova.GeoBroker"/>
    <plugin name="Device" value="org.apache.cordova.Device"/>
    <plugin name="Accelerometer" value="org.apache.cordova.AccelListener"/>
    <plugin name="Compass" value="org.apache.cordova.CompassListener"/>
    <plugin name="Media" value="org.apache.cordova.AudioHandler"/>
    <plugin name="Camera" value="org.apache.cordova.CameraLauncher"/>
    <plugin name="Contacts" value="org.apache.cordova.ContactManager"/>
    <plugin name="File" value="org.apache.cordova.FileUtils"/>
    <plugin name="NetworkStatus" value="org.apache.cordova.NetworkManager"/>
    <plugin name="Notification" value="org.apache.cordova.Notification"/>
    <plugin name="Storage" value="org.apache.cordova.Storage"/>
    <plugin name="Temperature" value="org.apache.cordova.TempListener"/>
    <plugin name="FileTransfer" value="org.apache.cordova.FileTransfer"/>
    <plugin name="Capture" value="org.apache.cordova.Capture"/>
    <plugin name="Battery" value="org.apache.cordova.BatteryListener"/>
    <plugin name="SplashScreen" value="org.apache.cordova.SplashScreen"/>
    <plugin name="Echo" value="org.apache.cordova.Echo" />
    <plugin name="EmailComposer" value="com.dinesh.pb.EmailComposer"/>
 </plugins>
</cordova></pre>
```
Step 6: Create a new javascript file called email.js
```js
var EmailComposer = function(){};
/*
cordova.addConstructor(function() {
    cordova.addPlugin("emailcomposer", new EmailComposer());
});
*/
EmailComposer.prototype.send = function (message){
console.log("Calling the send message");
cordova.exec(function(){ alert('feedback sent')}, 
    function(){ alert('feedback was not sent')}, 
    'EmailComposer', 
    'sendEmail', 
    [message]);
}
function sendFeedback(){
    window.EmailComposer.prototype.send("My message body");
}
```

Now as I mentioned earlier that I am using cordova-2.1.0.js/jar file there are subtle differences between the latest version and older version (cordova-1.9.0).  If you are using older version you will need to uncomment the section **cordova.addConstructor**above and instead of calling

>window.EmailComposer.prototype.send("My message body");

Use this:

>window.plugins.emailComposer.prototype.send(body);

If you do not use it then you may get error which would say that window.plugins is not defined. If you run into such issues use firebug and see what variables are defined under &#8220;window" variable.

Notice the method called &#8220;feedback()". I am simply passing the user text as message body by capturing the input from user feedback TextBox. For simplicity I have just pasted a default Email body.

Step 7: Include the js file in your index.html file
```js
// <!-[CDATA[

"javascript" src="js/email.js">

// ]]>

Step 8: Include cordova js file in index.html

// <!-[CDATA[

javascript" src="js/cordova-2.1.0.js">

// ]]>
```
Step 9: Add three jar files for Java mail api - namely, Activation.jar, Mail.jar and Additional.jar in the libs folder and add it to the classpath. You can these files <a title="here" href="http://www.oracle.com/technetwork/java/javamail/index-138643.html" target="_blank">here</a>.

Cheers!!

UPDATE: A lot of people commented that they could not find mail.jar,additional.jar and actication.jar so I have uploaded them on 4shared.com. You can download them from the link below.

[Activation.jar][4]

[Additional.jar][5]

[Mail.jar][6]

 [1]: http://developer.android.com/index.html "Android"
 [2]: http://phonegap.com/ "Phonegap"
 [3]: https://github.com/phonegap/phonegap-plugins/tree/master/Android/WebIntent/ "WebIntent"
 [4]: http://www.4shared.com/file/3iu1WV2m/activation.html "Activation.jar"
 [5]: http://www.4shared.com/file/u5lOPzdR/additionnal.html "Additional.jar"
 [6]: http://www.4shared.com/file/Kp0FRxHl/mail.html "Mail.jar"
