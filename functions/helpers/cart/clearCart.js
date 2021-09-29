
module.exports = (firebase, uid, data, hasura) => { return func(firebase, uid, data, hasura) }

async function func(firebase, uid, data, hasura) {

  let cart = (await firebase.database().ref(`/users/${uid}/cart`).once('value')).val();
  if (cart == null) {
    return {
      status: "Error",
      errorMessage: `Cart does not exist`,
      errorCode: 1002
    }
  }

  await firebase.database().ref(`/users/${uid}/cart`).remove();

  let response = { status: "Success" }
  return response
}