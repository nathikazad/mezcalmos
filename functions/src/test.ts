import { RestaurantOrderType } from './shared/models/Services/Restaurant/RestaurantOrder';
import { PaymentType } from "./shared/models/Generic/Order";
import { Location, AppType } from "./shared/models/Generic/Generic";
import { checkout, CheckoutRequest } from "./restaurant/checkoutCart";

const location: Location = {
  address: "qwe",
  lat: 23,
  lng: 44
}
const checkoutRequest: CheckoutRequest = {
  customerAppType: AppType.CustomerMobile,
  customerLocation: location,
  deliveryCost: 15,
  paymentType: PaymentType.Cash,
  notes: "",
  restaurantId: 1,
  restaurantOrderType: RestaurantOrderType.Delivery,
  tripDistance: 0,
  tripDuration: 0,
  tripPolyline: ""
}
checkout(1, checkoutRequest);




// import { Restaurant } from "./shared/models/Services/Restaurant/Restaurant";
// import { Chain } from "../../hasura/library/src/generated/graphql-zeus"
// import { Language } from "./shared/models/Generic/Generic";

// getRestaurant(4);

// export async function getRestaurant(restaurantId: number): Promise<Restaurant> {
//   // return (await info(restaurantId).once("value")).val(); 

//   var chain = Chain("http://localhost:8080/v1/graphql", {
//     headers: {
//       "x-hasura-admin-secret": "myadminsecretkey",
//     },
//   });
 
//   let response = await chain.query({
//     restaurant_by_pk: [
//       {
//         id: restaurantId,
//       },
//       {
//         id: true,
//         name: true,
//         description: {
//           translations: [{ }, {
//             language_id: true,
//             value: true,
//           }]
//         },
//         categories: [{ }, {
//           name: {
//             translations: [{ }, {
//               language_id: true,
//               value: true,
//             }]
//           },
//           items: [{ }, {
//             name: {
//               translations: [{ }, {
//                 language_id: true,
//                 value: true,
//               }]
//             },
//             options: [{ }, {
//               item_options: [{ }, {
//                 name: {
//                   translations: [{ }, {
//                     language_id: true,
//                     value: true,
//                   }]
//                 },
//                 choices: [{ }, {
//                   option_choices: [{ }, {
//                     name: {
//                       translations: [{ }, {
//                         language_id: true,
//                         value: true,
//                       }]
//                     },
//                   }]
//                 }]
//               }]
//             }],
//           }],
//         }],
//       },
//     ],
//   });
//   console.log("response: ", response.restaurant_by_pk?.categories[0].items[0].options[0].item_options[0].choices[0].option_choices[0].name);
  
//   const description = response.restaurant_by_pk?.description?.translations.reduce(
//     (previousValue, currentValue) => { 
//       previousValue[<Language>currentValue.language_id] = currentValue.value; 
//       return previousValue;
//     }, 
//     <Record<Language, string>>{}
//   )
//   console.log("description: ", description);
//   return <Restaurant>{
//     info: {
//       name: response.restaurant_by_pk?.name,
//     },
//     details: {
//       description: description
//     }
//   }
// }
