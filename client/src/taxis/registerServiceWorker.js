/* eslint-disable no-console */


// const prod = process.env.NODE_ENV === 'production'
// const test = process.env.NODE_ENV === 'test'
//console.log((prod || test));

const shouldSW = 'serviceWorker' in navigator //&& (prod || test)
if (shouldSW) {

  navigator.serviceWorker.register(`${process.env.BASE_URL}sw/sw-taxi.js`).then((registration) => {
    //console.log("Service Worker Registered!", result)
    registration.update();
  }).catch(() => {
    //console.log("Something went wrong with registration!", err)
  });
}