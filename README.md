Galaxy
------

This is the galaxy module for a basic Galaxy installation, not for production. Galaxy is an open, web-based platform for accessible, reproducible, and transparent computational biomedical research.

Important note
--------------

During its first run, galaxy installs some python eggs, it takes times, so be patient, if your web page does not come up (http://127.0.0.1:8080), wait 5 to 10 minutes depending of your hardware.


Using it :
----------

* To connect to the galaxy web interface :

http://127.0.0.1:8080/

* To stop it :
<pre>
su - galaxy
/home/galaxy/galaxy-dist/run.sh --stop-daemon
</pre>

* To start it :
<pre>
su - galaxy
/home/galaxy/galaxy-dist/run.sh --daemon
</pre>

Contact
-------

mloaec@versailles.inra.fr

oinizan@versailles.inra.fr

More info about Galaxy :
------------------------
http://galaxyproject.org
