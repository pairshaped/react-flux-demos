{ div } = React.DOM

HeaderText = require('./header_text.coffee')

module.exports = React.createFactory React.createClass
  displayName: "TextContainer"

  render: ->
    bem = new Bemmer(block: 'text')

    HeaderText
      bem: bem
