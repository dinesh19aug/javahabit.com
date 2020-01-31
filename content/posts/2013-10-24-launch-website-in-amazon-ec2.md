---
title: Launch Website in Amazon EC2
author: Dinesh
type: post
date: 2013-10-24T21:52:13+00:00
url: /2013/10/24/launch-website-in-amazon-ec2/
twitter_cards_summary_img_size:
  - 'a:6:{i:0;i:1214;i:1;i:606;i:2;i:3;i:3;s:25:"width="1214" height="606"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}'
  - 'a:6:{i:0;i:1214;i:1;i:606;i:2;i:3;i:3;s:25:"width="1214" height="606"";s:4:"bits";i:8;s:4:"mime";s:9:"image/png";}'
dsq_thread_id:
  - 5803211404
  - 5803211404
categories:
  - Tech Notes

---
<!--StartFragment-->I wrote this blog about a year ago and left it in the draft because this post somehow was not getting auto saved on WordPress and since its long post it took time for me type, take screenshots and paste. I did not have energy and time to do it all over again. I had a copy of it though in my google drive and I cannot tell you how many times this document has helped me.

Now I have a short-term memory. I remember phone numbers which I heard 10-15 years ago but some how command line arguments, street names etc. have always been elusive. My wife keeps poking fun at me when I drive and says that I am &#8220;directionally challenged&#8221;. I just cannot remember a route. I am absent-minded, not blank, but my mind just keep thinking all the time. I follow the same route to office every day, however as it often happens that I am always lost in my thoughts, I would take I-85 South ramp instead of I-85 north ramp and I am baffled a minute or two later, at the exit signs and wonder why are the exit numbers decreasing.

Anyway the point is that this document will help some absent-minded like me who do the set up once but when something goes wrong do the research all over again and wonder what did I do the last time.

As usual I am going to start from scratch and would put this in steps.

1. Create a new Amazon web services account.

2. Go to your Console and select EC2 tab.

<img src="https://lh5.googleusercontent.com/7DBB5cMdILQbHFoIZvKVPJ8ubgtxu6JVfYlb684kCivT-f5ArXzOkzgK6dIdZA4ptGhwge4yQ4_8aBeKdrQdb3Zd6Q1-tcLGBvHUl3OTSkN423sO-8U" alt="" width="664px;" height="504px;" />


  3. Now Lunch and instance. You will be shown a screen to select a wizard. You can choose between classic and quick wizard. The difference is that with classic wizard, you have fine grain control over what instance and software you want to install while Quick wizard is prebuilt server, for example &#8211; Ubuntu+Apache+Mysql+PHP. If you want the same instance set up on Classic wizard then you need install on your own.


<img src="https://lh6.googleusercontent.com/4mhjWCe_eJc5vKPnEMa4HgpGgNPbV-0hx55gP8_Fp4eQPOey_TF38GI4h0ZmZQ_Ro4YVtKhuwp6WFVIAASVB5Vkxxo0tjysvj1KzlqBvNpGeLZ6ToRs" alt="" width="698px;" height="478px;" />

I choose Classic Wizard. Click Continue.

<img src="https://lh5.googleusercontent.com/Txv1wF7DvSt2WTpDjjyovZ1RZEFA6HNNly9efqyznO1e997ynMYr1UgxGwO2Njq_ytmKognkthmCiejBKlEBurqyebEi2m0YOIvG_SxTHR3BpIN5-70" alt="" width="424px;" height="292px;" />


  Next I chose UBUNTU 12.04 32 bit.



  Next choose your instance. I choose Micro instance.


 <img src="https://lh4.googleusercontent.com/-h4i6mEApsUBRuWjkOGqbJ_Rl_s1ixaDIOiFVn7D_hLuJReVdxEKMkvTwuj8aQFqRuftfgL4la8P9JFUz-B3KKLzQHQ1MYfIArL_WV1X0h1EQDF8BHs" alt="" width="506px;" height="366px;" />


  You can also chose Request Spot Instance where you basically requests your own quote and can specify the largest amount that you intend to pay. Something like price negotiator.



  Click >Continue



  <img src="https://lh4.googleusercontent.com/HUG471jBuCJdjMGfv5Ak_UAqKWRyMjokI2GKaH3a_guP-ZVI_UVjEvj2zv3LK3Xx0kJJRunxPyDctfs1z4NmIGFHIcGF6zp1Sk4GlVwc4K5Bn3PfHJk" alt="" width="501px;" height="263px;" />



  Click >Continue.


