import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Notification";
import { TaxiOrderStatus } from "../shared/models/Services/Taxi/TaxiOrder";

export const taxiNewOrderMessage: BackgroundNotification =
{
  [Language.EN]: {
    title: "New Ride Request",
    body: "You have been assigned a new ride request"
  },
  [Language.ES]: {
    title: "Nueva solicitud de viaje",
    body: "Se le ha asignado una nueva solicitud de viaje"
  }
}

export const taxiOrderStatusChangeMessages:
  { [id in TaxiOrderStatus]: BackgroundNotification } = {
  [TaxiOrderStatus.OrderReceived]: {
    [Language.EN]: {
      title: "",
      body: ""
    },
    [Language.ES]: {
      title: "",
      body: ""
    }
  },
  [TaxiOrderStatus.OnTheWayToPickup]: {
    [Language.EN]: {
      title: "A Taxi is on the way",
      body: "A taxi is on the way to pickup the passengers"
    },
    [Language.ES]: {
      title: "Un taxi está en camino.",
      body: "Un taxi está en camino a recoger a los pasajeros."
    }
  },
  [TaxiOrderStatus.AtPickup]: {
    [Language.EN]: {
      title: "Taxi at pickup location",
      body: "The taxi has arrived to pickup the passengers"
    },
    [Language.ES]: {
      title: "Taxi en el lugar de recogida",
      body: "El taxi ha llegado a recoger a los pasajeros."
    }
  },
  [TaxiOrderStatus.OnTheWayToDropoff]: {
    [Language.EN]: {
      title: "Taxi on the way",
      body: "The taxi is on the way to dropoff the passengers"
    },
    [Language.ES]: {
      title: "Taxi en el camino",
      body: "El taxi está en camino de dejar a los pasajeros."
    }
  },
  [TaxiOrderStatus.AtDropoff]: {
    [Language.EN]: {
      title: "Taxi at dropoff location",
      body: "You have arrived at your destination"
    },
    [Language.ES]: {
      title: "Taxi en el lugar de entrega",
      body: "Has llegado a tu destino"
    }
  },
  [TaxiOrderStatus.RideComplete]: {
    [Language.EN]: {
      title: "Ride Complete",
      body: ""
    },
    [Language.ES]: {
      title: "Paseo completo",
      body: ""
    }
  },
  [TaxiOrderStatus.CancelledByCustomer]: {
    [Language.EN]: {
      title: "Your ride has been cancelled",
      body: "Sorry to inform you that your ride has been cancelled."
    },
    [Language.ES]: {
      title: "Tu viaje ha sido cancelado",
      body: "Lamento informarle que su viaje ha sido cancelado."
    }
  },
  [TaxiOrderStatus.CancelledByDriver]: {
    [Language.EN]: {
      title: "Your ride has been cancelled",
      body: "Sorry to inform you that your ride has been cancelled."
    },
    [Language.ES]: {
      title: "Tu viaje ha sido cancelado",
      body: "Lamento informarle que su viaje ha sido cancelado."
    }
  },
  [TaxiOrderStatus.CancelledByServiceProvider]: {
    [Language.EN]: {
      title: "Your ride has been cancelled",
      body: "Sorry to inform you that your ride has been cancelled."
    },
    [Language.ES]: {
      title: "Tu viaje ha sido cancelado",
      body: "Lamento informarle que su viaje ha sido cancelado."
    }
  },
  [TaxiOrderStatus.CancelledByAdmin]: {
    [Language.EN]: {
      title: "Your ride has been cancelled",
      body: "Sorry to inform you that your ride has been cancelled."
    },
    [Language.ES]: {
      title: "Tu viaje ha sido cancelado",
      body: "Lamento informarle que su viaje ha sido cancelado."
    }
  }
}


