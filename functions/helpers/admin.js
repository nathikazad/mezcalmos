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

  if(params.fromAdmin) {
    let isAdmin = (await firebase.database().ref(`admins/${params.adminId}/authorized`).once('value')).val();
    isAdmin = isAdmin != null && isAdmin == true 
    if(!isAdmin) {
      return {
        status: "Error",
        errorMessage: "Only admins can run this operation"
      }
    }
  }
  
  userInfo = (await firebase.database().ref(`/users/${params.userId}/info`).once('value')).val();
  let chat = {}
  chat.createdTime = (new Date()).toUTCString()
  if(params.fromAdmin){
    chat.createdBy = "admin"
  } else {
    chat.createdBy = "user"
  }
  chat.userType = params.userType
  chat.userId = params.userId
  chat.userInfo = {
    displayName: userInfo.displayName,
    photo: userInfo.photo
  }
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
  let isAdmin = (await firebase.database().ref(`admins/${params.adminId}/authorized`).once('value')).val();
  isAdmin = isAdmin != null && isAdmin == true 
  if(!isAdmin) {
    return {
      status: "Error",
      errorMessage: "Only admins can run this operation"
    }
  }

  if(!params.userId || !params.userType){
    return {
      status: "Error",
      errorMessage: "Required userId and userType"
    }
  }

  let currentChat = (await firebase.database().ref(`/adminChat/${params.userType}/current/${params.userId}`).once('value')).val()
  if(!currentChat){
    return {
      status: "Error",
      errorMessage: "Chat does not exist for user."
    }
  }
  let currentChatId = Object.keys(currentChat)[0]
  currentChat[currentChatId].resolvedTime = (new Date()).toUTCString()
  currentChat[currentChatId].resolvedAdmin = params.adminId
  await firebase.database().ref(`/adminChat/${params.userType}/past/${params.userId}`).update(currentChat);
  await firebase.database().ref(`/adminChat/${params.userType}/current/${params.userId}`).remove()
}