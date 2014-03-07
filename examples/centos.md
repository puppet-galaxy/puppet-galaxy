CentOS 6.5

* On a very basic image, install EPEL packages
<pre>
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
[dl.fedoraproject.org]
rpm -Uvh epel-release-6-8.noarch.rpm
</pre>

* Edit /etc/yum.repos/epel.repo: in section [epel] set enabled at 1
<pre>
enabled = 1 
</pre>

* Puppet install
<pre>
yum install puppet
</pre>

* Run module installation
<pre>
puppet module install urgi/galaxy
</pre>

* Wait full server install ~ 5/10 minutes
* If http access is not done locally, change adress in universe_wgsi.ini section [server:main]

<pre>
host=0.0.0.0
</pre>

* Restart galaxy
<pre>
su - galaxy
cd /home/galaxy/galaxy-dist
./run.sh -stop-daemon
./run.sh --daemon 
</pre>
