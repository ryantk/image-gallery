# Image Gallery

## Building the project

1. Ensure you have the correct version of ruby installed (check .ruby-version).
2. Run `bundle install`
3. Run `npm install`
3. Ensure you have `iamgemagick` installed on your system.

### More setup

1. run `rake db:reset` or on docker `docker-compose run web db:reset`

## Testing

To run the tests simply:

```
$ bin/test
```

## Dependencies

### MongoDb

Mongodb must be running, if you have docker installed simply run:

```
$ bin/mongo
```

### Image Magick

Find out more here: https://imagemagick.org