Next name your instance and click Continue.

<img src="https://lh4.googleusercontent.com/uuLMFEPZq8xoRjs2TXrYcwUp-OCaI56hEYb7lrbW7cuNpyTwgRffUgiGdDLbSkGvMzv_2KaaydXqksBjmR-c27sArlOAbfVwfWRpCUzWwAd45BKNv3U" alt="" width="436px;" height="315px;" />

<!--EndFragment-->


  Next create a Key-Value pair. Name your key and click> Create and Download your Key Pair


 <img src="https://lh4.googleusercontent.com/XTieKGS38D_G2mKQJznvxItFShMv9345Bo2uMZTBlYA84w3VPnqM-JNxRaVmfLZgX58y05ZZHwQFARVivt8zp0fiddqI6BAi9E7Pw0ZIhS7C1aqVIm4" alt="" width="421px;" height="304px;" />


  Save the key on your local system and click continue.



  Next configure your security settings. It will be named  quick-launch by default  with port 22 for sftp open. You can add more ports if you like. I added port 80(Http) and 443(Https).



  <img src="https://lh3.googleusercontent.com/uqQ-U10tNrCOfPl8yDpofqiygw6eTQBzvqZB5qNRG5L22ols0B4QE3tWCRtp28f1w2X3EvF7M5CTD7E4P3fIGizdxhosnqen9Tnb4LJ8Tjaz4BKece4" alt="" width="546px;" height="394px;" />


Now you are ready to launch your server.

<img src="https://lh6.googleusercontent.com/jNPWXV_M3Kk7XHeyQJQgRq-aZBRJ7YNe-j5OjbkvaebXAx0UdOXlXQKzmdlnOsbWaYORYehp__jo5HVGzImwMMdjEi-qe01SiRI8ja3tpIS9fvyme0s" alt="" width="516px;" height="374px;" />

A confirmation page lets you know your instance is launching. Click Close to close the confirmation page.

<img src="https://lh4.googleusercontent.com/MDaelse9FaevdvnA-LCiPrsB99AMJ0kSQbszAErpCm5ze-c2PFJWwb2FgdiUjKcKpZP609U_XSTjvu9ySkHpOys_vnhUZhkLOpcsYsLJNcJlJo850rY" alt="" width="521px;" height="303px;" />

In the Navigation pane, click **Instances** to view the status of your instance. It takes a short time for an instance to launch. The instance&#8217;s status will be pending while it&#8217;s launching.

<img src="https://lh4.googleusercontent.com/qN51MCEYQjS480lcOHtBYaIjO0LduLQNT2VZsKdk3WjZQ4q1bee2Yc4cC_Mevz8KGQgLN8-9NkdZu-R1TL9zxZLjnIYcGMTXPEUbMtK0uacPSzrD4JU" alt="" width="628px;" height="249px;" />


  Record the Public DNS name for your instance because you&#8217;ll need it for the next task. If you select the instance, its details (including the public DNS name) are displayed in the lower pane. You can also click Show/Hide in the top right corner of the page to select which columns to display.


**ec2-xx-xx-xx-xx.compute-1.amazonaws.com**


  >4. Connecting to your Linux instance


Just Right click and click **Connect**&#8230;. It will give you option to connect via **ssh** or **java** client. Choose java client. For **Ubuntu**, the user name is **ubuntu**. Specify the location of your  **key-value** pair that you downloaded earlier. Hit Connect. You are now connected.


  5. Update ubuntu packages. Run this command &#8211;



>apt-get update

>apt-get upgrade –show-upgraded


  6. Now we already have default user “>ubuntu”. However I wanted to create my username. So create one &#8211;


>sudo adduser example_user


  You will be asked several questions like Full Name, Room number etc. Just click Enter and continue


>  Enter the new value, or press ENTER for the default


>Full Name []
>Room Number []
>Work Phone []
>Home Phone []
>Other []
>Is the information correct? [Y/n] y

  7. Now we need to allow this new user to administer the system. So to do this we need to give it admin rights. Run this:


>sudo usermod -a -G sudo example_user

  8. Install Git
>sudo apt-get install build-essential git-core curl


9. Install RVM to support different version of Ruby.



>curl -L get.rvm.io | bash -s stable

10. Add RVM to bashrc
> echo ‘[[ -s “$HOME/.rvm/scripts/rvm” ]] && source “$HOME/.rvm/scripts   /rvm”‘ » ~/.bashrc


11. Reload bashrc file

>. ~/.bashrc

12. Now exit from the session and type

