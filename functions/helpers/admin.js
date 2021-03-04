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

  let currentChat = (await firebase.database().ref(`/adminChat/${params.userType}/current/${params.userId}`).once('value')).val()
  if(currentChat){
    return {
      status: "Error",
      errorMessage: "Cannot be in two admin chats at the same time"
    }
  }
  
  let chat = {}
  chat.time = (new Date()).toUTCString()
  chat.userType = params.userType
  chat.userId = params.userId
  chat.orderId = (!!params.orderId) ? params.orderId : null;
  chat.linkedChat = (!!params.linkedChat) ? params.linkedChat : null;

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
  // check if admin

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