import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Notification";

export const deliveryNewOrderMessage: BackgroundNotification =
{
  [Language.EN]: {
    title: "Looking for a ride",
    body: "We are finding you a taxi."
  },
  [Language.ES]: {
    title: "Buscando para una taxi",
    body: "Estamos buscandote un taxi"
  }
}