>type rvm| head -1

This will give you a message that >“rvm is a function”

13. Next we will install ruby.

>rvm install 1.9.3

14. Use ruby 1.9.3 as default

>rvm –default use 1.9.3

15. To check the version of ruby-
>ruby -v

This should tell you that you are using  
> __“ruby 1.9.3p194”__



  16. Let’s install RAILS now.

  >gem install rails -v 3.2.1



  Now you may run into issue and get this error



  >ubuntu@domU-12-31-39-09-84-B8:~$ gem install rails -v 3.2.1
  >ERROR:  Loading command: install (LoadError)
  >cannot load such file &#8212; zlib
  >ERROR:  While executing gem &#8230; (NameError)
  >uninitialized constant Gem::Commands::InstallCommand

  If you get this error that do not worry, it is just telling you that you need to install some more packages.
  Run these commands:
  >rvm pkg install zlib
  >rvm remove 1.9.3
  >rvm install 1.9.3
  >rvm &#8211;default use 1.9.3
  >gem install rails -v 3.2.1

  17.  Time to install Mysql

  >sudo apt-get update
  >sudo apt-get upgrade –show-upgraded
  >sudo apt-get install libmysqlclient-dev
  >sudo apt-get install mysql-server

  You will be prompted with Mysql installation screen. >Just follow the instructions to set up root user name and password.

  18. Update the git configuration
  >git config &#8211;global user.name &#8220;Firstname Lastname&#8221;
  >git config &#8211;global user.email &#8220;<a href="mailto:your_email@youremail.com">your_email@youremail.com</a>&#8220;

  19) Install passenger and Nginx
  >gem install passenger
  >passenger-install-nginx-module

  If you run into issues then run the following
  >apt-get install libopenssl-ruby
  >apt-get install libcurl4-openssl-dev
  >apt-get install libssl-dev

  If you still run into issues where the installation instructions says that >openssl-dev is not installed then run this command
  >rvm pkg install openssl
  >rvm remove 1.9.3
  >rvm install 1.9.3
  >rvm &#8211;default use 1.9.3
  >rvmsudo passenger-install-nginx-module  <span style="text-decoration: underline;">><em>//You have to use rvmsudo if you are not logged in as root.</em></span>

  20) Download the code from now. To do that you need to create new ssh key and set it up on github.

  >ssh-keygen -t rsa -C “Your-emial-address@youremial.com”

  &#8211; Copy the key value from /root/.ssh/id_rsa.pub and copy the key in your git hub account.(If you do not know how to add ssh key then see github help document. Basically just goto github settings&#8211;> ssh-keys&#8211;> Add Key)

  &#8211; Now create your app folder. I created mine under /home/apps/. Now go to apps folder and run this command in terminal – >git clone git@&#8230;&#8230;&#8230;.xxxx.git (Your git url).

  21) Now we will install bundler.
  Switch to your application folder, such as &#8211; cd /home/apps/albums and run the command

  > gem install bundler
  > bundle install

  Ran into error below for Rmagick gem
  ><em>Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.</em>
  ><em>    /home/ubuntu/.rvm/rubies/ruby-1.9.3-p194/bin/ruby extconf.rb</em>
  ><em>checking for Ruby version >= 1.8.5&#8230; yes</em>
  ><em>extconf.rb:128: Use RbConfig instead of obsolete and deprecated Config.</em>
  ><em>checking for gcc&#8230; yes</em>
  ><em>checking for Magick-config&#8230; no</em>
  ><em>Can&#8217;t install RMagick 2.13.1. Can&#8217;t find Magick-config in /home/ubuntu/.rvm/gems/ruby-1.9.3-p194/bin:/home/ubuntu/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/ubuntu/.rvm/rubies/ruby-1.9.3-p194/bin:/home/ubuntu/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games</em>
  ><em>*** extconf.rb failed *** </em>
  ><em>Could not create Makefile due to some reason, probably lack of</em>
  <em>>necessary libraries and/or headers.  Check the mkmf.log file for more</em>
  <em>>details.  You may need configuration options.</em>
  <em>>Provided configuration options:</em>
  <em>>    &#8211;with-opt-dir</em>
  <em>>    &#8211;with-opt-include</em>
  <em>>    &#8211;without-opt-include=${opt-dir}/include</em>
  <em>>    &#8211;with-opt-lib</em>
  <em>>    &#8211;without-opt-lib=${opt-dir}/lib</em>
  <em>>    &#8211;with-make-prog</em>
  <em>>    &#8211;without-make-prog</em>
  <em>>    &#8211;srcdir=.</em>
  <em>>    &#8211;curdir</em>
  <em>>    &#8211;ruby=/home/ubuntu/.rvm/rubies/ruby-1.9.3-p194/bin/ruby</em>
  <em>>Gem files will remain installed in /home/ubuntu/.rvm/gems/ruby-1.9.3-p194/gems/rmagick-2.13.1 for inspection.</em>
  <em>>Results logged to /home/ubuntu/.rvm/gems/ruby-1.9.3-p194/gems/rmagick-2.13.1/ext/RMagick/gem_make.out</em>
  <em>>An error occured while installing rmagick (2.13.1), and Bundler cannot continue.</em>
  <em>>Make sure that `gem install rmagick -v &#8216;2.13.1&#8217;` succeeds before bundling.</em>

  If you get the same error for Rmagick or Mysql or anything else, then run the below command.

  >sudo apt-get install libmagickwand-dev

  Now re run the command
  >bundle install

  22) Starting up the passenger now. However before we start passenger we need make sure that our database exist. So let’s create database and do the database migrations. Run the below commands &#8211;
  >rake db:create
  >rake db:migrate //// Now this will not create a production db, but will create dev, test db for you. If you intend to create a production DB as well then run this command &#8211;
  <em>>RAILS_ENV=production rake db:create</em>
  <em>>RAILS_ENV=production rake db:migrate</em>

  I ran into issue and got the below error &#8211;
  >rake aborted!
  >Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes.

  The forums said that I need to install nodeJs. So here&#8217;s the list of command to install nodeJs.
   >sudo apt-get install python-software-properties
  > sudo add-apt-repository ppa:chris-lea/node.js
  > sudo apt-get update
  > sudo apt-get install nodejs

  Now the last thing you need to before starting passenger is pre compile your assets(css, images, js etc.). If you do not do this you will not be able to see the images and css. So run this command

  >bundle exec rake assets:precompile

  Oh by the way if your images are not being served even after running the above command and starting passenger then you need to read my other post &#8211; <a href="http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/">http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/</a>



  P.S. The above issue is pretty common and first time user who are trying to promote run into the above issue and give up eventually. I stopped looking at it after 2 days&#8230; took a 3 day break and attacked the issue again 🙂

  Now start the passenger.(Make sure that you have started Nginx  before starting Passenger else&#8230; see my earlier post &#8211; <a href="http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/">http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/</a>)

  >passenger start -e production

  I got error that “<em>>can&#8217;t connect to mysqlserver through socket tmp/mysql.sock</em>”. If you run into this server then run this command
  > mysqladmin variables | grep socket

  If you have a root password then use
  > sudo mysqladmin -p variables | grep socket

  The above command will give you socket name. In my case it gave me >/tmp/var/mysq.lock.
  Note this value and update your >database.yml file and update the socket as given below.

  >development:<br /> >  adapter: mysql2<br /> >  host: localhost<br /> >  username: root<br /> >  password: xxxx<br /> >  database: xxxx<br /> >  socket: /tmp/mysql.sock

  After you have updated the >database.yml file you should be able to start the passenger.

  23) Setting up NGINX
  Make sure that you nginx.conf under /opt/nginx/conf file’s server section looks like this

>  <em>>server {</em>
  <em>>    listen    80;</em>
  <em>>    server_name  www.mysitename.com;</em>
  <em>>    access_log /srv/www/mysitename.com/logs/access.log;</em>
  <em>>    error_log /srv/www/mysitename.com/logs/error.log;</em>
  <em>>    root /home/myapp/album/public;</em>
  <em>>    passenger_enabled on;</em>
  <em>>    passenger_base_uri /home/myapp/album/public;</em>
  <em>>    #This property allows you to upload huge pictures files else you will get error 413- File too large</em>
  <em>>    client_max_body_size 5M;</em>
  <em>>    #charset koi8-r;</em>
  <em>>    #access_log  logs/host.access.log  main;</em>
  <em>>#    location / {</em>
  <em>> #       root   /home/dinesh19aug/album/public;</em>
  <em>> #       index  index.html index.htm;</em>
  <em>> #   }</em>

  Happy launching 🙂
  In case you are wondering what did I launch &#8212;- P.S. If you have been following my blog it&#8217;s my wife&#8217;s photography website. <a href="http://www.deeptiarora.com" target="_blank">Wifeys website</a>



  ~~Ciao



  P.S. &#8211; Look forward for my first hand experience with Node.js in the next post.
