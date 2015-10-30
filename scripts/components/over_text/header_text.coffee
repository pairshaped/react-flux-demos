{ div, h1 } = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "HeaderText"

  render: ->
    {bem} = @props

    div
      className: bem.with(element: 'header'),
        h1
          className: bem.with(element: 'header-text'),
          "React.js Flux API example"
