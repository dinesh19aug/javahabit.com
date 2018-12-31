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

<p dir="ltr">
  3. Now Lunch and instance. You will be shown a screen to select a wizard. You can choose between classic and quick wizard. The difference is that with classic wizard, you have fine grain control over what instance and software you want to install while Quick wizard is prebuilt server, for example &#8211; Ubuntu+Apache+Mysql+PHP. If you want the same instance set up on Classic wizard then you need install on your own.
</p>

<img src="https://lh6.googleusercontent.com/4mhjWCe_eJc5vKPnEMa4HgpGgNPbV-0hx55gP8_Fp4eQPOey_TF38GI4h0ZmZQ_Ro4YVtKhuwp6WFVIAASVB5Vkxxo0tjysvj1KzlqBvNpGeLZ6ToRs" alt="" width="698px;" height="478px;" />

I choose Classic Wizard. Click Continue.

<img src="https://lh5.googleusercontent.com/Txv1wF7DvSt2WTpDjjyovZ1RZEFA6HNNly9efqyznO1e997ynMYr1UgxGwO2Njq_ytmKognkthmCiejBKlEBurqyebEi2m0YOIvG_SxTHR3BpIN5-70" alt="" width="424px;" height="292px;" />

<p dir="ltr">
  Next I chose UBUNTU 12.04 32 bit.
</p>

<p dir="ltr">
  Next choose your instance. I choose Micro instance.
</p>

 <img src="https://lh4.googleusercontent.com/-h4i6mEApsUBRuWjkOGqbJ_Rl_s1ixaDIOiFVn7D_hLuJReVdxEKMkvTwuj8aQFqRuftfgL4la8P9JFUz-B3KKLzQHQ1MYfIArL_WV1X0h1EQDF8BHs" alt="" width="506px;" height="366px;" />

<p dir="ltr">
  You can also chose Request Spot Instance where you basically requests your own quote and can specify the largest amount that you intend to pay. Something like price negotiator.
</p>

<p dir="ltr">
  Click <strong>Continue</strong>
</p>

<p dir="ltr">
  <img src="https://lh4.googleusercontent.com/HUG471jBuCJdjMGfv5Ak_UAqKWRyMjokI2GKaH3a_guP-ZVI_UVjEvj2zv3LK3Xx0kJJRunxPyDctfs1z4NmIGFHIcGF6zp1Sk4GlVwc4K5Bn3PfHJk" alt="" width="501px;" height="263px;" />
</p>

<p dir="ltr">
  Click <strong>Continue</strong>.
</p>

Next name your instance and click Continue.

<img src="https://lh4.googleusercontent.com/uuLMFEPZq8xoRjs2TXrYcwUp-OCaI56hEYb7lrbW7cuNpyTwgRffUgiGdDLbSkGvMzv_2KaaydXqksBjmR-c27sArlOAbfVwfWRpCUzWwAd45BKNv3U" alt="" width="436px;" height="315px;" />
  
<!--EndFragment-->

<p dir="ltr">
  Next create a Key-Value pair. Name your key and click<strong> Create and Download your Key Pair</strong>
</p>

 <img src="https://lh4.googleusercontent.com/XTieKGS38D_G2mKQJznvxItFShMv9345Bo2uMZTBlYA84w3VPnqM-JNxRaVmfLZgX58y05ZZHwQFARVivt8zp0fiddqI6BAi9E7Pw0ZIhS7C1aqVIm4" alt="" width="421px;" height="304px;" />

<p dir="ltr">
  Save the key on your local system and click continue.
</p>

<p dir="ltr">
  Next configure your security settings. It will be named  quick-launch by default  with port 22 for sftp open. You can add more ports if you like. I added port 80(Http) and 443(Https).
</p>

<p dir="ltr">
  <img src="https://lh3.googleusercontent.com/uqQ-U10tNrCOfPl8yDpofqiygw6eTQBzvqZB5qNRG5L22ols0B4QE3tWCRtp28f1w2X3EvF7M5CTD7E4P3fIGizdxhosnqen9Tnb4LJ8Tjaz4BKece4" alt="" width="546px;" height="394px;" />
</p>

Now you are ready to launch your server.

<img src="https://lh6.googleusercontent.com/jNPWXV_M3Kk7XHeyQJQgRq-aZBRJ7YNe-j5OjbkvaebXAx0UdOXlXQKzmdlnOsbWaYORYehp__jo5HVGzImwMMdjEi-qe01SiRI8ja3tpIS9fvyme0s" alt="" width="516px;" height="374px;" />

