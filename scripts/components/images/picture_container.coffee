{ div } = React.DOM
Picture = require('./picture.coffee')

module.exports = React.createFactory React.createClass
  displayName: "PictureContainer"

  render: ->
    bem = new Bemmer(block: 'image-fill')

    div
      className: bem.with(element: 'container')
      if @props.pictures
        _.map @props.pictures, ((picture, idx) ->
          Picture
            key: idx
            picture: picture
            bem: bem)
