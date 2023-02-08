import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Notification";
import { DeliveryOrderStatus } from "../shared/models/Generic/Delivery";

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

export const deliveryCancelOrderMessage: BackgroundNotification =
{
  [Language.EN]: {
    title: "Order Cancelled",
    body: "Your order has been cancelled"
  },
  [Language.ES]: {
    title: "Orden Cancellado",
    body: "Tu orden ha sido cancelado"
  }
}

export const deliveryDriverChangeMessage: BackgroundNotification =
{
  [Language.EN]: {
    title: "deliveryDriverChange",
    body: ""
  },
  [Language.ES]: {
    title: "deliveryDriverChange",
    body: ""
  }
}

export const deliveryOrderStatusChangeMessages: { [id in DeliveryOrderStatus]: BackgroundNotification } = {
  [DeliveryOrderStatus.OnTheWayToPickup]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
  [DeliveryOrderStatus.AtPickup]: {
    [Language.EN]: {
      title: "Driver arrived",
      body: "Driver has arrived at your location for pickup"
    },
    [Language.ES]: {
      title: "Conductor llegado",
      body: "El conductor ha llegado a su ubicación para recoger"
    }
  },
  [DeliveryOrderStatus.PackageReady]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
  [DeliveryOrderStatus.OnTheWayToDropoff]: {
    [Language.EN]: {
      title: "Order Picked Up",
      body: "Driver has picked up your order and is on the way."
    },
    [Language.ES]: {
      title: "Pedido Recogido",
      body: "El conductor ha recogido su pedido y está en camino."
    }
  },
  [DeliveryOrderStatus.AtDropoff]: {
    [Language.EN]: {
      title: "AtDropoff",
      body: ""
    },
    [Language.ES]: {
      title: "AtDropoff",
      body: ""
    }
  },
  [DeliveryOrderStatus.Delivered]: {
    [Language.EN]: {
      title: "Delivered",
      body: "Your order has been delivered"
    },
    [Language.ES]: {
      title: "Entregado",
      body: "Tu pedido ha sido entregado"
    }
  },
  [DeliveryOrderStatus.CancelledByCustomer]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
  [DeliveryOrderStatus.CancelledByDeliverer]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
  [DeliveryOrderStatus.CancelledByServiceProvider]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
  [DeliveryOrderStatus.OrderReceived]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
}
