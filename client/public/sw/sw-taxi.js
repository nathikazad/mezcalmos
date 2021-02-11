importScripts('./service-worker.js')

cachingSetup(self, 'taxi');
pushEventListener(self);
activateEventListener(self, 'taxi');
self.addEventListener('notificationclick', function (event) {
    var data = event.notification.data;
    event.notification.close();
    if (data) {
        if (data.type == 'newMessage') {
            clients.openWindow("/messages/" + data.orderId);
        } else {
            clients.openWindow("/orders/" + data.orderId);
        }
    }
}, false);