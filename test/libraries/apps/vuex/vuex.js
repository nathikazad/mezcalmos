
module.exports = {
  // getting return value: https://stackoverflow.com/questions/57570538/how-do-i-return-a-value-from-page-evaluate-in-puppeteer
  dispatch: async (page, action, params) => {
    await page.evaluate(({action, params}) => {
      window.app.$store._actions[action][0](params)
    }, {action, params});
  },
  get: async (page, param) => {
    return await page.evaluate(({param}) => {
      return window.app.$store.getters[param]
    }, {param});
  },
}