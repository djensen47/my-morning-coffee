My Morning Coffee
=================

Scaffolding for basic node.js app that is ready to deploy on a CloudFoundry service like [AppFog](http://appfog.com).

This project consists of the following components.

- CoffeeScript as the programming language.
- Express.js
  - Less for CSS
  - Jade for templates
- Bootstrap for look and feel (works well with Less)
- Bootswatch for Boostrap themes

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

AppFog (Cloud Foundry based)
============================

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
- MongoDB support

Notes
-----

Generated the express app using the following command line:

    express --sessions --css less my-morning-coffee
