locomotive = require('locomotive')
passport = require('passport')
Controller = locomotive.Controller
User = require('../models/user')

UserController = new Controller()

# Show the user data
UserController.show = () ->
  if not this.req.isAuthenticated()
    return this.res.redirect(this.urlFor({ action: 'login' }))

  this.user = this.req.user
  this.render()

# Provide a form to create a new account
UserController.new = () ->
  this.render()

# Provide the login form
UserController.loginForm = () ->
  this.title = 'Login'
  this.render()

# Create a new account
UserController.create = () ->
  user = new User();

  user.email = this.param('email')
  user.password = this.param('password');

  self = this
  user.save (err) ->
    if (err)
      return self.redirect(self.urlFor({ action: 'new' }));
    return self.redirect(self.urlFor({ action: 'login' }));lf
  
# Login
UserController.login = () ->
  passport.authenticate('local',
    successRedirect: this.urlFor({ action: 'show' }),
    failureRedirect: this.urlFor({ action: 'login' })
  )(this.__req, this.__res, this.__next)

# Logout
UserController.logout = () ->
  this.req.logout()
  this.redirect('/')

module.exports = UserController
