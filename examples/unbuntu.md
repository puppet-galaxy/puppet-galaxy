Unbuntu 12.04  

* Install puppet
<pre>
apt-get update
apt-get install puppet
</pre>

* Get urgi-galaxy module
<pre>
puppet module install urgi-galaxy
puppet apply -e "include galaxy"
</pre>
