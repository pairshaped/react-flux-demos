{ div } = React.DOM

{TextContainer} = require("./over_text/index")
{PictureContainer} = require("./images/index")
{Search} = require("./search_box/index")
ImageActions = require('../actions/image_actions.coffee')

module.exports = React.createFactory React.createClass
  displayName: "ImageApp"

  getInitialState: ->
    pictures: []

  handleImageStoreChange: ->
    newState = @props.ImageStore.getState()
    @setState newState

  componentWillMount: ->
    @props.ImageStore.addChangeListener @handleImageStoreChange

  componentDidMount: ->
    ImageActions.getImages()

  componentWillUnmount: ->
    @props.ImageStore.removeChangeListener @handleImageStoreChange

  render: ->
    div {},
      Search {}
      PictureContainer
        pictures: @state.pictures
      TextContainer {}
