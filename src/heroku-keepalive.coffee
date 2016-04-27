# Description
#   A hubot script that keeps its Heroko web dynos alive.
#
# Notes:
#   This replaces hubot's builtin Heroku keepalive behavior. It uses the same
#   environment variable (HEROKU_URL), but removes the period ping.  Pings will
#   only occur between the WAKEUP_TIME and SLEEP_TIME in the timezone your
#   heroku instance is running in (UTC by default).
#
# Configuration:
#   HUBOT_HEROKU_KEEPALIVE_URL or HEROKU_URL: required
#   HUBOT_HEROKU_KEEPALIVE_INTERVAL: optional, defaults to 5 minutes
#   HUBOT_HEROKU_WAKEUP_TIME: optional, defaults to 6:00 (6 AM).
#   HUBOT_HEROKU_SLEEP_TIME: optional, defaults to 22:00 (10 PM)
#
#   heroku config:add TZ="America/New_York"
#
# URLs:
#   POST /heroku/keepalive
#   GET /heroku/keepalive
#
# Author:
#   Josh Nichols <technicalpickles@github.com>

module.exports = (robot) ->
  keepaliveCallback = (req, res) ->
    res.set 'Content-Type', 'text/plain'
    res.send 'OK'

  # keep this different from the legacy URL in httpd.coffee
  robot.router.post "/heroku/keepalive", keepaliveCallback
  robot.router.get "/heroku/keepalive", keepaliveCallback
