const path = require("path");

module.exports = {
  mode: "production",
  entry: "./app/javascript/application.js",
  output: {
    filename: "bundle.js",
    path: path.resolve(__dirname, "../../public/packs"),
    publicPath: "/packs/",
  },
  resolve: {
    extensions: [".js", ".jsx", ".ts", ".tsx"],
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx|ts|tsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
    ],
  },
};
