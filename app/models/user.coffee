# User model

mongoose = require('mongoose')
bcrypt = require('bcrypt')
Schema = mongoose.Schema
ObjectId = Schema.ObjectId;

UserSchema = new Schema(
  email: 
    type: String
    required: true
    unique: true
  hash: 
    type: String
    required: true
  salt: 
    type: String
    required: true
)

UserSchema.virtual('password').get () ->
  this._password
.set (password) ->
  this._password = password
  salt = this.salt = bcrypt.genSaltSync(10)
  this.hash = bcrypt.hashSync(password, salt)
 
UserSchema.methods.check_password = (password, callback) ->
  bcrypt.compare(password, this.hash, callback)

UserSchema.statics.authenticate = (email, password, callback) ->
  this.findOne {email: email}, (err, user) ->
    return callback(err) if err
    return callback(null, false) if not user
    user.check_password password, (err, password_correct) ->
      return callback(err) if err
      return callback(null, false) if not password_correct
      return callback(null, user)

# UserSchema.pre 'save', (next) ->
  # this.password = 
  # next()


module.exports = mongoose.model('User', UserSchema)