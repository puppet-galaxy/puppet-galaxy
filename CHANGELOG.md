#2014.30.08 Release 0.0.7

=> Removed first_run.pp.

=> Instead , we use common_startup , create_db and manage_tools.

=>Service support Galaxy in onecore or multicore both on Debian and CentOS.

=>The galaxy service is launch with galaxy user.

=>Each classes require another class to make the install step by step correctly and start service in the last time.

=>Now we use automatic parameter lookup with Hiera to cconfigure as we want.

=> All the files in galaxy-dist are owned by galaxy and group is galaxy.


#2014.07.08 Release 0.0.6

=> Correction of galaxy::universe

#2014.06.26 Release 0.0.5

=> Rewrite first_run.pp. Now it is really a first run.
It starts and stops Galaxy when it has serving on http://localhost:8080.
