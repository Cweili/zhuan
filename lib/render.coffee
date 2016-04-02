Renderer = require('marked').Renderer

###
# render
###
module.exports = render = new Renderer()

render.heading = (text, level) ->
  id = text?.replace(/[^A-Za-z0-9]/g, '-').replace(/\-+/g, '-').replace(/(^\-)|(\-$)/g, '')
  (if level < 2 then '<div class="page-header">' else '') +
  "<h#{level}" +
  (if id then " id=\"#{id}\"" else '') +
  ">#{text}</h#{level}>" +
  (if level < 2 then '</div>' else '')

render.table = (header, body) ->
  '<div class="table-responsive">\
    <table class="table table-bordered table-striped">\
      <thead>' + header + '</thead>\
      <tbody>' + body + '</tbody>\
    </table>\
  </div>'
