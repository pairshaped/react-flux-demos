Reflux = require('reflux')

ImageActions = require("../actions/image_actions.coffee")

ImageModel = require("../models/image.coffee")
apiKey = require("../../api_key.coffee")

CHANGE_EVENT = 'change'
ENDPOINT = "https://api.instagram.com/v1/tags"
POST_QUERY = "media/recent?count=#{4*5}&client_id="
API_KEY = apiKey

state =
  pictures: []

mapPicturesToModelArray = (data) ->
  _.map data, (image) -> new ImageModel(image)

module.exports = Reflux.createStore
  listenables: [ImageActions]

  fetchData: (tag = 'pears') ->
    superagent
      .get("#{ENDPOINT}/#{tag.split(" ").join('')}/#{POST_QUERY}#{API_KEY}")
      .use(jsonp)
      .end((err, res) =>
        state = mapPicturesToModelArray(res.body.data)
        @trigger state
      )
