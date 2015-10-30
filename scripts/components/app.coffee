{ div } = React.DOM

{TextContainer} = require("./over_text/index")
{PictureContainer} = require("./images/index")
{Search} = require("./search_box/index")
ImageActions = require('../actions/image_actions.coffee')
Fluxxor = require('fluxxor')
FluxMixin = Fluxxor.FluxMixin(React)
storeWatchMixin = Fluxxor.StoreWatchMixin

module.exports = React.createFactory React.createClass
  displayName: "ImageApp"

  mixins: [FluxMixin, storeWatchMixin("ImageStore")]

  getStateFromFlux: ->
    flux = @getFlux()
    flux.store("ImageStore").getState()

  componentWillMount: ->
    @getFlux().actions.getImages()
    @getStateFromFlux()

  componentDidMount: ->
    @getStateFromFlux()

  render: ->
    div {},
      Search {}
      PictureContainer
        pictures: @state.pictures
      TextContainer {}
