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
const cachingSetup = function (self, swName) {
    if (!self.define) {
        const e = e => {
                "require" !== e && (e += ".js");
                let i = Promise.resolve();
                return n[e] || (i = new Promise((async i => {
                    if ("document" in self) {
                        const n = document.createElement("script");
                        n.src = e, document.head.appendChild(n), n.onload = i
                    } else importScripts(e), i()
                }))), i.then((() => {
                    if (!n[e]) throw new Error(`Module ${e} didn’t register its module`);
                    return n[e]
                }))
            },
            i = (i, n) => {
                Promise.all(i.map(e)).then((e => n(1 === e.length ? e[0] : e)))
            },
            n = {
                require: Promise.resolve(i)
            };
        self.define = (i, o, c) => {
            n[i] || (n[i] = Promise.resolve().then((() => {
                let n = {};
                const s = {
                    uri: location.origin + i.slice(1)
                };
                return Promise.all(o.map((i => {
                    switch (i) {
                        case "exports":
                            return n;
                        case "module":
                            return s;
                        default:
                            return e(i)
                    }
                }))).then((e => {
                    const i = c(...e);
                    return n.default || (n.default = i), n
                }))
            })))
        }
    }
    define(`./sw-${swName}.js`, ["./workbox-81b571e3"], (function (e) {
        "use strict";
        self.addEventListener("message", (e => {
            e.data && "SKIP_WAITING" === e.data.type && self.skipWaiting()
        })), e.precacheAndRoute([{
            url: "fonts/font.css",
            revision: "c151bd53b6f7bcb1d651b25d15385eea"
        }, {
            url: "fonts/fontAwsome/fontawesome-pro/css/fontawesome.min.css",
            revision: "2ee77b35ce5d96147c978906e1f9eede"
        }, {
            url: "fonts/fontAwsome/fontawesome-pro/css/light.min.css",
            revision: "16d50fc65d23d45f34e062d05d6f955f"
        }, {
            url: "fonts/fontAwsome/fontawesome-pro/webfonts/fa-light-300.ttf",
            revision: "f07e8d97502c9760fd15805700ea2e87"
        }, {
            url: "fonts/Product Sans Bold Italic.ttf",
            revision: "79750b1d82b2558801373d62dd7e5280"
        }, {
            url: "fonts/Product Sans Bold.ttf",
            revision: "dba0c688b8d5ee09a1e214aebd5d25e4"
        }, {
            url: "fonts/Product Sans Italic.ttf",
            revision: "e88ec18827526928e71407a24937825a"
        }, {
            url: "fonts/Product Sans Regular.ttf",
            revision: "eae9c18cee82a8a1a52e654911f8fe83"
        }, {
            url: "img/icons/android-icon-144x144.png",
            revision: "8ea9ece7933564ca74650723d03ea7b9"
        }, {
            url: "img/icons/android-icon-192x192.png",
            revision: "cd7b305a3d23dd051e437f814507e1f5"
        }, {
            url: "img/icons/android-icon-36x36.png",
            revision: "2e2979d472351ebf460d8137ea62ecb6"
        }, {
            url: "img/icons/android-icon-48x48.png",
            revision: "0bded06d1a7fc843d1fe42e2f4cd8049"
        }, {
            url: "img/icons/android-icon-72x72.png",
            revision: "ad104d50d15b53958e48796483051aa0"
        }, {
            url: "img/icons/android-icon-96x96.png",
            revision: "e84588f431e263149a82b6def5225de8"
        }, {
            url: "img/icons/apple-icon-114x114.png",
            revision: "1eec8500bcdc48d25f365cf24b29fddc"
        }, {
            url: "img/icons/apple-icon-120x120.png",
            revision: "786bd40ea2195457d325733d6f7c2d66"
        }, {
            url: "img/icons/apple-icon-144x144.png",
            revision: "8ea9ece7933564ca74650723d03ea7b9"
        }, {
            url: "img/icons/apple-icon-152x152.png",
            revision: "f27f2981a46b1cc94b2b1e897f73924f"
        }, {
            url: "img/icons/apple-icon-180x180.png",
            revision: "b5e603b7f4913467feba903971023bbd"
        }, {
            url: "img/icons/apple-icon-57x57.png",
            revision: "aa8ed0b5c5e54dc43f9ad4ddff8da7ad"
        }, {
            url: "img/icons/apple-icon-60x60.png",
            revision: "8f182f21eebe0a3c57aa6b8e7cd1b408"
        }, {
            url: "img/icons/apple-icon-72x72.png",
            revision: "ad104d50d15b53958e48796483051aa0"
        }, {
            url: "img/icons/apple-icon-76x76.png",
            revision: "3285c8e31aaa15766fda328f81ec9f28"
        }, {
            url: "img/icons/apple-icon-precomposed.png",
            revision: "edaf330b5bcf79498f19d26c67f7c287"
        }, {
            url: "img/icons/apple-icon.png",
            revision: "edaf330b5bcf79498f19d26c67f7c287"
        }, {
            url: "img/icons/favicon-16x16.png",
            revision: "528ee54de74747055ac6448ea26c9866"
        }, {
            url: "img/icons/favicon-32x32.png",
            revision: "6b46a9ce5fccb6791c2d5e9a9ccaf45d"
        }, {
            url: "img/icons/favicon-96x96.png",
            revision: "e84588f431e263149a82b6def5225de8"
        }, {
            url: "img/icons/favicon.ico",
            revision: "694b0788af6b4a4c10741bac445cfcc8"
        }, {
            url: "img/icons/ms-icon-144x144.png",
            revision: "8ea9ece7933564ca74650723d03ea7b9"
        }, {
            url: "img/icons/ms-icon-150x150.png",
            revision: "767ed25b85f4cff6dd8c5f150043223d"
        }, {
            url: "img/icons/ms-icon-310x310.png",
            revision: "57f55d8c211ab03a053867751cc1a9d7"
        }, {
            url: "img/icons/ms-icon-70x70.png",
            revision: "4bf0c9789e8739c230bd63fd695e4b05"
        }, {
            url: "img/icons/msapplication-icon-144x144.png",
            revision: "b89032a4a5a1879f30ba05a13947f26f"
        }, {
            url: "index.html",
            revision: "6c22b9dd5ea279ef50dc369ec65f4463"
        }], {})
    }));
    //# sourceMappingURL=sw-customer.js.map
}
const pushEventListener = function (self) {
    self.addEventListener("push", (event) => {
        if (event.data) {
            let message = JSON.parse(event.data.text())
            //console.log(message);
            const title = message.notificationType == 'newMessage' ? message.sender.name : message.orderType;
            const body = message.message || message.status;
            const icon = "../img/icons/ms-icon-150x150.png";
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
            //console.log('has no data');

        }
    });
}
const activateEventListener = function (self, swName) {
    self.addEventListener("activate", (event) => {
        //console.log(self);

        // This will be called only once when the service worker is activated.
        self.clients.claim()
        // From service-worker.js:
        const channel = new BroadcastChannel(`sw-${swName}-messages`);
        channel.addEventListener("message", async event => {
            //console.log('service worker ', event);

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
                    //console.log("Error", err);
                }
            }
        });
    });
}