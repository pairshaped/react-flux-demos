ImageDispatcher = require('../dispatcher.coffee')

module.exports =
  getImages: (search_term = 'pears')->
    ImageDispatcher.dispatch
      actionType: 'get-pictures'
      image_term: search_term

  recieveDataFromAjax: (data) ->
    ImageDispatcher.dispatch
      actionType: 'set-pictures'
      data: data
