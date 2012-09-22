locomotive = require('locomotive')
path = require('path')

options = {"coffeeScript": true, "routesFile": path.resolve('.', './config/routes.coffee')}

locomotive.boot('.', 'development', options, (err, server) -> 
  throw err if (err)

  server.listen(process.env.VMC_APP_PORT || 3000, 'localhost', ()-> 
    addr = this.address()
    console.log('Locomotive listening on %s:%d', addr.address, addr.port);
  )
)
