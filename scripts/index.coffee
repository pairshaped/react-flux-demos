require '../styles/index'

App = require("./components/app.coffee")
ImageStore = require("./stores/image_store")
actions = require("./actions/image_actions")

stores = {ImageStore: new ImageStore()}

flux = new Fluxxor.Flux(stores, actions)

window.flux = flux

document.addEventListener "DOMContentLoaded", (e) ->
  React.render(
    App(flux = {flux})
    document.body
  )
