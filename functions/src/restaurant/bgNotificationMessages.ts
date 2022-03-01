import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Generic/Notification";
import { RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";

export const restaurantOrderStatusChangeMessages:
  { [id in RestaurantOrderStatus]: BackgroundNotification } = {
  [RestaurantOrderStatus.OrderReceieved]: {
    [Language.EN]: {
      title: "Your order is being prepared",
      body: "Restaurant has recieved your order and has begun preparation."
    },
    [Language.ES]: {
      title: "Se está preparando tu pedido",
      body: "El restaurante ha recibido su pedido y ha comenzado a prepararlo."
    }
  },
  [RestaurantOrderStatus.PreparingOrder]: {
    [Language.EN]: {
      title: "Your order is being prepared",
      body: "Restaurant has recieved your order and has begun preparation."
    },
    [Language.ES]: {
      title: "Se está preparando tu pedido",
      body: "El restaurante ha recibido su pedido y ha comenzado a prepararlo."
    }
  },
  [RestaurantOrderStatus.ReadyForPickup]: {
    [Language.EN]: {
      title: "Your order is ready for pickup",
      body: "Restaurant has finished preparing your order is awaiting pickup."
    },
    [Language.ES]: {
      title: "Tu pedido está listo para ser recogido.",
      body: "El restaurante ha terminado de preparar su pedido y está a la espera de que lo recojan."
    }
  },
  [RestaurantOrderStatus.OnTheWay]: {
    [Language.EN]: {
      title: "Your delivery is on the way",
      body: "Driver has picked up your order and is on the way."
    },
    [Language.ES]: {
      title: "Tu entrega está en camino",
      body: "El conductor ha recogido su pedido y está en camino."
    }
  },
  [RestaurantOrderStatus.Delivered]: {
    [Language.EN]: {
      title: "Your order has been delivered",
      body: "Driver has indicated that he has dropped off your order, if there has been an error, please report to us."
    },
    [Language.ES]: {
      title: "Tu pedido ha sido entregado",
      body: "El conductor ha indicado que ha devuelto su pedido, si ha habido un error, infórmenos."
    }
  },
  [RestaurantOrderStatus.CancelledByCustomer]: {
    [Language.EN]: {
      title: "Order has been cancelled",
      body: "Sorry to inform you that customer has cancelled the order."
    },
    [Language.ES]: {
      title: "Pedido ha sido cancelado",
      body: "Lamento informarle que el client ha cancelado el pedido."
    }
  },
  [RestaurantOrderStatus.CancelledByAdmin]: {
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
