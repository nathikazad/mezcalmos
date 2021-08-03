const notification = require("../notification");
const hasura = require("../hasura")

module.exports = ( firebase, uid, data ) => { return request(firebase, uid, data) }

async function request(firebase, uid, data) {
    // 
    let taxiDrivers = (await firebase.database().ref('/taxiDrivers').once('value')).val()
     for(let id in taxiDrivers ){
   
        await hasura.updateUser({
            uid: id,
            changes:{
              taxiNumber: taxiDrivers[id].taxiNumber
            } 
        })
    }
    
     // TODO: prevent user from sending another request before this finishes
     // let customerCurrentOrder = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();
   
     // if (customerCurrentOrder != null) {
     //   return {
     //     status: "Error",
     //     errorMessage: "Customer is already in another taxi"
     //   }
     // }
     if (!data.from || !data.to || !data.distance || !data.duration 
       || !data.estimatedPrice || !data.paymentType) {
       return {
         status: "Error",
         errorMessage: "Required from, to, distance, duration, estimatedPrice and paymentType"
       }
     }
   
     response = await firebase.database().ref(`users/${uid}/lock`).transaction(function(lock){
       if(lock == true){
         return
       } else{
         return true
       }
     })
   
     if(!response.committed){
       return{
         status: 'Error',
         errorMessage: 'can not request in the middle of another request'
       }
     }
   
     let customerCurrentOrder = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();
   
     if (customerCurrentOrder) {
       firebase.database().ref(`users/${uid}/lock`).remove()
       return {
         status: "Error",
         errorMessage: "Customer is already in another taxi"
       }
     }
   
     try{
       notification.notifyDriversNewRequest(firebase, data.from.address.split(',')[0]);
       //notification.notifyDriversNewRequest(firebase, data.from.split(',')[0]);
     }catch(e){
       console.log(e);
     }
   
    
     let user = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();
     
       let payload = {
         from: data.from,
         to: data.to,
         distance: data.distance,
         duration: data.duration,
         estimatedPrice: data.estimatedPrice,
         customer: {
           id: uid,
           name: user.displayName.split(' ')[0],
           image: user.photo
         },
         orderType: "taxi",
         status: "lookingForTaxi",
         orderTime: (new Date()).toUTCString(),
         paymentType: data.paymentType,
         routeInformation: {
           duration: data.duration,
           distance: data.distance,
         }
       }
       let orderRef = await firebase.database().ref(`/orders/taxi`).push(payload);
       firebase.database().ref(`/users/${uid}/orders/${orderRef.key}`).set(payload);
       firebase.database().ref(`/openOrders/taxi/${orderRef.key}`).set(payload);
       firebase.database().ref(`/users/${uid}/state/currentOrder`).set(orderRef.key);
       let chat = {
         participants: {},
         chatType: "order",
         orderType: "taxi"
       }
       chat.participants[uid] = {
         name: user.displayName.split(' ')[0],
         image: user.photo,
         particpantType: "customer",
         phoneNumber: (user.phoneNumber) ? user.phoneNumber : null
       }
       firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
       firebase.database().ref(`users/${uid}/lock`).remove()
   
       // insert order
       
         let req = await hasura.insertOrder({
           order:{
             orderId: orderRef.key,
             customerId: uid,
             orderTime: payload.orderTime,
             finalStatus: payload.status
           }
         })
       
       return{
         status: "Success",
         orderId: orderRef.key
        }
}