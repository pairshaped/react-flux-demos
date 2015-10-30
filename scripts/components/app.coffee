{ div } = React.DOM

{TextContainer} = require("./over_text/index")
{PictureContainer} = require("./images/index")
{Search} = require("./search_box/index")

module.exports = React.createClass
  displayName: "ImageApp"

  render: ->
    div {},
      Search
        handleSearchKeyUp: @props.handleSearchKeyUp
      PictureContainer
          pictures: @props.value
      TextContainer {}