A confirmation page lets you know your instance is launching. Click Close to close the confirmation page.

<img src="https://lh4.googleusercontent.com/MDaelse9FaevdvnA-LCiPrsB99AMJ0kSQbszAErpCm5ze-c2PFJWwb2FgdiUjKcKpZP609U_XSTjvu9ySkHpOys_vnhUZhkLOpcsYsLJNcJlJo850rY" alt="" width="521px;" height="303px;" />

In the Navigation pane, click **Instances** to view the status of your instance. It takes a short time for an instance to launch. The instance&#8217;s status will be pending while it&#8217;s launching.

<img src="https://lh4.googleusercontent.com/qN51MCEYQjS480lcOHtBYaIjO0LduLQNT2VZsKdk3WjZQ4q1bee2Yc4cC_Mevz8KGQgLN8-9NkdZu-R1TL9zxZLjnIYcGMTXPEUbMtK0uacPSzrD4JU" alt="" width="628px;" height="249px;" />

<p dir="ltr">
  Record the Public DNS name for your instance because you&#8217;ll need it for the next task. If you select the instance, its details (including the public DNS name) are displayed in the lower pane. You can also click Show/Hide in the top right corner of the page to select which columns to display.
</p>

**ec2-xx-xx-xx-xx.compute-1.amazonaws.com**

<p dir="ltr">
  <strong>4. Connecting to your Linux instance</strong>
</p>

Just Right click and click **Connect**&#8230;. It will give you option to connect via **ssh** or **java** client. Choose java client. For **Ubuntu**, the user name is **ubuntu**. Specify the location of your  **key-value** pair that you downloaded earlier. Hit Connect. You are now connected.

<p dir="ltr">
  5. Update ubuntu packages. Run this command &#8211;
</p>

<p dir="ltr">
  <strong>apt-get update</strong>
</p>

<p dir="ltr">
  <strong>apt-get upgrade –show-upgraded</strong>
</p>

<p dir="ltr">
  6. Now we already have default user “<strong>ubuntu</strong>”. However I wanted to create my username. So create one &#8211;
</p>

<p dir="ltr">
  <strong>sudo adduser example_user</strong>
</p>

<p dir="ltr">
  You will be asked several questions like Full Name, Room number etc. Just click Enter and continue
</p>

<p dir="ltr">
  Enter the new value, or press ENTER for the default
</p>

<p dir="ltr">
      <strong>Full Name []:</strong>
</p>

<p dir="ltr">
  <strong>    Room Number []:</strong>
</p>

<p dir="ltr">
  <strong>    Work Phone []:</strong>
</p>

<p dir="ltr">
  <strong>    Home Phone []:</strong>
</p>

<p dir="ltr">
  <strong>    Other []:</strong>
</p>

<p dir="ltr">
  <strong>Is the information correct? [Y/n] y</strong>
</p>

<p dir="ltr">
  7. Now we need to allow this new user to administer the system. So to do this we need to give it admin rights. Run this:
</p>

<p dir="ltr">
  <strong>sudo usermod -a -G sudo example_user</strong>
</p>

<p dir="ltr">
  8. Install Git
</p>

<p dir="ltr">
  <strong>sudo apt-get install build-essential git-core curl</strong>
</p>

<p dir="ltr">
  9. Install RVM to support different version of Ruby.
</p>

<p dir="ltr">
  <strong>curl -L get.rvm.io | bash -s stable</strong>
</p>

<p dir="ltr">
  10. Add RVM to bashrc
</p>

<p dir="ltr">
  <strong>echo &#8216;[[ -s &#8220;$HOME/.rvm/scripts/rvm&#8221; ]] && source &#8220;$HOME/.rvm/scripts   /rvm&#8221;&#8216; >> ~/.bashrc</strong>
</p>

<p dir="ltr">
  11. Reload bashrc file
</p>

<p dir="ltr">
  <strong>. ~/.bashrc</strong>
</p>

<p dir="ltr">
  12. Now exit from the session and type
</p>

<p dir="ltr">
  <strong>type rvm| head -1</strong>
</p>

<p dir="ltr">
  This will give you a message that <strong>“rvm is a function”</strong>
</p>

<p dir="ltr">
  13. Next we will install ruby.
</p>

<p dir="ltr">
  <strong>rvm install 1.9.3</strong>
</p>

<p dir="ltr">
  14. Use ruby 1.9.3 as default
</p>

<p dir="ltr">
  <strong>rvm &#8211;default use 1.9.3</strong>
</p>

<p dir="ltr">
  15. To check the version of ruby-
</p>

<p dir="ltr">
  <strong>ruby -v</strong>
