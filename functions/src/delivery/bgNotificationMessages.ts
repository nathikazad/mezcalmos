import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Notification";

export const deliveryNewOrderMessage: BackgroundNotification =
{
  [Language.EN]: {
    title: "New Order",
    body: "You have been assigned a new order."
  },
  [Language.ES]: {
    title: "Nueva Orden",
    body: "Tienes una nueva orden"
  }
}


