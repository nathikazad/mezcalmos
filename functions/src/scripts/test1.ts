// import { setupServiceProvider } from "./utilities/stripe/serviceProvider"
// import * as firebase from "firebase-admin";

import { getHasura } from "../utilities/hasura";
// import * as fs from 'fs';
// import * as yaml from 'js-yaml';
import { initEnv } from "../../../supervisor/src/init";
import menu from '../vege.json';
// Assuming you have the yaml in a file named 'input.yaml'

initEnv();


// insert_restaurant_restaurant_one(object: {details: {data: {name: "Salento", phone_number: "+1restaurantId0986restaurantId8445", image: "image", location: {data: {address: "Address", gps: "{ \"type\": \"Point\", \"crs\": { \"type\": \"name\", \"properties\": { \"name\": \"urn:ogc:def:crs:EPSG::43restaurantId6\" } }, \"coordinates\": [ -97, 15.8 ] }"}}, service_provider_type: "restaurant", unique_id: "salento"}}, delivery_details: {data: {self_delivery: true, sitin_available: true, customer_pickup: true, delivery_available: true}}}) {
//   id
// }
interface MenuItem {
  [key: string]: string[];
}

interface MenuDescription {
  description: [string, string];
  price: string;
}

interface JsonData {
  [key: string]: MenuDescription;
}

const jsonData = {


  "4 FORMAGGI": {
    "description": ["Mozzarella, gorgonzola y varios quesos.", "Mozzarella, gorgonzola and various cheeses."],
    "price": "Personal: $170 | Grande: $340"
  },
  "3 FORMAGGI": {
    "description": ["Mozzarella, no gorgonzola y varios quesos.", "Mozzarella, not gorgonzola and various cheeses."],
    "price": "Personal: $160 | Grande: $320"
  },
  "PEPERONI": {
    "description": ["Salsa de tomate, mozzarella y peperoni.", "Tomato sauce, mozzarella and peperoni."],
    "price": "Personal: $150 | Grande: $300"
  },
  "HAWAIANA": {
    "description": ["Salsa de tomate, mozzarella, piña y jamón.", "Tomato sauce, mozzarella, pineapple and ham."],
    "price": "Personal: $150 | Grande: $300"
  },
  "CARBONARA": {
    "description": ["Salsa de tomate, mozzarella, tocino y huevo.", "Tomato sauce, mozzarella, bacon and egg."],
    "price": "Personal: $150 | Grande: $300"
  },
  "TONNO CIPOLLA": {
    "description": ["Salsa de tomate, mozzarella, atún, cebolla y orégano.", "Tomato sauce, mozzarella, tuna, onion and oregano."],
    "price": "Personal: $160 | Grande: $320"
  },
  "SALENTO": {
    "description": ["Salsa de tomate, mozzarella, mejillones, camarones, calamar y almejas.", "Tomato sauce, mozzarella, mussels, shrimp, squid and clam."],
    "price": "Personal: $200 | Grande: $400"
  },
  "ESPLOSIVA": {
    "description": ["Salsa de tomate, mozzarella, tocino, cebolla y huevo.", "Tomato sauce, mozzarella, bacon, onion and egg."],
    "price": "Personal: $160 | Grande: $320"
  },
  "VEGETARIANA": {
    "description": ["Salsa de tomate, mozzarella, berenjenas, calabazas y pimientos.", "Tomato sauce, mozzarella, eggplant, pumpkins and peppers."],
    "price": "Personal: $170 | Grande: $340"
  },
  "PUGLIESE": {
    "description": ["Salsa de tomate, mozzarella, cebolla, aceitunas, tomatitos y albahaca.", "Tomato sauce, mozzarella, onion, olives, little tomatoes and basil."],
    "price": "Personal: $140 | Grande: $280"
  },
  "MEXICANA": {
    "description": ["Tomate, mozzarella, frijoles, cebolla, chorizo, chile serrano.", "Tomato, mozzarella, beans, onion, chorizo, chile serrano."],
    "price": "Personal: $160 | Grande: $320"
  },
  "ZIO": {
    "description": ["Salsa de tomate, mozzarella, huevo, rucola y grana.", "Tomato sauce, mozzarella, egg, rucola and grana."],
    "price": "Personal: $160 | Grande: $320"
  },
  "NIGNO": {
    "description": ["Salsa de tomate, mozzarella, albondigas, rucola y grana.", "Tomato sauce, mozzarella, meatballs, rucola and grana."],
    "price": "Personal: $160 | Grande: $320"
  },
  "MILÚ": {
    "description": ["Salsa de tomate, mozzarella, albondigas, huevo y chile.", "Tomato sauce, mozzarella, meatballs, egg and chilli."],
    "price": "Personal: $160 | Grande: $320"
  },
  "PIADA": {
    "description": ["Sal, aceite, tomatitos, rucola y grana.", "Salt, oil, little tomatoes, rucola and grana."],
    "price": "Personal: $140 | Grande: $280"
  },
  "CARLOS": {
    "description": ["Salsa de tomate, mozzarella, chile serrano, queso azul y rucola.", "Tomato sauce, mozzarella, serrano chile, blue cheese and rucola."],
    "price": "Personal: $170 | Grande: $340"
  },
  "GAMBERETTI E ZUCCHINE": {
    "description": ["Salsa de tomate, mozzarella, calabazas y camarones.", "Tomato sauce, mozzarella, pumpkins and shrimps."],
    "price": "Personal: $160 | Grande: $320"
  },
  "BISMARCK": {
    "description": ["Salsa de tomate, mozzarella, jamón y huevo.", "Tomato sauce, mozzarella, ham and egg."],
    "price": "Personal: $140 | Grande: $280"
  }
};

