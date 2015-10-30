{ div } = React.DOM

ReactCSSTransitionGroup = React.createFactory React.addons.CSSTransitionGroup
HeaderText = require('./header_text.coffee')

module.exports = React.createFactory React.createClass
  displayName: "TextContainer"

  render: ->
    bem = new Bemmer(block: 'text')

    ReactCSSTransitionGroup
      transitionName: "header"
      transitionAppear: true
      HeaderText
        bem: bem
