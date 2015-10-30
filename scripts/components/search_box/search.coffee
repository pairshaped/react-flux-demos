{ div, input } = React.DOM

ImageActions = require('../../actions/image_actions.coffee')

timer = null

module.exports = React.createFactory React.createClass
  displayName: "Search"

  handleSearchKeyUp: (e) ->
      ImageActions.fetchData(e.target.value)

  render: ->
    bem = new Bemmer(block: 'search')

    div
      className: bem.with(element: 'container'),
        input
          className: bem.with(element: 'container-box'),
          placeholder: "Pears"
          onKeyUp: @handleSearchKeyUp
