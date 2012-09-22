locomotive = require('locomotive')
Controller = locomotive.Controller

PagesController = new Controller()

PagesController.main = () ->
  this.title = 'Locomotive'
  this.render()

module.exports = PagesController
