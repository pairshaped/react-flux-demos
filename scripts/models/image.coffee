module.exports = class Image

  constructor: (image) ->
    @url = image.images.standard_resolution.url
    @instagram_link = image.link
    @author = "#{image.user.username} -- #{image.user.full_name}"
    @title = "#{image.caption.text}"
    @tags = image.tags
