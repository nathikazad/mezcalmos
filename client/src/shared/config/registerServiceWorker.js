/* eslint-disable no-console */


// const prod = process.env.NODE_ENV === 'production'
// const test = process.env.NODE_ENV === 'test'
//console.log((prod || test));

async function registerServiceWorker(appName) {
  // console.log("Registering service worker")
  const shouldSW = 'serviceWorker' in navigator //&& (prod || test)
  if (shouldSW) {
    // let sws = await navigator.serviceWorker.getRegistrations()
    // for(let i in sws) {
    //   await sws[i].unregister()
    // }
    
    navigator.serviceWorker.register(`${process.env.BASE_URL}sw-${appName}.js`).then((registration) => {
      // console.log("Service Worker Registered!", registration)
      registration.update();
    }).catch((err) => {
      console.log("Something went wrong with registration!", err)
    });
  }
}

module.exports = {
  registerServiceWorker
}