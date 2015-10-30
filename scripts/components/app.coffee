{ div } = React.DOM

{TextContainer} = require("./over_text/index")
{PictureContainer} = require("./images/index")
{Search} = require("./search_box/index")
ImageActions = require('../actions/image_actions.coffee')
ImageStore = require('../stores/image_store')

Reflux = require('reflux')

module.exports = React.createFactory React.createClass
  displayName: "ImageApp"

  mixins: [Reflux.connect(ImageStore, 'pictures')]

  getInitialState: ->
    pictures: []

  componentDidMount: ->
    ImageActions.fetchData()

  render: ->
    div {},
      Search {}
      PictureContainer
        pictures: @state.pictures
      TextContainer {}
