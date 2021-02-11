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
  // chainWebpack: config => {
  //   console.log(process.VUE_CLI_SERVICE.projectOptions);


  //   config
  //     .plugin('copy')
  //     .tap(args => {
  //       args[0].push({
  //         from: 'public/sw/service-worker.js',
  //         to: process.VUE_CLI_SERVICE.projectOptions.outputDir
  //       });
  //       return args;
  //     })
  // },

};