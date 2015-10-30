{ div } = React.DOM
Picture = require('./picture.coffee')

module.exports = React.createFactory React.createClass
  displayName: "PictureContainer"

  render: ->
    bem = new Bemmer(block: 'image-fill')

    div
      className: bem.with(element: 'container')
      @props.pictures.map ((picture, idx) ->
        Picture
          key: idx
          picture: picture
          bem: bem)
