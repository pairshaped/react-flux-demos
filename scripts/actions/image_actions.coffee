mcFly = require('../mcFly/mcFly')

module.exports = mcFly.createActions
  getImages: (search_term = 'pears')->
      actionType: 'get-pictures'
      image_term: search_term