</p>

<p dir="ltr">
  This should tell you that you are using &#8211; <strong>“ruby 1.9.3p194”</strong>
</p>

<p dir="ltr">
  16. Let’s install RAILS now.
</p>

<p dir="ltr">
  <strong>gem install rails -v 3.2.1</strong>
</p>

<p dir="ltr">
  Now you may run into issue and get this error
</p>

<p dir="ltr">
  <strong>ubuntu@domU-12-31-39-09-84-B8:~$ gem install rails -v 3.2.1</strong>
</p>

<p dir="ltr">
  <strong>ERROR:  Loading command: install (LoadError)</strong>
</p>

<p dir="ltr">
  <strong>cannot load such file &#8212; zlib</strong>
</p>

<p dir="ltr">
  <strong>ERROR:  While executing gem &#8230; (NameError)</strong>
</p>

<p dir="ltr">
  <strong>uninitialized constant Gem::Commands::InstallCommand</strong>
</p>

<p dir="ltr">
  If you get this error that do not worry, it is just telling you that you need to install some more packages.
</p>

<p dir="ltr">
  Run these commands:
</p>

<p dir="ltr">
  <strong>rvm pkg install zlib</strong>
</p>

<p dir="ltr">
  <strong>rvm remove 1.9.3</strong>
</p>

<p dir="ltr">
  <strong>rvm install 1.9.3</strong>
</p>

<p dir="ltr">
  <strong>rvm &#8211;default use 1.9.3</strong>
</p>

<p dir="ltr">
  <strong>gem install rails -v 3.2.1</strong>
</p>

<p dir="ltr">
  17.  Time to install Mysql
</p>

<p dir="ltr">
  <strong>sudo apt-get update</strong>
</p>

<p dir="ltr">
  <strong>sudo apt-get upgrade –show-upgraded</strong>
</p>

<p dir="ltr">
  <strong>sudo apt-get install libmysqlclient-dev</strong>
</p>

<p dir="ltr">
  <strong>sudo apt-get install mysql-server</strong>
</p>

<p dir="ltr">
  You will be prompted with Mysql installation screen. <strong>Just follow the instructions to set up root user name and password.</strong>
</p>

<p dir="ltr">
  18. Update the git configuration
</p>

<p dir="ltr">
  <strong>git config &#8211;global user.name &#8220;Firstname Lastname&#8221;</strong>
</p>

<p dir="ltr">
  <strong>git config &#8211;global user.email &#8220;<a href="mailto:your_email@youremail.com">your_email@youremail.com</a>&#8220;</strong>
</p>

<p dir="ltr">
  19) Install passenger and Nginx
</p>

<p dir="ltr">
  <strong>gem install passenger</strong>
</p>

<p dir="ltr">
  <strong>passenger-install-nginx-module</strong>
</p>

<p dir="ltr">
  If you run into issues then run the following
</p>

<p dir="ltr">
  <strong>apt-get install libopenssl-ruby</strong>
</p>

<p dir="ltr">
  <strong>apt-get install libcurl4-openssl-dev</strong>
</p>

<p dir="ltr">
  <strong>apt-get install libssl-dev</strong>
</p>

<p dir="ltr">
  If you still run into issues where the installation instructions says that <strong>openssl-dev is not installed</strong> then run this command
</p>

<p dir="ltr">
  <strong>rvm pkg install openssl</strong>
</p>

<p dir="ltr">
  <strong>rvm remove 1.9.3</strong>
</p>

<p dir="ltr">
  <strong>rvm install 1.9.3</strong>
</p>

<p dir="ltr">
  <strong>rvm &#8211;default use 1.9.3</strong>
</p>

<p dir="ltr">
  <strong>rvmsudo passenger-install-nginx-module</strong>  <span style="text-decoration: underline;"><strong><em>//You have to use rvmsudo if you are not logged in as root.</em></strong></span>
</p>

<p dir="ltr">
  20) Download the code from now. To do that you need to create new ssh key and set it up on github.
</p>

<p dir="ltr">
  <strong>ssh-keygen -t rsa -C “Your-emial-address@youremial.com”</strong>
</p>

<p dir="ltr">
  &#8211; Copy the key value from /root/.ssh/id_rsa.pub and copy the key in your git hub account.(If you do not know how to add ssh key then see github help document. Basically just goto github settings&#8211;> ssh-keys&#8211;> Add Key)
</p>

<p dir="ltr">
  &#8211; Now create your app folder. I created mine under /home/apps/. Now go to apps folder and run this command in terminal – <strong>git clone git@&#8230;&#8230;&#8230;.xxxx.git (Your git url).</strong>
