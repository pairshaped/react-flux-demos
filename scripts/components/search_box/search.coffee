{ div, input } = React.DOM

FluxMixin = Fluxxor.FluxMixin(React)


module.exports = React.createFactory React.createClass
  displayName: "Search"

  mixins: [FluxMixin]

  handleSearchKeyUp: (e) ->
    @getFlux().actions.getImages(e.target.value)

  render: ->
    bem = new Bemmer(block: 'search')

    div
      className: bem.with(element: 'container'),
        input
          className: bem.with(element: 'container-box'),
          placeholder: "Pears"
          onKeyUp: @handleSearchKeyUp
