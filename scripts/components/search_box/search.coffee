{ div, input } = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "Search"

  render: ->
    bem = new Bemmer(block: 'search')

    div
      className: bem.with(element: 'container'),
        input
          className: bem.with(element: 'container-box'),
          placeholder: "Pears"
          onKeyUp: @props.handleSearchKeyUp
