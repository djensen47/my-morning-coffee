locomotive = require('locomotive')
Controller = locomotive.Controller
Log = require('../models/log');

PagesController = new Controller()

PagesController.main = () ->
  new Log({message: "Main page."}).save()

  this.title = 'Locomotive'
  this.render()

PagesController.logs = () ->
  self = this
  this.title = 'Locomotive Logs'
  Log.find (err, logs) ->
    self.logs = logs
    self.render()

module.exports = PagesController
