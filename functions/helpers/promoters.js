module.exports = {
  checkCustomerIncentives,
  checkDriverIncentives
}
const notification = require("./notification");

function checkCustomerIncentives(firebase, customer, driver){
  firebase.database().ref(`/users/${customer.id}/invite`).once('value', function(snapshot) {
    let invite = snapshot.val()
    if(invite && invite.code && invite.code != "null") {
      invite.code = invite.code.toLowerCase()
      if(invite.ordersCount == null) {
        firebase.database().ref(`/users/${customer.id}/invite/ordersCount`).set(1)
        firebase.database().ref(`/users/${customer.id}/invite/drivers`).push(driver)
      }
      else if(invite.ordersCount < 3) {
        invite.ordersCount = parseInt(invite.ordersCount) + 1
        firebase.database().ref(`/users/${customer.id}/invite/drivers`).push(driver)
        firebase.database().ref(`/users/${customer.id}/invite/ordersCount`).set(invite.ordersCount)
        if (invite.ordersCount == 3) {
          firebase.database().ref(`/promoters/${invite.code}`).transaction(function (promoter) {
            if (promoter != null) {
              promoter = checkPromoter(promoter)
              if(!promoter["customers"][customer.id]) {
                promoter["customers"][customer.id] = {invited: true}
                promoter.totalCustomerInvites = parseInt(promoter.totalCustomerInvites) + 1
              }
              promoter["customers"][customer.id].converted = true;
              promoter["customers"][customer.id].drivers = {...invite.drivers, "last":driver};
              promoter.totalCustomerConversions = parseInt(promoter.totalCustomerConversions) + 1
              promoter.totalPesosEarned = parseInt(promoter.totalPesosEarned) + 50
              promoter.balance = parseInt(promoter.balance) + 50
            }
            return promoter
          }).then(function(response) {
            if (response.committed) {
              let promoter = response.snapshot.val() 
              if(promoter.phoneNumber && promoter.name && customer.name) {
                notification.notifyPromoterOfCustomerConversion(customer.name, promoter);
              }
            }
          })
        }
      }
    }
  });
}

function checkDriverIncentives(firebase, customer, driver){
  firebase.database().ref(`/taxiDrivers/${driver.id}/invite`).once('value', function(snapshot) {
    let invite = snapshot.val()
    if(invite && invite.code && invite.code != "null") {
      invite.code = invite.code.toLowerCase()
      if(invite.ordersCount == null) {
        firebase.database().ref(`/taxiDrivers/${driver.id}/invite/ordersCount`).set(1)
        firebase.database().ref(`/taxiDrivers/${driver.id}/invite/customers`).push(customer)
      }
      else if(invite.ordersCount < 6) {
        invite.ordersCount = parseInt(invite.ordersCount) + 1
        firebase.database().ref(`/taxiDrivers/${driver.id}/invite/customers`).push(customer)
        firebase.database().ref(`/taxiDrivers/${driver.id}/invite/ordersCount`).set(invite.ordersCount)
        if (invite.ordersCount == 6) {
          firebase.database().ref(`/promoters/${invite.code}`).transaction(function (promoter) {
            if (promoter != null) {
              promoter = checkPromoter(promoter)
              if(!promoter["drivers"][driver.id]) {
                promoter["drivers"][driver.id] = {invited: true}
                promoter.totalDriverInvites = parseInt(promoter.totalDriverInvites) + 1
              }
              promoter["drivers"][driver.id].converted = true;
              promoter["drivers"][driver.id].customers = {...invite.customers, "last":customer};
              promoter.totalDriverConversions = parseInt(promoter.totalDriverConversions) + 1
              promoter.totalPesosEarned = parseInt(promoter.totalPesosEarned) + 200
              promoter.balance = parseInt(promoter.balance) + 200 
            }
            return promoter;
          }).then(function(response) {
            if (response.committed) {
              let promoter = response.snapshot.val()
              if(promoter.phoneNumber && promoter.name && driver.name) {
                notification.notifyPromoterOfDriverConversion(driver.name, promoter);
              }
            } 
          })
        }
      }
    }
  });
}


function checkPromoter(promoter) {
  if(!promoter)
    promoter = {}
  if(!promoter.totalCustomerInvites)
    promoter.totalCustomerInvites = 0
  if(!promoter.totalCustomerConversions)
    promoter.totalCustomerConversions = 0
  if(!promoter.totalDriverInvites)
    promoter.totalDriverInvites = 0
  if(!promoter.totalDriverConversions)
    promoter.totalDriverConversions = 0
  if(!promoter.totalPesosEarned)
    promoter.totalPesosEarned = 0
  if(!promoter.balance)
    promoter.balance = 0
  if(!promoter["customers"]) {
    promoter["customers"] = {}
  }
  if(!promoter["drivers"]) {
    promoter["drivers"] = {}
  }
  return promoter
}