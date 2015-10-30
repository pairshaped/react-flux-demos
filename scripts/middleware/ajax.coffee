ENDPOINT = "https://api.instagram.com/v1/tags"
POST_QUERY = "media/recent?count=#{4*5}&client_id="
API_KEY = require('../../api_key.coffee')
ImageModel = require('../models/image')

mapPicturesToModelArray = (data) ->
  _.map data, (image) -> new ImageModel(image)

module.exports = (store) -> (next) -> (action) ->
  if action?
    tag = action.tag
  tag ||= "pears"
  superagent
    .get("#{ENDPOINT}/#{tag.split(" ").join('')}/#{POST_QUERY}#{API_KEY}")
    .use(jsonp)
    .end((err, res) =>
      next({type: 'GET_PICTURES', pictures: mapPicturesToModelArray(res.body.data)}))