const writeMenu = async () => {

  const restaurantId = 169;
  const categoryId = 351;
  let chain = getHasura();
  let response = await chain.mutation({
    insert_restaurant_item: [
      {
        objects: Object.entries(jsonData).map(([itemName, itemData], index) => {
          console.log(index + 25);

          const [enDesc, esDesc] = itemData.description;
          const prices = itemData.price.split('|').map((price: string) => price.trim());
          const [personalPrice, grandePrice] = prices.map(price => parseFloat(price.split('$')[1]));

          return {
            restaurant_id: restaurantId,
            cost: personalPrice,
            category_id: categoryId,
            position: index + 6,
            name: {
              data: {
                service_provider_id: restaurantId,
                service_provider_type: "restaurant",
                translations: {
                  data: [
                    { language_id: "en", value: itemName },
                    { language_id: "es", value: itemName }
                  ]
                }
              }
            },
            description: {
              data: {
                service_provider_id: restaurantId,
                service_provider_type: "restaurant",
                translations: {
                  data: [
                    { value: enDesc, language_id: "en" },
                    { value: esDesc, language_id: "es" }
                  ]
                }
              }
            },
            options: {
              data: [{
                restaurant_id: restaurantId,
                item_options: {
                  data: [{
                    restaurant_id: restaurantId,
                    name: {
                      data: {
                        service_provider_id: restaurantId,
                        service_provider_type: "restaurant",
                        translations: {
                          data: [
                            { language_id: "en", value: "Size" },
                            { language_id: "es", value: "Tamaño" }
                          ]
                        }
                      }
                    },
                    cost_per_extra: "$0.00",
                    free_choice: 1,
                    maximum_choice: 1,
                    minimum_choice: 1,
                    choices: {
                      data: [
                        {
                          restaurant_id: restaurantId,
                          option_choices: {
                            data: [
                              {
                                restaurant_id: restaurantId,
                                cost: "$0.00",
                                available: true,
                                name: {
                                  data: {
                                    service_provider_id: restaurantId,
                                    service_provider_type: "restaurant",
                                    translations: {
                                      data: [
                                        { value: "Small", language_id: "en" },
                                        { value: "Pequeño", language_id: "es" }
                                      ]
                                    }
                                  },
                                },
                              },
                            ]
                          }
                        },
                        {
                          restaurant_id: restaurantId,
                          option_choices: {
                            data: [
                              {
                                restaurant_id: restaurantId,
                                cost: `$${grandePrice - personalPrice}.00`,
                                available: true,
                                name: {
                                  data: {
                                    service_provider_id: restaurantId,
                                    service_provider_type: "restaurant",
                                    translations: {
                                      data: [
                                        { value: "Large", language_id: "en" },
                                        { value: "Grande", language_id: "es" }
                                      ]
                                    }
                                  }
                                }
                              }
                            ]
                          }
                        }
                      ]
                    },
                  }]
                }
              }]
            }
          }
        })
      },
      {
        affected_rows: true
      }
    ]
  })
  console.log(response.insert_restaurant_item?.affected_rows);

};



interface OptionChoice {
  cost: number;
  name: {
    en: string;
    es: string;
  };
  default?: boolean;
}

interface Option {
  name: {
    en: string;
    es: string;
  };
  type: string;
  choices: Record<string, OptionChoice>;
}

interface Item {
  name: {
    en: string;
    es: string;
  };
  cost: number;
  desc?: {
    en: string;
    es: string;
  };
  image: string;
  options?: Record<string, Option>;
}

interface Category {
  name: {
    en: string;
    es: string;
  };
  items: Record<string, Item>;
}

