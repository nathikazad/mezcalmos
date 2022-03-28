import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Notification";
import { LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";

export const LaundryOrderStatusChangeMessages:
  { [id in LaundryOrderStatus]: BackgroundNotification } = {
  [LaundryOrderStatus.OrderReceieved]: {
    [Language.EN]: {
      title: "Your order has been received",
      body: "Laundry has recieved your order and a delivery driver will be sent shortly."
    },
    [Language.ES]: {
      title: "Se está preparando tu pedido",
      body: "La lavandería ha recibido su pedido y en breve se enviará un conductor de entrega."
    }
  },
  [LaundryOrderStatus.OtwPickup]: {
    [Language.EN]: {
      title: "A driver is on the way",
      body: "A driver is on the way to pick up your laundry."
    },
    [Language.ES]: {
      title: "Un conductor está en camino",
      body: "Un conductor está en camino para recoger tu ropa."
    }
  },
  [LaundryOrderStatus.PickedUp]: {
    [Language.EN]: {
      title: "Your laundry has been picked up",
      body: "Your laundry is on the way to the facility."
    },
    [Language.ES]: {
      title: "Tu ropa ha sido recogida",
      body: "Tu ropa está en camino a la instalación."
    }
  },
  [LaundryOrderStatus.AtLaundry]: {
    [Language.EN]: {
      title: "Your clothes are at laundry site",
      body: "Your laundry has been received and will be washed shortly."
    },
    [Language.ES]: {
      title: "Tu ropa está en el sitio de lavandería.",
      body: "Tu ropa ha sido recibida y será lavada en breve."
    }
  },
  [LaundryOrderStatus.ReadyForDelivery]: {
    [Language.EN]: {
      title: "Your laundry is clean and dry",
      body: "Your clothes have been washed and will be delivered shortly."
    },
    [Language.ES]: {
      title: "Tu ropa está limpia y seca.",
      body: "Su ropa ha sido lavada y será entregada en breve.."
    }
  },
  [LaundryOrderStatus.OtwDelivery]: {
    [Language.EN]: {
      title: "Your fresh laundry is on the way",
      body: "Driver has picked up your laundry and is on the way to you."
    },
    [Language.ES]: {
      title: "Tu ropa fresca está en camino",
      body: "El conductor ha recogido su ropa y está en camino hacia usted."
    }
  },
  [LaundryOrderStatus.Delivered]: {
    [Language.EN]: {
      title: "Your laundry has been delivered",
      body: "Driver has indicated that he has dropped off your laundry, if there has been an error, please report to us."
    },
    [Language.ES]: {
      title: "Tu ropa ha sido entregado",
      body: "El conductor ha indicado que ha devuelto su ropa, si ha habido un error, infórmenos."
    }
  },
  [LaundryOrderStatus.CancelledByCustomer]: {
    [Language.EN]: {
      title: "Order has been cancelled",
      body: "Sorry to inform you that customer has cancelled the order."
    },
    [Language.ES]: {
      title: "Pedido ha sido cancelado",
      body: "Lamento informarle que el client ha cancelado el pedido."
    }
  },
  [LaundryOrderStatus.CancelledByAdmin]: {
    [Language.EN]: {
      title: "Order has been cancelled",
      body: "Sorry to inform you that order has been cancelled."
    },
    [Language.ES]: {
      title: "Pedido ha sido cancelado",
      body: "Lamento informarle que el pedido ha sido cancelado."
    }
  }
}
