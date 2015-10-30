{ div, a, img } = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "Picture"

  render: ->
    {picture, bem} = @props

    div
      className: bem.with(element: 'image-box'),
        a
          href: picture.instagram_link
          img
            className: bem.with(element: 'image')
            src: picture.url
            title: "#{picture.title} by: #{picture.author}"
