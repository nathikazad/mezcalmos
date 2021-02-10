// urlB64ToUint8Array is a magic function that will encode the base64 public key
// to Array buffer which is needed by the subscription option
const urlB64ToUint8Array = (base64String) => {
  const padding = "=".repeat((4 - (base64String.length % 4)) % 4);
  const base64 = (base64String + padding)
    .replace(/\-/g, "+")
    .replace(/_/g, "/");
  const rawData = atob(base64);
  const outputArray = new Uint8Array(rawData.length);
  for (let i = 0; i < rawData.length; ++i) {
    outputArray[i] = rawData.charCodeAt(i);
  }
  return outputArray;
};
if (!self.define) {
  const e = (e) => {
      "require" !== e && (e += ".js");
      let s = Promise.resolve();
      return (
        r[e] ||
        (s = new Promise(async (s) => {
          if ("document" in self) {
            const r = document.createElement("script");
            (r.src = e), document.head.appendChild(r), (r.onload = s);
          } else importScripts(e), s();
        })),
        s.then(() => {
          if (!r[e]) throw new Error(`Module ${e} didn’t register its module`);
          return r[e];
        })
      );
    },
    s = (s, r) => {
      Promise.all(s.map(e)).then((e) => r(1 === e.length ? e[0] : e));
    },
    r = {
      require: Promise.resolve(s),
    };
  self.define = (s, i, a) => {
    r[s] ||
      (r[s] = Promise.resolve().then(() => {
        let r = {};
        const c = {
          uri: location.origin + s.slice(1),
        };
        return Promise.all(
          i.map((s) => {
            switch (s) {
              case "exports":
                return r;
              case "module":
                return c;
              default:
                return e(s);
            }
          })
        ).then((e) => {
          const s = a(...e);
          return r.default || (r.default = s), r;
        });
      }));
  };
}
define("./sw.js", ["./workbox-81b571e3"], function (e) {
  "use strict";
  self.addEventListener("message", (e) => {
      e.data && "SKIP_WAITING" === e.data.type && self.skipWaiting();
    }),
    e.precacheAndRoute(
      [{
          url: "customers/App.vue",
          revision: "f1f11361b020e8f9ef03d27f6962a4a5",
        },
        {
          url: "customers/main.js",
          revision: "f8fb641a32c52d93a2485b5c6077b77f",
        },
        {
          url: "customers/pages/NotFound.vue",
          revision: "f70bb924dbe2e1c1dd774a2b049da3c2",
        },
        {
          url: "customers/pages/orders/List.vue",
          revision: "e80660e89f1bfcf4aea54c708bceb8e5",
        },
        {
          url: "customers/pages/saved/locations.vue",
          revision: "02fc51b84158895ca77fde73f0075ef6",
        },
        {
          url: "customers/pages/services/groceries/AddItem.vue",
          revision: "9cc8fe343580abdacd691dfcd3521d5e",
        },
        {
          url: "customers/pages/services/groceries/Request.vue",
          revision: "c08789d11f50b7544cdc29d644f56ec7",
        },
        {
          url: "customers/pages/services/groceries/View.vue",
          revision: "6334636d27b3111aabad70cfce0c9a9f",
        },
        {
          url: "customers/pages/services/List.vue",
          revision: "47a9550445ee999703174d146f35f0a0",
        },
        {
          url: "customers/pages/services/taxis/Request.vue",
          revision: "d42bb918e6f8b80d21104f5b5208607b",
        },
        {
          url: "customers/pages/services/taxis/View.vue",
          revision: "8b55421879d352cddfb33f6966eb1a9c",
        },
        {
          url: "customers/registerServiceWorker.js",
          revision: "a32c6ed5be774684d0ff0bbfa70ff643",
        },
        {
          url: "customers/router.js",
          revision: "5d8150783b00a0b2b6be452590cf10ab",
        },
        {
          url: "customers/store/modules/groceries.js",
          revision: "309a5b23d36ccf068e69a4913edab6e6",
        },
        {
          url: "customers/store/modules/orders.js",
          revision: "96b1a92810c642c6b903f692a2ed7cf0",
        },
        {
          url: "customers/store/modules/savedLocations.js",
          revision: "bba54093203dc8079425729dc1b48149",
        },
        {
          url: "customers/store/modules/taxis.js",
          revision: "12fd7b0f7529256112e73ef593f0e58e",
        },
        {
          url: "customers/store/store.js",
          revision: "be9622c2f533efd24fea6598067cb41f",
        },
        {
          url: "deliveries/App.vue",
          revision: "724cf9305990720ed05f0d5ddbbd6a85",
        },
        {
          url: "deliveries/main.js",
          revision: "24477eaab6d479c3a55e31dee02b5f70",
        },
        {
          url: "deliveries/pages/NotFound.vue",
          revision: "f70bb924dbe2e1c1dd774a2b049da3c2",
        },
        {
          url: "deliveries/pages/orders/Incoming.vue",
          revision: "f76b3edd9da55c3a2496c6693c04cb3f",
        },
        {
          url: "deliveries/pages/orders/PastOrders.vue",
          revision: "6ef49b1bd9ecc9adf01f66f0a53135c5",
        },
        {
          url: "deliveries/pages/orders/View.vue",
          revision: "9c85e2101b34a6398193226a7d82fe56",
        },
        {
          url: "deliveries/router.js",
          revision: "12029e45587a19e1386fa22ec4bffe77",
        },
        {
          url: "deliveries/store/modules/driverAuth.js",
          revision: "8a53761a60c6961710c439515b8d36f0",
        },
        {
          url: "deliveries/store/modules/grocery.js",
          revision: "660016e23d1c0c0ae0e065d1dcd0317e",
        },
        {
          url: "deliveries/store/modules/incomingOrders.js",
          revision: "f3fb1005d04ca9d1cf52876f4ec61a4a",
        },
        {
          url: "deliveries/store/modules/pastOrders.js",
          revision: "50811d7775c402168a35e3927d5a4fc5",
        },
        {
          url: "deliveries/store/store.js",
          revision: "94f3f27f5a21008941d61f826937ba50",
        },
        {
          url: "shared/assets/scss/_base.scss",
          revision: "11cfb95eea7a83d743fbbb2b79571b60",
        },
        {
          url: "shared/assets/scss/_colors.scss",
          revision: "62813fad46a200c7f191fc92d4293bda",
        },
        {
          url: "shared/assets/scss/_mixins.scss",
          revision: "b0045d17788bf095e43f42acdac98493",
        },
        {
          url: "shared/assets/scss/_typography.scss",
          revision: "89e097c55877303f941aaaa1780bd875",
        },
        {
          url: "shared/assets/scss/_variables.scss",
          revision: "25aed3d95e141b28213c55b3734ab6a5",
        },
        {
          url: "shared/components/layouts/navDrawer.vue",
          revision: "d280a9f8379f5c3c96c652aeffb6641e",
        },
        {
          url: "shared/components/layouts/TheHeader.vue",
          revision: "bb1a535104a58f03b47e3ccef7bb6431",
        },
        {
          url: "shared/components/map/directionsRender.js",
          revision: "82ca625e7cb5b4bbd4e343befb27dc82",
        },
        {
          url: "shared/components/map/GetLocation.vue",
          revision: "15df4e259d6c9b99f981975fcd9760ba",
        },
        {
          url: "shared/components/map/mapView.vue",
          revision: "709bce98b0b1dca8470c83ffc364d76b",
        },
        {
          url: "shared/components/map/pickLocation.vue",
          revision: "2a0a054160ae99c8690db731ed9402f4",
        },
        {
          url: "shared/components/services/groceries/AddItem.vue",
          revision: "45d926afbf94926f9bef8384e3810814",
        },
        {
          url: "shared/components/SVG/groceries.vue",
          revision: "e27006eb76d3f81bec40828eef228106",
        },
        {
          url: "shared/components/SVG/logo.vue",
          revision: "beafd465e34531d1144a47dac82c9a60",
        },
        {
          url: "shared/components/SVG/menuBars.vue",
          revision: "61258558d4d15f0fd70199737645e162",
        },
        {
          url: "shared/components/SVG/taxi.vue",
          revision: "c0edcae14cbbbc1d4dbee6408548cae1",
        },
        {
          url: "shared/components/ui/avatar.vue",
          revision: "53ebbc24b21ff2c3930ccaf208e64463",
        },
        {
          url: "shared/components/ui/BaseButton.vue",
          revision: "252f724ce6985e0638b8957c3282cbfb",
        },
        {
          url: "shared/components/ui/card.vue",
          revision: "8aff8e83001098da4ac16c50a458f1b9",
        },
        {
          url: "shared/components/ui/fa.vue",
          revision: "a51f165190f897cd25208bb96980b8d1",
        },
        {
          url: "shared/components/ui/inputLocation.vue",
          revision: "d2031ed20860101248d167c116e343b8",
        },
        {
          url: "shared/components/ui/panel.vue",
          revision: "5ad3ad71acf914c3de9dba9adb8ae1a4",
        },
        {
          url: "shared/components/ui/popUp.vue",
          revision: "d67722a8540927c3de2af7433b3c6e3f",
        },
        {
          url: "shared/components/ui/switch.vue",
          revision: "7a606f258c73747537ce83933ec34939",
        },
        {
          url: "shared/config/apollo.js",
          revision: "244db5b53867239bcbaff3b37990410f",
        },
        {
          url: "shared/config/firebase.js",
          revision: "e19747e78163e646e232ebc6b5bca278",
        },
        {
          url: "shared/config/modules.js",
          revision: "33fe2541932ef8ac2e497e401ec8436b",
        },
        {
          url: "shared/mixins/functions.js",
          revision: "6415577e96bc800369fbe2f34145dc26",
        },
        {
          url: "shared/mixins/vuexFunctions.js",
          revision: "b5e209a607359e9bf9e871045b58f185",
        },
        {
          url: "shared/pages/messages/View.vue",
          revision: "720903875ae5a9641296ed541420e92a",
        },
        {
          url: "shared/pages/user/Information.vue",
          revision: "bfbeeac0928255d59ecb4530bf5202b6",
        },
        {
          url: "shared/pages/user/Login.vue",
          revision: "4f84d71c4cbb95ba5f08d9d5c048b7d7",
        },
        {
          url: "shared/static/img/Bttn.png",
          revision: "46cc51416e7e594b91a98f1c8c80771e",
        },
        {
          url: "shared/static/img/carIcon.png",
          revision: "359bfdceb75d0daeaa898d657e68f72c",
        },
        {
          url: "shared/static/img/fromIcon.png",
          revision: "aeea7f65953749df3dba02aed6057a97",
        },
        {
          url: "shared/static/img/Map.png",
          revision: "0738359d4eadd25b686d3e81286a0781",
        },
        {
          url: "shared/static/img/toIcon.png",
          revision: "252a871fb8f9dc00c53c585bf8cb4b36",
        },
        {
          url: "shared/static/img/userDefault.png",
          revision: "eb1970a4d7f5edd7d74b60d1896dd452",
        },
        {
          url: "shared/static/service-worker.js",
          revision: "cde809eb262b47f6f2a8c0f9780f0274",
        },
        {
          url: "shared/store/auth.js",
          revision: "a39c2e9526e806f3354b0558b499cc3f",
        },
        {
          url: "shared/store/messages.js",
          revision: "ae91e7e485b54c0045aab80b06de1007",
        },
        {
          url: "taxis/App.vue",
          revision: "f1f11361b020e8f9ef03d27f6962a4a5",
        },
        {
          url: "taxis/main.js",
          revision: "8e65a2a970638c7e0c238fbfacd3f75d",
        },
        {
          url: "taxis/pages/NotFound.vue",
          revision: "f70bb924dbe2e1c1dd774a2b049da3c2",
        },
        {
          url: "taxis/pages/orders/Incoming.vue",
          revision: "a2fa899d6345a1945d9083cff65a824b",
        },
        {
          url: "taxis/pages/orders/PastOrders.vue",
          revision: "c832fca2b2783c883cc3294cf292bd8b",
        },
        {
          url: "taxis/pages/orders/View.vue",
          revision: "309003d13543fff2117ff36cbd065d70",
        },
        {
          url: "taxis/router.js",
          revision: "68e006acba145a73260c094199233904",
        },
        {
          url: "taxis/store/modules/incomingOrders.js",
          revision: "33968b38f8b6f1d25f43b0794805323c",
        },
        {
          url: "taxis/store/modules/order.js",
          revision: "fc634e7afc62314ac71835ce935e6e3e",
        },
        {
          url: "taxis/store/modules/pastOrders.js",
          revision: "86d5ac3cfc093f302a4ce1430a1bf77a",
        },
        {
          url: "taxis/store/modules/taxiAuth.js",
          revision: "48c609413c614ef4a377977ab23272a4",
        },
        {
          url: "taxis/store/store.js",
          revision: "43fcb75ae56676a0bdb2b40435e9f5f4",
        },
      ], {}
    );
  var CACHE_NAME = "mycache_v1";
  self.addEventListener("fetch", function (event) {
    event.respondWith(
      caches.open(CACHE_NAME).then(function (cache) {
        return cache.match(event.request).then(function (response) {
          return (
            response ||
            fetch(event.request).then(function (response) {
              cache.put(event.request, response.clone());
              return response;
            })
          );
        });
      })
    );
  });
});
//# sourceMappingURL=sw.js.map
self.addEventListener("push", (event) => {
  if (event.data) {
    let message = JSON.parse(event.data.text())
    console.log(message);
    const title = message.notificationType == 'newMessage' ? message.sender.name : message.orderType;
    const body = message.message || message.status;
    const icon = "img/icons/ms-icon-150x150.png";
    const tag = "simple push notif";
    self.registration.showNotification(title, {
      body: body,
      icon: icon,
      tag: tag,
      requireInteraction: true,
      timestamp: message.time,
      actions: [{
        action: 'reply',
        title: '⤻ Reply'
      }],

      data: {
        messageId: message.messageId,
        orderId: message.orderId,
        orderType: message.orderType,
        type: message.notificationType
      }
    });
  } else {
    console.log('has no data');

  }




});
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
self.addEventListener("activate", (event) => {
  // This will be called only once when the service worker is activated.
  self.clients.claim()

  // From service-worker.js:
  const channel = new BroadcastChannel('sw-taxi-messages');
  channel.addEventListener("message", async event => {
    if (event.data.msg == 'getSubscription') {
      try {
        //init subscription
        const applicationServerKey = urlB64ToUint8Array(
          "BGnr9cpGF42t09PccsyzeJADS1UPmZ4I_QiSY4mmPMTYcsgn5m2BrkPFR4r6gs3KEzMGOXwukjBwhWQ26_ikpMw"
        );
        const options = {
          applicationServerKey,
          userVisibleOnly: true
        };
        const subscription = await self.registration.pushManager.subscribe(options);
        //send subscription to user side subscription
        channel.postMessage({
          subscription: JSON.stringify(subscription)
        });
      } catch (err) {
        console.log("Error", err);
      }
    }
  });





});