type Menu = Record<string, Category>;
const writeMenu2 = async (menu: Menu) => {
  const restaurantId = 171;
  let chain = getHasura();
  let response = await chain.mutation({
    insert_restaurant_category: [
      {
        objects: Object.entries(menu).map(([categoryName, categoryData]) => {
          return {
            name: {
              data: {
                service_provider_id: restaurantId,
                service_provider_type: "restaurant",
                translations: {
                  data: [
                    { language_id: "en", value: categoryData.name.en },
                    { language_id: "es", value: categoryData.name.es }
                  ]
                }
              }
            },
            items: {
              data: Object.entries(categoryData.items).map(([itemName, itemData], index) => {
                return {
                  restaurant_id: restaurantId,
                  cost: itemData.cost,
                  position: index + 1,
                  name: {
                    data: {
                      service_provider_id: restaurantId,
                      service_provider_type: "restaurant",
                      translations: {
                        data: [
                          { language_id: "en", value: itemData.name.en },
                          { language_id: "es", value: itemData.name.es }
                        ]
                      }
                    }
                  },
                  description: itemData.desc && {
                    data: {
                      service_provider_id: restaurantId,
                      service_provider_type: "restaurant",
                      translations: {
                        data: [
                          { value: itemData.desc.en, language_id: "en" },
                          { value: itemData.desc.es, language_id: "es" }
                        ]
                      }
                    }
                  },
                  image: itemData.image,
                  options: itemData.options ? {
                    data: Object.entries(itemData.options).map(([optionName, optionData], index2) => {
                      return {
                        
                        restaurant_id: restaurantId,
                        item_options: {
                          data: [{
                            restaurant_id: restaurantId,
                            name: {
                              data: {
                                service_provider_id: restaurantId,
                                service_provider_type: "restaurant",
                                translations: {
                                  data: [
                                    { language_id: "en", value: optionData.name.en },
                                    { language_id: "es", value: optionData.name.es }
                                  ]
                                }
                              }
                            },
                            cost_per_extra: "$0.00",
                            free_choice: 0,
                            maximum_choice: (optionData.type == "chooseOne") ? 1 : Object.entries(optionData.choices).length,
                            minimum_choice: (optionData.type == "chooseOne") ? 1 : 0,
                            choices: {
                              data: Object.entries(optionData.choices).map(([choiceName, choiceData]) => {
                                return {
                                  restaurant_id: restaurantId,
                                  
                                  option_choices: {
                                    data: [{
                                      restaurant_id: restaurantId,
                                      cost: choiceData.cost.toString(),
                                      available: true,
                                      name: {
                                        data: {
                                          service_provider_id: restaurantId,
                                          service_provider_type: "restaurant",
                                          translations: {
                                            data: [
                                              { value: choiceData.name.en, language_id: "en" },
                                              { value: choiceData.name.es, language_id: "es" }
                                            ]
                                          }
                                        }
                                      }
                                      // default: choiceData.default
                                    }]
                                  }
                                };
                              })
                            }
                          }]
                        }
                      };
                    })
                  } : undefined
                  
                }
              })


            },
            restaurant_id: restaurantId
          }
        })
      },
      {
        affected_rows: true
      }
    ],
  });

  // You can uncomment the following line if you want to log the response
  // console.log(response.insert_restaurant_item?.affected_rows);
};

writeMenu2(menu);





// options: {
//   data: 
//   [{
//       restaurant_id: restaurantId,
//       item_options: {
//         data: [{
//           restaurant_id: restaurantId,
//           name: {
//             data: {
//               service_provider_id: restaurantId,
//               service_provider_type: "restaurant",
//               translations: {
//                 data: [
//                   { language_id: "en", value: option.name.en },
//                   { language_id: "es", value: option.name.es }
//                 ]
//               }
//             }
//           },
//           cost_per_extra: "$0.00",
//           free_choice: 1,
//           position: 1,
//           maximum_choice: 1,
//           minimum_choice: 1,
//           choices: {
//             data: [{
//               restaurant_id: restaurantId,
//                 option_choices: {
//                   data: [{
//                     restaurant_id: restaurantId,
//                     cost: option.choices["dsf"].cost.toString(),
//                     available: true,
//                     name: {
//                       data: {
//                         service_provider_id: restaurantId,
//                         service_provider_type: "restaurant",
//                         translations: {
//                           data: [
//                             { value: option.choices["dsf"].name.en, language_id: "en" },
//                             { value: option.choices["dsf"].name.es, language_id: "es" }
//                           ]
//                         }
//                       }
//                     }
//                     // default: choiceData.default
//                   }]
//                 }
//             }]
            
//           }
//         }]
//       }
//     }]
// }