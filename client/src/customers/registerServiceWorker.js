/* eslint-disable no-console */


// const prod = process.env.NODE_ENV === 'production'
// const test = process.env.NODE_ENV === 'test'
// console.log((prod || test));
// console.log(navigator.serviceWorker);

const shouldSW = 'serviceWorker' in navigator //&& (prod || test)
if (shouldSW) {

  navigator.serviceWorker.register(`${process.env.BASE_URL}sw/sw-customer.js`).then((registration) => {
    //console.log("Service Worker Registered!", registration)
    registration.update();
  }).catch(() => {
    //console.log("Something went wrong with registration!", err)
  });
}