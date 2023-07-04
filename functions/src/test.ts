

import { initEnv } from "../../supervisor/src/init"
import { checkout } from "./restaurant/checkoutCart";
import { DeliveryType, PaymentType } from "./shared/models/Generic/Order";
import { CustomerAppType } from "./shared/models/Generic/Generic";

initEnv();
checkout(884, {
  tripDistance: 1104,
  deliveryType: DeliveryType.Delivery,
  scheduledTime: '2023-03-30 20:00:00.000Z',
  discountValue: undefined,
  tax: undefined,
  tripDuration: 270,
  tripPolyline: 'wwz_BlxpoQYdAoAYd@cBk@MwA[w@QoBe@OKEOBW@O~@cCbCaGhDeJd@wBHWkAc@lBaH',
  restaurantId: 60,
  paymentType: PaymentType.Cash,
  notes: '',
  stripeFees: 0,
  deliveryCost: 40,
  customerAppType: CustomerAppType.Native,
  customerLocation: {
    lat: 15.870365967421352,
    lng: -97.07725323736668,
    address: 'Agua Marina 203, Agua Marina, 71984 Puerto Escondido, Oax., Mexico'
  },
  stripePaymentId: undefined
}).then((resp) => {
  console.log(resp);
  console.log("done")
});