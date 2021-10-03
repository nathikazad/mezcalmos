
const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");


module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return notSignedInMessage
  }
  let response = await addItem(context.auth.uid, data)
  return response
});

async function addItem(uid, data) {
  console.log(data.options.chooseOne);
  if (!data.itemId || !data.restaurantId) {
    return {
      status: "Error",
      errorMessage: "Required itemId and restaurantId",
      errorCode: 1001
    }
  }
  if (!data.options) {
    data.options = {}
  }
  if (!data.options.chooseOne)
    data.options.chooseOne = {}
  if (!data.options.chooseMany)
    data.options.chooseMany = {}
  // if (!data.options.sides)
  //   data.options.sides = {}
  if (!data.quantity) {
    data.quantity = 1
  }
  let cart = (await firebase.database().ref(`/users/${uid}/cart`).once('value')).val();
  if (cart == null) {
    cart = {
      orderType: "restaurant",
      serviceProviderId: data.restaurantId,
      total: 0,
      items: {}
    }
  } else {
    if (cart.orderType != "restaurant" || cart.serviceProviderId != data.restaurantId) {
      return {
        status: "Error",
        errorMessage: `Cart already has items from ${cart.orderType} ${cart.serviceProviderId}`,
        errorCode: 1002
      }
    }
  }

  let item = (await firebase.database().
    ref(`/restaurants/info/${data.restaurantId}/menu/${data.itemId}`).once('value')).val();

  if (item == null) {
    return {
      status: "Error",
      errorMessage: "Invalid itemId",
      errorCode: 1003
    }
  }

  if (item.available == false) {
    return {
      status: "Error",
      errorMessage: "Item not available",
      errorCode: 1003
    }
  }

  let newItem = {
    name: item.name,
    image: item.image,
    costPerOne: parseFloat(item.cost),
    quantity: data.quantity,
    totalCost: 0,
    options: {
      chooseOne: {},
      chooseMany: {},
      // sides: {}
    }
  }


  for (optionId in item.options.chooseOne) {
    let option = item.options.chooseOne[optionId]
    let selectedOption = data.options.chooseOne[optionId]
    if (!selectedOption) {
      return {
        status: "Error",
        errorMessage: `Choose one option ${optionId} not set`,
        errorCode: 1004
      }
    }


    if (!Object.keys(option.options).includes(selectedOption)) {
      return {
        status: "Error",
        errorMessage: `Choose one option ${optionId} cannot be ${selectedOption}`,
        errorCode: 1005
      }
    }
    newItem.options.chooseOne[optionId] = {
      name: option.name,
      selectedOption: option.options[selectedOption],
      selectedOptionId: selectedOption,
      cost: option.options[selectedOption].cost
    }
    if (option.options[selectedOption].cost) {
      newItem.costPerOne += parseFloat(option.options[selectedOption].cost)
    }
  }

  for (optionId in item.options.chooseMany) {
    let option = item.options.chooseMany[optionId]
    let selectedOption = data.options.chooseMany[optionId]
    if (!selectedOption) {
      continue
    }

    newItem.options.chooseMany[optionId] = {
      name: option.name,
      cost: option.cost
    }
    if (option.cost) {
      newItem.costPerOne += parseFloat(option.cost)
    }
  }


  // for (optionId in item.options.sides) {
  //   let option = item.options.sides[optionId]
  //   let selectedOption = data.options.sides[optionId]
  //   if (!selectedOption) {
  //     continue
  //   }

  //   newItem.options.sides[optionId] = {
  //     optionName: option.name,
  //     cost: option.cost
  //   }
  //   if (option.cost) {
  //     newItem.costPerOne += parseFloat(option.cost)
  //   }
  // }
  newItem.totalCost = newItem.costPerOne * parseInt(newItem.quantity)
  let itemRef = await firebase.database().ref(`/users/${uid}/cart/items`).push(null)

  cart.total = parseFloat(cart.total) + parseFloat(newItem.totalCost)

  cart.items[itemRef.key] = newItem
  console.log(cart.items[itemRef.key].options.chooseOne.meat);
  // const util = require('util')
  // console.log(util.inspect(newItem, false, null, true /* enable colors */))
  // // console.log(newItem.)
  // // console.log(item)
  await firebase.database().ref(`/users/${uid}/cart`).update(cart);

  let response = { status: "Success" }
  return response
}