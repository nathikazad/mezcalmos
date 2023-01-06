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
  [DeliveryOrderStatus.AtPickup]: {
    [Language.EN]: {
      title: "at pickup",
      body: ""
    },
    [Language.ES]: {
      title: "at pickup",
      body: ""
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
      title: "OnTheWayToDropoff",
      body: ""
    },
    [Language.ES]: {
      title: "OnTheWayToDropoff",
      body: ""
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
      body: ""
    },
    [Language.ES]: {
      title: "Delivered",
      body: ""
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