</p>

<p dir="ltr">
  21) Now we will install bundler.
</p>

<p dir="ltr">
  Switch to your application folder, such as &#8211; cd /home/apps/albums and run the command
</p>

<p dir="ltr">
  <strong> gem install bundler</strong>
</p>

<p dir="ltr">
  <strong> bundle install</strong>
</p>

<p dir="ltr">
  Ran into error below for Rmagick gem
</p>

<p dir="ltr">
  <strong><em>Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.</em></strong>
</p>

<p dir="ltr">
  <strong><em>    /home/ubuntu/.rvm/rubies/ruby-1.9.3-p194/bin/ruby extconf.rb</em></strong>
</p>

<p dir="ltr">
  <strong><em>checking for Ruby version >= 1.8.5&#8230; yes</em></strong>
</p>

<p dir="ltr">
  <strong><em>extconf.rb:128: Use RbConfig instead of obsolete and deprecated Config.</em></strong>
</p>

<p dir="ltr">
  <strong><em>checking for gcc&#8230; yes</em></strong>
</p>

<p dir="ltr">
  <strong><em>checking for Magick-config&#8230; no</em></strong>
</p>

<p dir="ltr">
  <strong><em>Can&#8217;t install RMagick 2.13.1. Can&#8217;t find Magick-config in /home/ubuntu/.rvm/gems/ruby-1.9.3-p194/bin:/home/ubuntu/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/ubuntu/.rvm/rubies/ruby-1.9.3-p194/bin:/home/ubuntu/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games</em></strong>
</p>

<p dir="ltr">
  <strong><em>*** extconf.rb failed ***</em></strong>
</p>

<p dir="ltr">
  <strong><em>Could not create Makefile due to some reason, probably lack of</em></strong>
</p>

<p dir="ltr">
  <em><strong>necessary libraries and/or headers.  Check the mkmf.log file for more</strong></em>
</p>

<p dir="ltr">
  <em><strong>details.  You may need configuration options.</strong></em>
</p>

<p dir="ltr">
  <em><strong>Provided configuration options:</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;with-opt-dir</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;with-opt-include</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;without-opt-include=${opt-dir}/include</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;with-opt-lib</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;without-opt-lib=${opt-dir}/lib</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;with-make-prog</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;without-make-prog</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;srcdir=.</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;curdir</strong></em>
</p>

<p dir="ltr">
  <em><strong>    &#8211;ruby=/home/ubuntu/.rvm/rubies/ruby-1.9.3-p194/bin/ruby</strong></em>
</p>

<p dir="ltr">
  <em><strong>Gem files will remain installed in /home/ubuntu/.rvm/gems/ruby-1.9.3-p194/gems/rmagick-2.13.1 for inspection.</strong></em>
</p>

<p dir="ltr">
  <em><strong>Results logged to /home/ubuntu/.rvm/gems/ruby-1.9.3-p194/gems/rmagick-2.13.1/ext/RMagick/gem_make.out</strong></em>
</p>

<p dir="ltr">
  <em><strong>An error occured while installing rmagick (2.13.1), and Bundler cannot continue.</strong></em>
</p>

<p dir="ltr">
  <em><strong>Make sure that `gem install rmagick -v &#8216;2.13.1&#8217;` succeeds before bundling.</strong></em>
</p>

<p dir="ltr">
  If you get the same error for Rmagick or Mysql or anything else, then run the below command.
</p>

<p dir="ltr">
  <strong>sudo apt-get install libmagickwand-dev</strong>
</p>

<p dir="ltr">
  Now re run the command
</p>

<p dir="ltr">
  <strong>bundle install</strong>
</p>

<p dir="ltr">
  22) Starting up the passenger now. However before we start passenger we need make sure that our database exist. So let’s create database and do the database migrations. Run the below commands &#8211;
</p>

<p dir="ltr">
  <strong>rake db:create</strong>
</p>

<p dir="ltr">
  <strong>rake db:migrate</strong> //// Now this will not create a production db, but will create dev, test db for you. If you intend to create a production DB as well then run this command &#8211;
</p>

<p dir="ltr">
  <em><strong>RAILS_ENV=production rake db:create</strong></em>
</p>

<p dir="ltr">
  <em><strong>RAILS_ENV=production rake db:migrate</strong></em>
</p>

<p dir="ltr">
  I ran into issue and got the below error &#8211;
</p>

<p dir="ltr">
  <strong>rake aborted!</strong>
</p>

<p dir="ltr">
  <strong>Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes.</strong>
</p>

