var path = require('path');

module.exports = {
  mode: 'development',
  devtool: 'eval-source-map',
  entry: './js/index',
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/static/'
  },
  devServer: {
    port: 3001,
    host: '127.0.0.1',
    static: {
      directory: __dirname,
      publicPath: '/'
    },
    hot: false,
    liveReload: true
  },
  resolve: {
    extensions: ['.js', '.jsx']
  },
  module: {
    rules: [{
      test: /\.jsx?$/,
      use: ['babel-loader'],
      include: path.join(__dirname, 'js')
    }]
  }
};
