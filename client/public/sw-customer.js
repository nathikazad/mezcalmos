importScripts('/sw/service-worker.js')
//cachingSetup(self, 'customer');
pushEventListener(self);
activateEventListener(self, 'customer');
self.addEventListener('notificationclick', function (event) {
    var data = event.notification.data;
    if (data) {
        console.log(data);

        if (data.type == 'newMessage') {
            clients.openWindow("/messages/" + data.orderId);
        } else if (data.type == 'newAdminMessage') {
            clients.openWindow("/contactAdmin");

        } else if (data.type == 'orderStatusChange') {
            clients.openWindow("/services/" + data.orderType + '/' + data.orderId);
        }
    }
    event.notification.close();
}, false);