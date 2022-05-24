# how do enable tls 1.0 on ubuntu 20.04 + haproxy 2.1

- add script to file: nano /etc/ssl/openssl.cnf

```
[ default_conf ]

ssl_conf = ssl_sect

[ssl_sect]

system_default = system_default_sect

[system_default_sect]
MinProtocol = TLSv1
CipherString = DEFAULT:@SECLEVEL=1
```

- and export env ```export OPENSSL_CONF=/path/to/my/openssl.cnf```

- edit cipher haproxy
```
global
        # See: https://ssl-config.mozilla.org/#server=haproxy&server-version=2.0.3&config=intermediate

        ssl-default-bind-ciphers EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH:@SECLEVEL=1
        ssl-default-bind-options ssl-min-ver TLSv1.0 no-tls-tickets
        ssl-default-server-options ssl-min-ver TLSv1.0 no-tls-tickets
        tune.ssl.default-dh-param 2048
```

- restart haproxy and run check
