Automatic Server Configuration
=======================================================
These are the puppet configurations we used to autoscale.

```bash
# NOTE : for now, just ensure puppet is installed on your system.
./configure               # TODO: Ensure puppet is intsalled on the system
make                      # NOOP.
make install              # NOOP.

puppet manifests/site.pp  # Configures this machine for twitterhealth.
```

**Note :** before you do anything, I highly recommend reading the [background section](#background--puppet).

Background : Puppet
=======================================================
Here are some good tutorials to get you up to speed.  It's important to get a working
knowledge of how Puppet works so you can maximize your utility of the software and make
it easy for others to understand and find out what you're doing. 

	http://docs.puppetlabs.com/learning/

	http://www.debian-administration.org/articles/526 
	
	http://finninday.net/wiki/index.php/Zero_to_puppet_in_one_day 
	
	https://github.com/robertstarmer/puppet-couchdb
	

Quick Guide on Server Deployment
=======================================================
When Andrew was working on server automation and autoscaling, he created a server
image which had puppet pre-installed, uploaded the necessary puppet certificates 
(for the managed mode, you shouldn't need this in standalone mode).He recommends you do the same.


### [*recommended*] How to configure Stand-Alone nodes
With standalone servers, all you have to do is download a puppet manifest
and apply the configuration to the server. One of the most overlooked features 
in Puppet is the puppet executable. This allows you to both compile and apply 
catalogs locally, removing the complexity of running in client/server mode.

This makes puppet a viable tool for application bootstrapping, even on one machine.

Executing:

    #>puppet manifests/mymanifest.pp

will apply the configuration from the local source file mymanifest.pp to the 
local host. The puppet executable takes many of the same long options as puppet, namely:

    --noop - allows you to see the effects of the compiled catalog without making any modifications to the local machine
    --verbose, --debug - increased logging output
    --modulepath - puppet standalone can use modules to organize and re-use code just like client server
    --environment - standalone can also use multiple environments.

The puppet executable also reads configuration from the [puppet] section of puppet.conf

Running puppet on a single machine is not only a perfectly valid use case, it is
also the best way to get started with the puppet language, and the best way to 
quickly develop and test new manifests.

#### Software Packages and Puppet Architecture
The manifest file contains server configurations and looks something like this : 

```puppet
node 'default' {
	include developer_keys	# Configure developer ssh-keys for all servers
	include git		# Install git and system wide .gitignore
	include motd		# Install the greeting for our team
}

node 'webserver' inherits default{
	include oracle_java
	include python_ai
    include pip
}

node 'database' inherits webserver{
	include couchdb
}
```

`nodes` are server roles that you define with dependencies.  You can inherit dependencies 
as shown above, therefore making server deployment an object oriented task.

the `includes` are the `modules` in puppet terminology.  You can look up how the anatomy of a puppet module,
but this is where you can define all the parameters of the software you want installed or run on a server.
Feel free to browser the `modules/` directory to see working examples.

### [not recommended] How to configure managed nodes
Here's how to sign certificates after starting a server from an image
that has puppet installed, `/etc/hosts` configured to point to the 
master node, and certificates installed.

```bash
# Request authentication from master node
[new-server$] puppet agent --server puppet --waitforcert 60 --test
	
# --> now go to  root@puppet.fount.in to sign certificate
# Display certificates awaiting authentications
[puppet$] puppet cert --list
	
# Sign the appropriate server's certificate
[puppet$] puppet cert --sign mytestagent.example.com
```

Currently Deployed Servers
=======================================================
It might be a good idea to keep a list of servers that are deployed 
for reference here.
