require '../styles/index'

App = require("./components/app.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  React.render(
    App(
      ImageStore: require('./stores/image_store.coffee')
    )
    document.body
  )
