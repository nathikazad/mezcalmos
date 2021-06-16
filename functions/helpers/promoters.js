module.exports = {
  checkCustomerIncentives,
  checkDriverIncentives
}
const notification = require("./notification");

function checkCustomerIncentives(firebase, customer, driver){
  console.log(1)
  firebase.database().ref(`/users/${customer.id}/invite`).once('value', function(snapshot) {
    console.log(2)
    let invite = snapshot.val()
    if(invite && invite.code && invite.code != "null") {
      console.log(3)
      invite.code = invite.code.toLowerCase()
      if(invite.ordersCount == null) {
        console.log(4)
        firebase.database().ref(`/users/${customer.id}/invite/ordersCount`).set(1)
        firebase.database().ref(`/users/${customer.id}/invite/drivers`).push(driver)
      }
      else if(invite.ordersCount < 3) {
        console.log(5)
        invite.ordersCount = parseInt(invite.ordersCount) + 1
        firebase.database().ref(`/users/${customer.id}/invite/drivers`).push(driver)
        firebase.database().ref(`/users/${customer.id}/invite/ordersCount`).set(invite.ordersCount)
        if (invite.ordersCount == 3) {
          console.log(6)
          firebase.database().ref(`/promoters/${invite.code}`).once('value', function(snapshot) {
            let promoter = snapshot.val()
            console.log(7, promoter)
            if(!promoter)
              promoter = {}
            if(!promoter.totalCustomerInvites)
              promoter.totalCustomerInvites = 0
            if(!promoter.totalCustomerConversions)
              promoter.totalCustomerConversions = 0
            if(!promoter.totalPesosEarned)
              promoter.totalPesosEarned = 0
            if(!promoter["customers"]) {
              promoter["customers"] = {}
            }
            if(!promoter["customers"][customer.id]) {
              promoter["customers"][customer.id] = {invited: true}
              promoter.totalCustomerInvites = parseInt(promoter.totalCustomerInvites) + 1
            }
            promoter["customers"][customer.id].converted = true;
            promoter["customers"][customer.id].drivers = {...invite.drivers, "last":driver};
            promoter.totalCustomerConversions = parseInt(promoter.totalCustomerConversions) + 1
            promoter.totalPesosEarned = parseInt(promoter.totalPesosEarned) + 50
            console.log(8, promoter)
            firebase.database().ref(`/promoters/${invite.code}`).update(promoter)
            if(promoter.phoneNumber && promoter.name && customer.name) {
              console.log(9, promoter)
              notification.notifyPromoterOfConversion(customer.name, promoter);
            }
          })
        }
      }
    }
  });
}

function checkDriverIncentives(firebase, customer, driver){
}