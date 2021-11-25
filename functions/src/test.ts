import * as functions from "firebase-functions";
export = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", { structuredData: true });
  response.send("OOoh!");
});