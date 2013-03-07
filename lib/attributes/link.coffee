
http = require "../http.coffee"
client = require "../client.coffee"

Collection = require "./collection.coffee"

module.exports = class Link
  constructor: (@_link)->

  @define "href",
    get: ->
      @_link.href
  @define "rel",
    get: ->
      @_link.rel
  @define "prompt",
    get: ->
      @_link.prompt

  follow: (done=()->)->
    options = {}

    http.get @_link.href, options, (error, collection)->
      return done error if error
      client.parse collection, done
