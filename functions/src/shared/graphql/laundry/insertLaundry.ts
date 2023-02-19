import { getHasura } from "../../../utilities/hasura";
import { ServiceProviderType } from "../../models/Services/Service";

export async function insertLaundryStores(data: any) {
    let chain = getHasura();

    await chain.mutation({
        insert_laundry_store_one: [{
            object: {
                categories: {
                    data: JSON.parse(`[{
                        "cost_by_kilo": 18,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "regular wash"
                            }, {
                                "language_id": "es",
                                "value": "lavado normal"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 30,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "bedspreads"
                            }, {
                                "language_id": "es",
                                "value": "colchas"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 35,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "quilt"
                            }, {
                                "language_id": "es",
                                "value": "edredon"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 25,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "manteles"
                            }, {
                                "language_id": "es",
                                "value": "manteles"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 20,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "sábanas y toallas"
                            }, {
                                "language_id": "es",
                                "value": "sábanas y toallas"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 25,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "express wash"
                            }, {
                                "language_id": "es",
                                "value": "lavado express"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 30,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "tennis wash"
                            }, {
                                "language_id": "es",
                                "value": "lavado de tenis"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 15,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "shirt ironing"
                            }, {
                                "language_id": "es",
                                "value": "planchado de camisas"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 20,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "trouser press"
                            }, {
                                "language_id": "es",
                                "value": "planchado de pantalón"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 22,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "double wash"
                            }, {
                                "language_id": "es",
                                "value": "doble lavado"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 14,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "wash only"
                            }, {
                                "language_id": "es",
                                "value": "solo lavado"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 14,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "dry only"
                            }, {
                                "language_id": "es",
                                "value": "solo secado"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 5,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "extra softening"
                            }, {
                                "language_id": "es",
                                "value": "suavitel extra"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 5,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "clothes hangers"
                            }, {
                                "language_id": "es",
                                "value": "gancho para ropa"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 30,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "small pillow"
                            }, {
                                "language_id": "es",
                                "value": "almohada chica"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 40,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "medium pillow"
                            }, {
                                "language_id": "es",
                                "value": "almohada mediana"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 60,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "big pillow"
                            }, {
                                "language_id": "es",
                                "value": "almohada grande"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 30,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "small mat"
                            }, {
                                "language_id": "es",
                                "value": "tapete pequeño"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 60,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "medium rug"
                            }, {
                                "language_id": "es",
                                "value": "tapete mediano"
                            }]
                            }
                        }
                        }
                    }, {
                        "cost_by_kilo": 100,
                        "name": {
                        "data": {
                            "service_provider_id": 0,
                            "service_provider_type": "laundry",
                            "translations": {
                            "data": [{
                                "language_id": "en",
                                "value": "large mat"
                            }, {
                                "language_id": "es",
                                "value": "tapete grande"
                            }]
                            }
                        }
                        }
                    }]`)
                },
                delivery_details: {
                    data: {}
                },
                delivery_partners: {
                    data: [{
                        delivery_company_id: 1,
                        // service_provider_id: 1,
                        // service_provider_type: ServiceProviderType.Laundry
                    }]
                },
                details: {
                    data: {
                        firebase_id: "sZ2ridoRimaN8iL62ticaP5RxmA7",
                        image: "https://firebasestorage.googleapis.com/v0/b/mezcalmos-staging.appspot.com/o/laundries%2FNahiely.jpg?alt=media&token=5f6a269a-657c-46b6-a794-494f2962d180",
                        location: {
                            data: {
                                address: "1a oriente entre 4 y 5 norte",
                                gps: JSON.stringify({
                                    "type": "Point",
                                     "coordinates": [-97.068697, 15.866373]
                                })
                            }
                        },
                        name: "Lavandería Nahielly",
                        schedule: JSON.stringify({
                            "friday": {
                                "from": "7:0",
                                "isOpen": true,
                                "to": "20:0"
                            },
                            "monday": {
                                "from": "7:0",
                                "isOpen": true,
                                "to": "20:0"
                            },
                            "saturday": {
                                "from": "8:0",
                                "isOpen": true,
                                "to": "20:0"
                            },
                            "sunday": {
                                "from": "8:0",
                                "isOpen": true,
                                "to": "15:30"
                            },
                            "thursday": {
                                "from": "7:0",
                                "isOpen": true,
                                "to": "20:0"
                            },
                            "tuesday": {
                                "from": "7:0",
                                "isOpen": true,
                                "to": "20:0"
                            },
                            "wednesday": {
                                "from": "7:0",
                                "isOpen": true,
                                "to": "20:0"
                            }
                        }),
                        service_provider_type: ServiceProviderType.Laundry,
                    },
                },
                minimum_cost: 54
            }
        }, {
            id: true
        }]
    })
}