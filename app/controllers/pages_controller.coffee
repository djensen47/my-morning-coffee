locomotive = require('locomotive')
Controller = locomotive.Controller
Log = require('../models/log');

PagesController = new Controller()

PagesController.main = () ->
  new Log({message: "Main page."}).save (err) ->
    console.log(err) if err    

  this.title = 'Locomotive'
  this.render()

PagesController.logs = () ->
  self = this
  this.title = 'Locomotive Logs'
  Log.find (err, logs) ->
    console.log(err) if err
    self.logs = logs
    self.render()

module.exports = PagesController
