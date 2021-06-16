const functions = require('firebase-functions');
const sender = require("./sender")
const keys = require("./keys")
module.exports = {
  push,
  notifyDriversNewRequest,
  sendTest,
  notifyPromoterOfConversion,
  notifyPromoterOfReferral
}

const webpush = require('web-push')
const vapidKeys = keys.keys().vapidkeys
webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.public,
  vapidKeys.private
)

async function push(firebase, userId, message, particpantType = "customer") {
  firebase.database().ref(`/notifications/${particpantType}/${userId}`).push(message)
  let subscription
  if(particpantType == "customer") {
    subscription = (await firebase.database().ref(`/users/${userId}/notificationInfo`).once('value')).val();
  } else if(particpantType == "taxi") {
    subscription = (await firebase.database().ref(`/taxiDrivers/${userId}/notificationInfo`).once('value')).val();
  }
  if(subscription){
    webpush.sendNotification(subscription, JSON.stringify(message))
    .catch((e) => {
      console.log("web push error ", particpantType, userId)
    })
  }
}

async function notifyDriversNewRequest(firebase, address) {
  drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  let i = 1;
  let j = 0;
  for (let driverId in drivers){
    let driver = drivers[driverId]
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(driver.notificationInfo) {   
        console.log(i)  
        webpush.sendNotification(driver.notificationInfo, JSON.stringify({
          notificationType: "newOrder",
          message: `Hay una nueva orden de taxi de ${address}, vea si puede aceptarla.`
        })).catch((e) => {
          functions.logger.error(`web push error, ${driverId}`, e);
          j = j + 1;
          console.log("no of errors ",j)
        })
        i = i + 1;
      }
    }
  }

  users = (await firebase.database().ref(`/users`).once('value')).val();
  for (let driverId in drivers){
    let driver = drivers[driverId]
    let user = users[driverId]
    
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(user.info.iphone && user.info.phoneNumber){     
        sender.sendSMS({
          message: `Hay una nueva orden de ${address}`,
          phoneNumber: user.info.phoneNumber
        }).catch(function(e){
          console.log(e)
        })
      }
    }
  }
}

async function notifyPromoterOfConversion(customerName, promoter) {
  sender.sendSMS({
    message: `Hola, ${promoter.name}, tu referido ${customerName} ya ha hecho tres viajes, por lo tanto has ganado 50 pesos más. Ahora tienes un total de ${promoter.totalCustomerInvites} referidos, ${promoter.totalCustomerConversions} conversiones y ${promoter.totalPesosEarned} pesos ganados. Recógelo cuando quieras contactando a Alejandro @ 954-118-4711`,
    phoneNumber: promoter.phoneNumber
  }).catch(function(e){
    console.log("notifyPromoterOfConversion error", e)
  })
}

async function notifyPromoterOfReferral(firebase, params, code) {
  code = code.toLowerCase()
  let promoter = (await firebase.database().ref(`/promoters/${code}`).once('value')).val();
  let user = (await firebase.database().ref(`/user/${params.userId}`).once('value')).val();
  sender.sendSMS({
    message: `Hola, ${promoter.name}, tu referido ${user.name} se ha registrado con su código de referencia, lo mantendremos informado cuando completen tres viajes. Si tienes perguntas puedes contatar Alejandro @ 954-118-4711`,
    phoneNumber: promoter.phoneNumber
  }).catch(function(e){
    console.log("notifyPromoterOfConversion error", e)
  })
}

async function sendTest(firebase, data) {
  if(!data.userId){
    return {
      status: "Error",
      errorMessage: "Need User Id"
    }
  }
  let uid = data.userId
  let driver = (await firebase.database().ref(`/taxiDrivers/${uid}`).once('value')).val();
  if(driver.notificationInfo){     
    webpush.sendNotification(driver.notificationInfo, JSON.stringify({
      notificationType: "newOrder",
      message: "Eso es una prueba, gracias."
    })).catch((e) => {
      console.log("web push error ",uid)
    })
  }
}
