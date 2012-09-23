# Draw routes.  Locomotive's router provides expressive syntax for drawing
# routes, including support for resourceful routes, namespaces, and nesting.
# MVC routes can be mapped mapped to controllers using convenient
# `controller#action` shorthand.  Standard middleware in the form of
# `function(req, res, next)` is also fully supported.  Consult the Locomotive
# Guide on [routing](http://locomotivejs.org/guide/routing.html) for additional
# information.
module.exports = () ->
  this.root('pages#main')
  this.match('logs', 'pages#logs')

  this.resource('user')
  this.match('login', 'user#loginForm', { via: 'get' })
  this.match('login', 'user#login', { via: 'post' })
  this.match('logout', 'user#logout')
