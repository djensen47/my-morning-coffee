locomotive = require('locomotive')
path = require('path')

options = {"coffeeScript": true, "routesFile": path.resolve('.', './config/routes.coffee')}

console.log('about to boot');

locomotive.boot '.', 'development', options, (err, server) -> 
  throw err if (err)

  express = require('express')()

  throw 'Missing environment var: APP_HOST_NAME' if not process.env.APP_HOST_NAME

  console.log("APP_HOST_NAME = #{process.env.APP_HOST_NAME}")
  console.log("APP_PORT      = #{process.env.APP_PORT}")

  server.listen process.env.VMC_APP_PORT || 3000, 'localhost', ()-> 
    addr = this.address()
    console.log('Locomotive listening on %s:%d', addr.address, addr.port)
  

