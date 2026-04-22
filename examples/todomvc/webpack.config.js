var path = require('path');
var { PORT } = require('./apiConfig');
var setupRoutes = require('./apiRoutes');

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
    port: PORT,
    host: '127.0.0.1',
    static: {
      directory: __dirname,
      publicPath: '/'
    },
    hot: false,
    liveReload: true,
    setupMiddlewares: (middlewares, devServer) => {
      setupRoutes(devServer.app);
      return middlewares;
    }
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
