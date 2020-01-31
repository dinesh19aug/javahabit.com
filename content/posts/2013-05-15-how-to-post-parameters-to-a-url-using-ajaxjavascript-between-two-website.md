---
title: How to post parameters to a url using Ajax/Javascript between two website
author: Dinesh
type: post
date: 2013-05-15T03:33:28+00:00
url: /2013/05/15/how-to-post-parameters-to-a-url-using-ajaxjavascript-between-two-website/
publicize_twitter_user:
  - dinesh19aug
  - dinesh19aug
dsq_thread_id:
  - 5442813266
  - 5442813266
categories:
  - Tech Notes

---
I am working a new project and I recently ran into an interesting problem. One of the web site that I keep up at work was supposed to take the user to another website which required me to add post parameters.

EX - www.mywebsite.makeapayment.com ==> Collects Billing information ex - name, amount, address etc.==> Post this information to www.vendor-website.com.

I did not realize the problem until I started coding and my colleague pointed out that as soon as www.mywebsite.makeapayment.com goes to my servlet, the servlet will not pass params to external web site if use "POST", I had to use "GET" because servlet will look up relative path only and the <strong>HTTPServletRequest/Response</strong> object is specific to an application. So if I wanted to send parameters using servlet I could only that using action = GET. Now since I was passing sensitive information so I did not want to use GET.

A couple of solutions were discussed as follows:

1. Insert the params in database and use servlet get from the mywebsite.com to pass the primary key of the database. Ex - www.mywebsite.makeapayment.com ==>  www.vendor-website.com?key=10001. The vendor application look up the required params from the database.

2. Create a new JSP and use JavaScript onLoad() to pass the params as Hidden Input and submit as post to  www.vendor-website.com.

>Ex - www.mywebsite.makeapayment.com==> Servlet==> New Blank JSP with Hidden params loaded on onLoad() and submitted to vendor website ==> www.vendor-website.com.

3. Third approach is interesting and I had not tried this ever but looked promising and this is what I eventually implemented. Make an Ajax call to from the JSP page to your servlet and when the Ajax Call returns, post it to vendor web site.

Ex - www.mywebsite.makeapayment.com on hitting submit==> calls the JS, uses DWR to post to call the servlet==> Servlet does back ground processing like saving the records etc ==> Returns the control back to the JavaScript ==> Upon return in Ajax Call ==> Post to www.vendor-website.com.

I implemented the combination of one and three but here I am going to show you how post params to a different URL - i.e. solution 3

Let's say I have a submit form with Name and address which needs to be saved in database when I submit the form and then I need to post the same information to different web site.

__PersonalInformation.jsp__
```jsp
<html>

<head>

     <script>

>      // I am not showing the code for DWR. You will need to include dwr and engine.js. Add dwr.xml in your web-inf and specify the class name and method you want to use as dwr call. This method is called in the dwr Ajax call back.

 function submitAndGoToVendorSite()
  var form = document.createElement("FORM");
  form.method = "POST";
  form.style.display = "none";
  document.body.appendChild(form);
  var url="www.vendor-website.com";
  form.action = url;


            //My dwr ajax call gets a Json string from the servlet response.
 var jsonString =      "{"transactionId":"1368505156670","requesterType":"APP","billingEmail":"null@cybersource.com","billingState":"NC","amount":"42.7699999999999999433786257441170164384","refund":"N","billingCity":"CONCORD","billingLine1":"Progress Pl","billingFirstname":"test","billingLine2":"","shopperIP":"127.0.0.1","application":"OEP2","currencyCode":"USD","billingCompany":"ACN","revenueSource":"","billingLastname":"test","countryCode":"US","billingAddrNum":"1000","cardType":"VISA","businessPurpose":"TOOL","profileConfig":"cybersource-MLTEST1","language":"en","billingZip":"28025","repOrCustID":"1233836","user":"DARORATEST","paymentMethod":"CC","billingPhone":""}'

     // Create a JSON object from the JSON String
     var jsonObj = jQuery.parseJSON(jsonString);

//Iterate over Json object and set them as hidden input params to the form
 for(obj in jsonObj)
 {
   var input = document.createElement("INPUT");
   input.type = "hidden";
   input.name = obj;
   input.value = jsonObj[obj];
   form.appendChild(input);
 }

 //Submit the form

 form.submit();
</script>

</head>

<body>

     <form>

            <label>Name:</label><Input type="text"/>

            &#8230;&#8230;&#8230;.

            <input type="button" onclick="submitAndGoToVendorSite();"/>

    </form>

</body>
```
That's It!

~Keep Coding
