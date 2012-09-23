url = require('url')
passport = require('passport')
LocalStrategy = require('passport-local').Strategy
User = require('../../app/models/user')

module.exports = () ->
  url_obj = 
    hostname: process.env.APP_HOST_NAME
    port: process.env.APP_PORT
    protocol: "http"
    pathname: "/auth/twitter/callback"

  passport.use(new LocalStrategy(
    {usernameField: 'email'},
    (email, password, done) ->
      User.authenticate(email, password, (err, user) ->
        done(err, user)
      )
  ))

  passport.serializeUser (user, done) ->
    done(null, user._id)

  passport.deserializeUser (id, done) ->
    User.findById id, (err, user) ->
      done(err, user)

  # passport.use(new TwitterStrategy({
  #     consumerKey: process.env.TWITTER_CONSUMER_KEY,
  #     consumerSecret: process.env.TWITTER_CONSUMER_SECRET,
  #     callbackURL: url.format(url_obj)
  #   },
  #   (token, tokenSecret, profile, done) ->
  #     done(null, profile);
    
  # ))