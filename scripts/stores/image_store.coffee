mcFly = require('../mcFly/mcFly')
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

ImageStore = mcFly.createStore({
  getState: ->
    state

  _fetchData: (tag = 'pears') ->
    superagent
      .get("#{ENDPOINT}/#{tag.split(" ").join('')}/#{POST_QUERY}#{API_KEY}")
      .use(jsonp)
      .end((err, res) =>
        state.pictures = mapPicturesToModelArray(res.body.data)
        ImageStore.emitChange()
      )

}, (payload) ->
  switch payload.actionType
    when "get-pictures"
      state.pictures = []
      ImageStore._fetchData(payload.image_term)
)

module.exports = ImageStore
