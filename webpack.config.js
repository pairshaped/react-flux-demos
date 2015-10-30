var webpack = require('webpack');

module.exports = {
  entry: {
           full: './scripts/index.coffee'
         },
  output: {
            path: './dist',
          publicPath: '/',
          filename: "[name].entry.js"
          },

  module: {
            loaders: [
                  { test: /\.coffee$/, loader: "coffee-loader" },
                  { test: /\.sass$/, loader: "style-loader!css-loader!sass?indentedSyntax" }
              ]
          },
  resolve: {
             extensions: ["", ".js", ".coffee", ".sass"]
           },

  plugins: [
    new webpack.ProvidePlugin({
      "jsonp": "superagent-jsonp",
      "superagent": "superagent",
      "React": "react/addons",
      "Flux": "flux",
      "_": "lodash",
      "Bemmer": "bemmer-node/bemmer-class"
    })
    ],

  devServer: {
    port: 8080
  }
}
