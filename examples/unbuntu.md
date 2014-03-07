Unbuntu 12.04  

* Install puppet
<pre>
apt-get update
apt-get install puppet
</pre>

* Get urgi-galaxy module
<pre>
wget https://forgeapi.puppetlabs.com/v3/files/urgi-galaxy-0.0.1.tar.gz
tar xvzf urgi-galaxy-0.0.1.tar.gz 
mv urgi-galaxy-0.0.1 /etc/puppet/modules/galaxy
puppet apply -e "include galaxy"
</pre>
