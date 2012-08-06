express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
_ = require 'underscore'
google = require 'google'

app = express()
# Add Connect Assets
app.use assets()
# Set View Engine
app.set 'view engine', 'jade'
# Get root_path return index view
app.get '/:mood?', (req, resp) ->

  query = "ASMR #{req.param('mood')} site:youtube.com"

  google query, (err, next, links) ->
    resp.render 'index', results: links

# Define Port
port = process.env.PORT or process.env.VMC_APP_PORT or 3000
# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."