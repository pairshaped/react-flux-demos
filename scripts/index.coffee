require '../styles/index'

App = require("./components/app.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  React.render(
    App()
    document.body
  )
