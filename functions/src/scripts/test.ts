

import { log } from "firebase-functions/logger";
import { initEnv } from "../../../supervisor/src/init"
import { checkout } from "./../restaurant/checkoutCart";
import { CustomerAppType } from "./../shared/models/Generic/Generic";
import { DeliveryType, PaymentType } from "./../shared/models/Generic/Order";
// import { markMessagesAsFinished } from "./utilities/senders/whatsapp/markMessagesAsFinished";
// import { generateA4 } from "./utilities/links/flyer2";
// import { addAndNotify } from "./utilities/senders/whatsapp/handleWhatsapp";

// import { addDriver } from "./serviceProvider/addDriver";
// import { markMessagesAsCancelled } from "./utilities/senders/whatsapp/markMessagesAsCancelled";
// import { addAndNotify } from "./utilities/senders/whatsapp/handleWhatsapp";
// import { addMessageToDatabase, handleWhatsapp } from "./utilities/senders/whatsapp";
// import { markMessagesAsResponded } from "./utilities/senders/whatsapp";



initEnv();
// addAndNotify([{
//     id: "sd",
//     changes: [
//         {
//             field: "not sure",
//             value: {
//                 "contacts": [
//                     {
//                         "profile": {
//                             "name": "Nathik Azad"
//                         },
//                         "wa_id": "12098628445"
//                     }
//                 ],
//                 messages: [
//                     {
//                         from: "12098628445",
//                         text: {
//                             "body": "Test1"
//                         },
//                         id: "id",
//                         type: "text",
//                         timestamp: "1694371939"
//                     },
//                     {
//                         from: "12098628445",
//                         text: {
//                             "body": "Test2"
//                         },
//                         id: "id",
//                         type: "text",
//                         timestamp: "1694371939"
//                     },
//                     {
//                         from: "12098628445",
//                         text: {
//                             "body": "Test3"
//                         },
//                         id: "id",
//                         type: "text",
//                         timestamp: "1694371939"
//                     }
//                 ],
//                 "messaging_product": "whatsapp",
//                 "metadata": {
//                     "display_phone_number": "5215513967128",
//                     "phone_number_id": "118641337997648"
//                 }
//             }
//         }
//     ]
// }])
console.log("here");



// markMessagesAsCancelled(14444, {phoneNumber: "+12098628445"});
// markMessagesAsFinished(14444, {phoneNumbers: ["+5219541783977"]});
// function generateRandomString(length: number): string {
//   const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
//   let result = '';

//   for (let i = 0; i < length; i++) {
//     const randomIndex = Math.floor(Math.random() * characters.length);
//     result += characters[randomIndex];
//   }

//   return result;
// }

// Loop to generate 10 random strings of length 4




// async function run() {
  
//   const foursix = "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/links%2Fyaab%2FFlyer%203%20-%20Mezkala-3%204x6.png?alt=media&token=4b865d88-b222-4ba1-beb4-b83157d34eb6"
//   // const hungryimage = "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/links%2Fyaab%2FFlyer%202%20A1%20-%20Mezkala-min.png?alt=media&token=2aa266f8-bbb3-439d-a7d8-2fcaf2352d60"
//   // const findusimage = "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/links%2Fyaab%2FFlyer%203%20A1%20-%20Mezkala.png?alt=media&token=d8515e0f-2a15-44d7-8c26-6fa15ee284f8"
//   // await generateA4('yaab', "flyers/restaurants", image)
//   // await generateA4('papi', "flyers/restaurants", image)
//   // for (let i = 0; i < 10; i++) {
//   //   const randomString = generateRandomString(4);
//   await generateA4({
//     uniqueId:"yaab", 
//     location: "flyers/rest-tabletop", 
//     image: foursix, 
//     additionalStyles: {
//       top: "534px",
//       left: "210px"
//     },
//     qrLink:"https://storage.googleapis.com/mezcalmos-31f1c.appspot.com/links%2Fyaab%2FcustomerQR-qr.png"
//     // qrLink: "https://storage.googleapis.com/mezcalmos-31f1c.appspot.com/links%2Fa1%2FcustomerQR-qr.png"
//   })
// // }
// }
// run();

// import puppeteer from 'puppeteer';

// const run = async () => {
//     const browser = await puppeteer.launch();
//     const page = await browser.newPage();
//     await page.goto('https://google.com');
//     await page.screenshot({ path: 'screenshot.png' });
//     await page.screenshot({ path: 'screenshot.png' });
//     await browser.close();
//   };
  
//   run().catch(console.error);


checkout(14444,
  {
    "tripDistance": 3966,
    "deliveryType": DeliveryType.Delivery,
    "tripPolyline": "ab{_BdeooQtCNoAxB_CzEtF`B~A`@jAb@`Cr@hHhBpEdAfAqEtBwHf@{AfCgFlA}B|@aBzCgG~FkLxBmEh@kAt@cCHg@NaB@cBa@oFu@oIo@iI[yDCu@@kBVoBb@cB~@eCf@cAj@y@`Ay@^O|@WVDpA]zBw@j@x@~@nATHVDnB@n@BR?NEnCyCl@m@",
    "restaurantId": 5,
    "paymentType": PaymentType.Cash,
    "tripDuration": 696,
    "notes": "",
    "stripeFees": 0,
    "deliveryCost": 16,
    "customerAppType": CustomerAppType.Native,
    "customerLocation": {
      "lat": 15.856972935971875,
      "lng": -97.05796439698636,
      "address": "Av. Del Morro 4, Playa Zicatela, 70934 Brisas de Zicatela, Oax., Mexico"
    }
  }
  ).then((c) => {
    log(`succes ${c.success}`)
    console.log(c.orderId);
    ;
  })