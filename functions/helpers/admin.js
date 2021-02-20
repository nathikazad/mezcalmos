module.exports = {
  createChat,
  resolve
}


async function createChat(firebase, params) {
  if(!params.userId || !params.userType){
    return {
      status: "Error",
      errorMessage: "Required userId and userType"
    }
  }

  let currentChat = (await firebase.database().ref(`/adminChat/current/${params.userId}`).once()).val()
  if(currentChat){
    return {
      status: "Error",
      errorMessage: "Cannot be in two admin chats at the same time"
    }
  }
  
  let chat = {}
  chat.time = (new Date()).toUTCString()
  chat.orderId = params.orderId
  chat.userType = params.userType
  chat.userId = params.userId
  chat.parentChatId = params.parentChatId
  let chatRef = await firebase.database().ref(`/adminChat/current/${chat.userId}`).push(chat);

  if(params.parentChatId) {
    await firebase.database().ref(`/adminChat/current/${params.parentChatId}/followupChats/${chatRef.key}`).set(chat.userId)
  }
  return {
    status: "Success",
    orderId: chatRef.key
  }
}

async function resolve(firebase, params) {
  if(!params.userId){
    return {
      status: "Error",
      errorMessage: "Required userId"
    }
  }

  let currentChat = (await firebase.database().ref(`/adminChat/current/${params.userId}`).once()).val()
  if(!currentChat){
    return {
      status: "Error",
      errorMessage: "Chat does not exist for user."
    }
  }
  await firebase.database().ref(`/adminChat/current/${params.userId}`).delete()
  await firebase.database().ref(`/adminChat/past/${params.userId}`).update(currentChat);
}