<p dir="ltr">
  The forums said that I need to install nodeJs. So here&#8217;s the list of command to install nodeJs.
</p>

<p dir="ltr">
   <strong>sudo apt-get install python-software-properties</strong>
</p>

<p dir="ltr">
  <strong> sudo add-apt-repository ppa:chris-lea/node.js</strong>
</p>

<p dir="ltr">
  <strong> sudo apt-get update</strong>
</p>

<p dir="ltr">
  <strong> sudo apt-get install nodejs</strong>
</p>

<p dir="ltr">
  Now the last thing you need to before starting passenger is pre compile your assets(css, images, js etc.). If you do not do this you will not be able to see the images and css. So run this command
</p>

<p dir="ltr">
  <strong>bundle exec rake assets:precompile</strong>
</p>

<p dir="ltr">
  <em>Oh by the way if your images are not being served even after running the above command and starting passenger then you need to read my other post &#8211;</em> <a href="http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/">http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/</a>
</p>

<p dir="ltr">
  P.S> The above issue is pretty common and first time user who are trying to promote run into the above issue and give up eventually. I stopped looking at it after 2 days&#8230; took a 3 day break and attacked the issue again 🙂
</p>

<p dir="ltr">
  Now start the passenger.(Make sure that you have started Nginx  before starting Passenger else&#8230; see my earlier post &#8211; <a href="http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/">http://railgaadi.wordpress.com/2012/01/28/engineyard-rails-3-x-nginx-passenger-assets-not-displayed/</a>)
</p>

<p dir="ltr">
  <strong>passenger start -e production</strong>
</p>

<p dir="ltr">
  I got error that “<em><strong>can&#8217;t connect to mysqlserver through socket tmp/mysql.sock</strong></em>”. If you run into this server then run this command
</p>

<p dir="ltr">
  <strong> mysqladmin variables | grep socket</strong>
</p>

<p dir="ltr">
  If you have a root password then use
</p>

<p dir="ltr">
  <strong> sudo mysqladmin -p variables | grep socket</strong>
</p>

<p dir="ltr">
  The above command will give you socket name. In my case it gave me <strong>/tmp/var/mysq.lock. </strong>
</p>

<p dir="ltr">
  Note this value and update your <strong>database.yml</strong> file and update the socket as given below.
</p>

<p dir="ltr">
  <strong>development:</strong><br /> <strong>  adapter: mysql2</strong><br /> <strong>  host: localhost</strong><br /> <strong>  username: root</strong><br /> <strong>  password: xxxx</strong><br /> <strong>  database: xxxx</strong><br /> <strong>  socket: /tmp/mysql.sock</strong>
</p>

<p dir="ltr">
  After you have updated the <strong>database.yml</strong> file you should be able to start the passenger.
</p>

<p dir="ltr">
  <strong>23) Setting up NGINX</strong>
</p>

<p dir="ltr">
  Make sure that you nginx.conf under /opt/nginx/conf file’s server section looks like this
</p>

<p dir="ltr">
  <em><strong>server {</strong></em>
</p>

<p dir="ltr">
  <em><strong>    listen    80;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    server_name  www.mysitename.com;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    access_log /srv/www/mysitename.com/logs/access.log;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    error_log /srv/www/mysitename.com/logs/error.log;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    root /home/myapp/album/public;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    passenger_enabled on;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    passenger_base_uri /home/myapp/album/public;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    #This property allows you to upload huge pictures files else you will get error 413- File too large</strong></em>
</p>

<p dir="ltr">
  <em><strong>    client_max_body_size 5M;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    #charset koi8-r;</strong></em>
</p>

<p dir="ltr">
  <em><strong>    #access_log  logs/host.access.log  main;</strong></em>
</p>

<p dir="ltr">
  <em><strong>#    location / {</strong></em>
</p>

<p dir="ltr">
  <em><strong> #       root   /home/dinesh19aug/album/public;</strong></em>
</p>

<p dir="ltr">
  <em><strong> #       index  index.html index.htm;</strong></em>
</p>

<p dir="ltr">
  <em><strong> #   }</strong></em>
</p>

<p dir="ltr">
  Happy launching 🙂
</p>

<p dir="ltr">
  In case you are wondering what did I launch &#8212;- P.S. If you have been following my blog it&#8217;s my wife&#8217;s photography website. <a href="http://www.deeptiarora.com" target="_blank">Wifeys website</a>
</p>

<p dir="ltr">
  ~~Ciao
</p>

<p dir="ltr">
  P.S. &#8211; Look forward for my first hand experience with Node.js in the next post.
</p>