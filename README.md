# VIP Classic Beta

This is currently in Beta, this has been tested however check the Things to do list below.

Adds VIP support to Chassis.

With VIP Quickstart by Automattic now deprecated, this project is set up to take over community involvement.

We only support PHP 7+ due to WP.com websites being upgraded to PHP 7 recently.

## Installing & Documentation

1. Clone `chassis` i.e.: `git clone --recursive https://github.com/Chassis/Chassis chassis`
2. Change into the directory `cd chassis`
    3. Clone `config.yaml` into the content folder i.e.: `git clone https://github.com/stuartshields/vip-config.git content`
4. `vagrant up`
5. `git clone https://github.com/Chassis/vip_classic.git extensions/vip_classic` (This step is important)
6. `vagrant provision`

Note: Have a look at the Chassis documentation on [Custom Host Names](http://docs.chassis.io/en/latest/config/#custom-host-names) if you need to change the domain.

### Things to do

1. Add Concatenation support
2. Add more items to list

### Updating Domain Information

You'll need to update the hosts setup before provisioning. Only add top-level domains.

After the provision has finished, go to `Network Admin > Sites` and add the subdomains.

Download the [mu domain mapping](https://wordpress.org/plugins/wordpress-mu-domain-mapping/) plugin if you require top level domains.

### Adding additional extensions

It's recommended that you install the following Chassis extensions

[Imagick](https://github.com/Chassis/Imagick)

[PHPCS & WPCS](https://github.com/Chassis/phpcs)

[Memcache](https://github.com/Chassis/memcache)

[VIP Debugging](https://github.com/stuartshields/vip-debugging)

Once all extensions are added you can now `vagrant provision`
