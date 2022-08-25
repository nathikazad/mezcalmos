import { initializeApp } from 'firebase/app';
// Follow this pattern to import other Firebase services
// import { } from 'firebase/<service>';

const firebaseConfig = {
  apiKey: "AIzaSyBRQTIUx_-oMdp5_S5e9F8h4Uc4ViZKM4U",
  authDomain: "mezcalmos-staging.firebaseapp.com",
  databaseURL: "https://mezcalmos-staging-default-rtdb.firebaseio.com",
  projectId: "mezcalmos-staging",
  storageBucket: "mezcalmos-staging.appspot.com",
  messagingSenderId: "606383265109",
  appId: "1:606383265109:web:a2050a8335ee6e37d8cbdc"
};

initializeApp(firebaseConfig);

import * as auth from "firebase/auth";
import * as functions from "firebase/functions";


async function main() {
  await auth.signInWithEmailAndPassword(auth.getAuth(), "trial2@gmail.com", "testpass");
  const getPaymentIntent = functions.httpsCallable(functions.getFunctions(), 'stripe-getPaymentIntent');
  getPaymentIntent({
    serviceProviderId: "AZSgfcHBmlWuOGFTREiHGCEui231",
    orderType: "restaurant",
    paymentAmount: 35,
  })
    .then((result) => {

      const data = result.data;
      console.log(data);
    });

  // const setupServiceProvider = functions.httpsCallable(functions.getFunctions(), 'stripe-setupServiceProvider');
  // setupServiceProvider({
  //   serviceProviderId: "AZSgfcHBmlWuOGFTREiHGCEui231",
  //   orderType: "restaurant"
  // })
  //   .then((result) => {

  //     const data = result.data;
  //     console.log(data);
  //   });

  // const updateServiceProvider = functions.httpsCallable(functions.getFunctions(), 'stripe-updateServiceProvider');
  // updateServiceProvider({
  //   serviceProviderId: "AZSgfcHBmlWuOGFTREiHGCEui231",
  //   orderType: "restaurant"
  // })
  //   .then((result) => {

  //     const data = result.data;
  //     console.log(data);
  //   });

  // const addCard = functions.httpsCallable(functions.getFunctions(), 'stripe-addCard');
  // addCard({
  //   paymentMethod: "pm_1LSsCgDV5wKm9SNKVs6AnpYh"
  // })
  //   .then((result) => {

  //     const data = result.data;
  //     console.log(data);
  //   });

  // const chargeCard = functions.httpsCallable(functions.getFunctions(), 'stripe-chargeCard');
  // chargeCard({
  //   serviceProviderId: "AZSgfcHBmlWuOGFTREiHGCEui231",
  //   orderType: "restaurant",
  //   paymentAmount: 35,
  //   cardId: "-N8aJOOSquaVr4cMtr-I"
  // })
  //   .then((result) => {

  //     const data = result.data;
  //     console.log(data);
  //   });
  // const removeCard = functions.httpsCallable(functions.getFunctions(), 'stripe-removeCard');
  // removeCard({
  //   serviceProviderId: "AZSgfcHBmlWuOGFTREiHGCEui231",
  //   orderType: "restaurant",
  //   paymentAmount: 35,
  //   cardId: "-N8aJOOSquaVr4cMtr-I"
  // })
  //   .then((result) => {

  //     const data = result.data;
  //     console.log(data);
  //   });
}
main()





