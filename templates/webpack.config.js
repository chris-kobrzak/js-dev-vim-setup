var config = {
  entry: "./app/app.jsx",

  output: {
    path: "./dist/",
    filename: "bundle.js"
  },

  module: {
    loaders: [{
      test: /\.jsx?/,
      exclude: /node\_modules/,
      loaders: [ "babel" ]
    }]
  },

  devtool: "eval-source-map"
}

module.exports = config
