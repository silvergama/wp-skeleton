# wp-wordpress-skeleton

## Overview
A basic Wordpress skeleton store


### Instalation

```
git clone https://github.com/silvergama/wp-skeleton.git <site_name>
cd site_name
mv .env.sample .env
// configure .env with your data
make start
make translate (if it is a Brazilian site)
```

### Which plugins are instaled and activated?
- contact-form-7 

### Default theme
- twentytwenty

### How to configure after started?
`docker exec worpdress wp ...`

e.g.: `docker exec wordpress wp plugin delete contact-form-7`
