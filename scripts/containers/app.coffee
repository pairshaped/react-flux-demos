App = require("../components/app.coffee")
ReactRedux = require('react-redux')
connect = ReactRedux.connect

mapStateToProps = (state) ->
  value: state

mapDispatchToProps = (dispatch) ->
  handleSearchKeyUp: (e) ->
    if e.keyCode == 13
      dispatch({tag:  e.target.value})
    else
      timer = setTimeout( =>
      dispatch({tag: e.target.value}), 2000)

module.exports = connect(mapStateToProps, mapDispatchToProps)(App)
