importScripts('/sw/service-worker.js')
//cachingSetup(self, 'customer');
pushEventListener(self);
activateEventListener(self, 'customer');
self.addEventListener('notificationclick', function (event) {
    var data = event.notification.data;
    if (data) {
        if (data.type == 'newMessage') {
            clients.openWindow("/messages/" + data.orderId);
        } else {
            clients.openWindow("/services/" + data.orderType + '/' + data.orderId);
        }
    }
    event.notification.close();
}, false);