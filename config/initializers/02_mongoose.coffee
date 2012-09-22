module.exports = () ->
  mongoose = require('mongoose')

  mongo = 
    "hostname":"localhost",
    "port":27017,
    "username":"",
    "password":"",
    "name":"",
    "db":"mymorningcoffee"

  if process.env.VCAP_SERVICES
    env = JSON.parse(process.env.VCAP_SERVICES)
    mongo = env['mongodb-1.8'][0]['credentials']

  generate_mongo_url = (obj) ->
      obj.hostname = (obj.hostname || 'localhost')
      obj.port = (obj.port || 27017)
      obj.db = (obj.db || 'test')
      if(obj.username && obj.password)
        "mongodb://" + obj.username + ":" + obj.password + "@" + obj.hostname + ":" + obj.port + "/" + obj.db;
      else
        "mongodb://" + obj.hostname + ":" + obj.port + "/" + obj.db;
  
  mongourl = generate_mongo_url(mongo)
  console.log("Connecting to mongodb at #{mongo.hostname}:#{mongo.port}")
  mongoose.connect(mongourl)
