fetchPictures = require('../middleware/ajax')
{createStore, applyMiddleware} = require('redux')

imageStore = (state = {pictures: []}, action) ->
  switch action.type
    when 'GET_PICTURES'
      _.extend state['pictures'], action.pictures
    else
      return state

createStoreWithMiddleware = applyMiddleware(fetchPictures)(createStore)
module.exports = store: createStoreWithMiddleware(imageStore)
