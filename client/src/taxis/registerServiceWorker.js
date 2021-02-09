/* eslint-disable no-console */


const prod = process.env.NODE_ENV === 'production'
const test = process.env.NODE_ENV === 'test'
console.log((prod || test));

const shouldSW = 'serviceWorker' in navigator //&& (prod || test)
if (shouldSW) {

  navigator.serviceWorker.register(`${process.env.BASE_URL}sw-taxi.js`).then((result) => {
    console.log("Service Worker Registered!", result)
  }).catch((err) => {
    console.log("Something went wrong with registration!", err)
  });
} else {
  console.log({
    test
  });
  console.log({
    shouldSW
  });
  console.log({
    navigator
  });

}