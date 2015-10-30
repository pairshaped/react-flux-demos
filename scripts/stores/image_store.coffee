ImageDispatcher = require("../dispatcher.coffee")
{EventEmitter} = require("events")
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

class ImageStore extends EventEmitter.prototype

  @getState: ->
    state

  @emitChange: ->
    @emit(CHANGE_EVENT)

  @addChangeListener: (cb) ->
    @on(CHANGE_EVENT, cb)

  @removeChangeListener: (cb) ->
    @removeListener(CHANGE_EVENT, cb)

  @fetchData: (tag = 'pears') ->
    superagent
      .get("#{ENDPOINT}/#{tag.split(" ").join('')}/#{POST_QUERY}#{API_KEY}")
      .use(jsonp)
      .end((err, res) =>
          ImageActions.recieveDataFromAjax(res.body.data))

  @_dispatchHandler: (payload) ->
    switch payload.actionType
      when "set-pictures"
        state.pictures = mapPicturesToModelArray(payload.data)
        ImageStore.emitChange()
      when "get-pictures"
        state.pictures = []
        ImageStore.fetchData(payload.image_term)

  dispatchToken: ImageDispatcher.register(ImageStore._dispatchHandler)

module.exports = ImageStore
