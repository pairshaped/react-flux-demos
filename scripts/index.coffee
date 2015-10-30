require '../styles/index'

ReactRedux = require('react-redux')
Provider = ReactRedux.Provider

{store} = require('./reducers/images')
App = require('./containers/app')

addEventListener "DOMContentLoaded", (e) ->
  React.render(
    React.createElement(Provider, {store: store},
    () ->
      React.createElement(App, null)
    )
    document.body
  )

# Initial load
store.dispatch('GET_PICTURES')
