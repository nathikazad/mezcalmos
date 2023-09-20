

import { initEnv } from "../../supervisor/src/init"
import { generateCustomerFlyerForBusiness } from "./utilities/links/flyer2";

// import { addDriver } from "./serviceProvider/addDriver";
// import { markMessagesAsCancelled } from "./utilities/senders/whatsapp/markMessagesAsCancelled";
// import { addAndNotify } from "./utilities/senders/whatsapp/handleWhatsapp";
// import { addMessageToDatabase, handleWhatsapp } from "./utilities/senders/whatsapp";
// import { markMessagesAsResponded } from "./utilities/senders/whatsapp";
// import { markMessagesAsFinished } from "./utilities/senders/whatsapp";


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
// console.log("here");



// markMessagesAsCancelled(14444, {phoneNumber: "+12098628445"});
// markMessagesAsFinished(10, {phoneNumbers: ["+12098628445"]});


async function run() {
  const name = await generateCustomerFlyerForBusiness('yaab');
  console.log(name);
}
run();

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