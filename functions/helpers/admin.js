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

  let currentChat = (await firebase.database().ref(`/adminChat/${params.userType}/current/${params.userId}`).once()).val()
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
  chat.linkedChat = params.linkedChat
  let chatRef = await firebase.database().ref(`/adminChat/${params.userType}/current/${chat.userId}`).push(chat);

  if(params.linkedChat) {
    await firebase.database().ref(`/adminChat/${params.linkedChat.userType}/current/${params.linkedChat.chatId}/linkedChat`).set({userId:chat.userId, userType:chat.userType})
  }
  return {
    status: "Success",
    orderId: chatRef.key
  }
}

async function resolve(firebase, params) {
  if(!params.userId || !params.userType){
    return {
      status: "Error",
      errorMessage: "Required userId and userType"
    }
  }

  let currentChat = (await firebase.database().ref(`/adminChat/${params.userType}/current/${params.userId}`).once()).val()
  if(!currentChat){
    return {
      status: "Error",
      errorMessage: "Chat does not exist for user."
    }
  }
  await firebase.database().ref(`/adminChat/${params.userType}/current/${params.userId}`).delete()
  await firebase.database().ref(`/adminChat/${params.userType}/past/${params.userId}`).update(currentChat);
}