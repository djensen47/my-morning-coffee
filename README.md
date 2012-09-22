My Morning Coffee
=================

Scaffolding for basic node.js app that is ready to deploy on a CloudFoundry service like [AppFog](http://appfog.com).

This project consists of the following components.

- [CoffeeScript](http://coffeescript.org/) as the programming language.
- [Locomotive.js](https://github.com/jaredhanson/locomotive) (based on [Express.js](https://github.com/visionmedia/express))
  - The version of Locomotive is a [forked version](https://github.com/djensen47/locomotive), whcih supports CoffeeScript
  - [Less](https://github.com/cloudhead/less.js) for CSS
  - [Jade](https://github.com/visionmedia/jade) for templates
- [Bootstrap](http://twitter.github.com/bootstrap/) for look and feel (works well with Less)
- [Bootswatch](http://bootswatch.com/) for Boostrap themes
- [Mongoose]() for MongoDB ORM

Uses
----

- Bootstrap a web application
- Great for hackathons, just checkout the code and you're ready to go

Starting
--------
To run the app simply run the following command:

    $ node start

The `start.js` file will kick off the CoffeeScript app.

Deployment
----------

Here are deployment instructions for various Platform as a Service environments.

### AppFog (Cloud Foundry based)


First time:

    $ gem install af
    $ af login
    $ af push

Subsequent updates:

    $ af update <ap-name>


Roadmap
-------

- Twitter authentication
- Facebook authentication

Notes
-----

Generated the express app using the following command line:

    express --sessions --css less my-morning-coffee

Release Notes
-------------

# 0.2.0

- Switched from express to a branched version of Locomotive.js (includes CoffeeScript support)
- Added mongoose and an example of using the models directory

