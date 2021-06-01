importScripts('/sw/service-worker.js')
console.log("inside sw-taxi")
//cachingSetup(self, 'taxi');
pushEventListener(self);
createBroadcastChannel(self, 'taxi');
self.addEventListener('notificationclick', function (e) {
    
    var data = e.notification.data;
    if(data) {
      let url;
      if (data.type == 'newMessage') {
          url = "/messages/" + data.orderId;
      } else if (data.type == 'newAdminMessage') {
          url = "/contactAdmin";
      } else if (data.type == 'orderStatusChange') {
          url = "/orders/" + data.orderId;
      } else if (data.type == 'newOrder') {
          url = "/incoming";
      }
      e.notification.close();
      // Get all the Window clients
      e.waitUntil(clients.matchAll({ type: 'window' }).then(clientsArr => {
      // If a Window tab matching the targeted URL already exists, focus that;
        if(clientsArr.length > 0) {
            clientsArr[0].focus()
            if(clientsArr[0].url != url){
              clientsArr[0].navigate(url)
            }
        } else {
            clients.openWindow(url).then(windowClient => windowClient ? windowClient.focus() : null);
        }
      }));
    }
}, false);