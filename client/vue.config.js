module.exports = {
  configureWebpack: {
    devtool: 'source-map'
  },
  css: {
    loaderOptions: {
      sass: {
        additionalData: `@import "@/shared/assets/scss/_variables.scss";`,
      },
    },
  },
};
