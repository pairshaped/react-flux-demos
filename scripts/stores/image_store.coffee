Fluxxor = require('fluxxor')

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

module.exports = Fluxxor.createStore

  initialize: (options) ->
    @pics = []
    @bindActions('get-pictures', @fetchData)

  getState: ->
    pictures: @pics

  fetchData: (action) ->
    tag = action.image_term
    tag = "pears" unless tag?
    superagent
      .get("#{ENDPOINT}/#{tag.split(" ").join('')}/#{POST_QUERY}#{API_KEY}")
      .use(jsonp)
      .end((err, res) =>
          @pics = mapPicturesToModelArray(res.body.data)
          @emit('change'))
