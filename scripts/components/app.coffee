{ div } = React.DOM

{TextContainer} = require("./over_text/index")
{PictureContainer} = require("./images/index")
{Search} = require("./search_box/index")
ImageActions = require('../actions/image_actions.coffee')
ImageStore = require('../stores/image_store')

module.exports = React.createFactory React.createClass
  displayName: "ImageApp"

  mixins: [ImageStore.mixin]

  getInitialState: ->
    ImageActions.getImages()
    ImageStore.getState()

  storeDidChange: ->
    @setState ImageStore.getState()

  render: ->
    div {},
      Search {}
      PictureContainer
        pictures: @state.pictures
      TextContainer {}
