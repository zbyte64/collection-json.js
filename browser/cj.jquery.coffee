
http = require "../lib/http.coffee"

prep_options = (options)->
  options["accepts"] = {"json":http["content-type"]}
  options["contentType"] = http["content-type"]
  options["dataType"] = "json"

http.get = (href, options={}, done=()->)->
  prep_options(options)
  options['success'] = (data, textStatus, jqXHR)->
    done(null, data)
  $.ajax(href, options)

http.post = (href, options={}, done=()->)->
  prep_options(options)
  options['type'] = 'post'
  options['data'] = JSON.stringify options.body.template
  options['success'] = (data, textStatus, jqXHR)->
    done(null, data)
  $.ajax(href, options)

# TODO
# http.put = (href, options={}, done=()->)->

# http.del = (href, options={}, done=()->)->

window.CollectionJSON = require "../lib/client.coffee"
window.CollectionJSON.http = http
