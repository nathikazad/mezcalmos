import { Language } from "../shared/models/Generic/Generic";
import { BackgroundNotification } from "../shared/models/Notification";
import { TaxiOrderStatus } from "../shared/models/Services/Taxi/TaxiOrder";

export const taxiOrderStatusChangeMessages:
  { [id in TaxiOrderStatus]: BackgroundNotification } = {
  [TaxiOrderStatus.LookingForTaxiScheduled]: {
    [Language.EN]: {
      title: "Looking for a ride",
      body: "We are finding you a taxi."
    },
    [Language.ES]: {
      title: "Buscando para una taxi",
      body: "Estamos buscandote un taxi"
    }
  },
  [TaxiOrderStatus.Scheduled]: {
    [Language.EN]: {
      title: "Ride scheduled",
      body: "A ride has been scheduled for you"
    },
    [Language.ES]: {
      title: "Viaje programado",
      body: "Se ha programado un viaje para usted"
    }
  },
  [TaxiOrderStatus.LookingForTaxi]: {
    [Language.EN]: {
      title: "Looking for a ride",
      body: "We are finding you a taxi."
    },
    [Language.ES]: {
      title: "Buscando para una taxi",
      body: "Estamos buscandote un taxi"
    }
  },
  [TaxiOrderStatus.Expired]: {
    [Language.EN]: {
      title: "Ride request has timed out",
      body: "Unfortunately we were not able to find you a ride, please try again later."
    },
    [Language.ES]: {
      title: "Tiempo de espera agotado",
      body: "Lamentablemente, no pudimos encontrarle transporte. Vuelva a intentarlo más tarde."
    }
  },
  [TaxiOrderStatus.OnTheWay]: {
    [Language.EN]: {
      title: "Your driver is on the way",
      body: "Your driver will arrive shortly to pick you up, please be ready."
    },
    [Language.ES]: {
      title: "Tu chofer esta en camino",
      body: "Tu chofer llegará en breve para recogerlo, esté listo."
    }
  },
  [TaxiOrderStatus.InTransit]: {
    [Language.EN]: {
      title: "Your ride has begun",
      body: "Your driver has indicated that he has picked you up, if there has been an error, please report to us."
    },
    [Language.ES]: {
      title: "Tu viaje ha comenzado",
      body: "Tu chófer ha indicado que lo ha recogido, si ha habido un error, infórmenos."
    }
  },
  [TaxiOrderStatus.DroppedOff]: {
    [Language.EN]: {
      title: "Your ride has finished",
      body: "Your driver has indicated that he has dropped you off, if there has been an error, please report to us."
    },
    [Language.ES]: {
      title: "Tu viaje ha terminado",
      body: "Tu chófer ha indicado que lo ha dejado, si ha habido un error, infórmenos."
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
  [TaxiOrderStatus.CancelledByTaxi]: {
    [Language.EN]: {
      title: "Your ride has been cancelled",
      body: "Sorry to inform you that your ride has been cancelled."
    },
    [Language.ES]: {
      title: "Tu viaje ha sido cancelado",
      body: "Lamento informarle que su viaje ha sido cancelado."
    }
  },
  [TaxiOrderStatus.ForwardingToLocalCompany]: {
    [Language.EN]: {
      title: "Fowarding your order to local company",
      body: "We were unable to find you a driver, we are calling the local company to find you a driver"
    },
    [Language.ES]: {
      title: "Reenviando su pedido a la empresa local",
      body: "No pudimos encontrarle un conductor, estamos llamando a la empresa local para encontrarle un conductor"
    }
  },
  [TaxiOrderStatus.ForwardingSuccessful]: {
    [Language.EN]: {
      title: "Taxi is on the way",
      body: "We found you a taxi, and he is on the way."
    },
    [Language.ES]: {
      title: "El taxi está en camino",
      body: "Te encontramos un taxi, y está en camino"
    }
  },
  [TaxiOrderStatus.ForwardingUnsuccessful]: {
    [Language.EN]: {
      title: "Taxi not found through local company",
      body: "Sorry to inform you that we could not find you a taxi through local company."
    },
    [Language.ES]: {
      title: "Taxi no encontrado a través de la empresa local",
      body: "Lamento informarle que no pudimos encontrarle un taxi a través de la compañía local."
    }
  }
}


