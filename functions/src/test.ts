import { Restaurant } from "./shared/models/Services/Restaurant/Restaurant";
import { Chain } from "../../hasura/library/src/generated/graphql-zeus"
import { Language } from "./shared/models/Generic/Generic";

getRestaurant(1);

export async function getRestaurant(restaurantId: number): Promise<Restaurant> {
  // return (await info(restaurantId).once("value")).val(); 

  var chain = Chain("http://localhost:8080/v1/graphql", {
    headers: {
      "x-hasura-admin-secret": "myadminsecretkey",
    },
  });

  let response = await chain.query({
    restaurant_by_pk: [
      {
        id: restaurantId,
      },
      {
        id: true,
        name: true,
        description: {
          translations: [{ }, {
            language_id: true,
            value: true,
          }]
        },
        categories: [{ }, {
          name: {
            translations: [{ }, {
              language_id: true,
              value: true,
            }]
          },
          items: [{ }, {
            name: {
              translations: [{ }, {
                language_id: true,
                value: true,
              }]
            },
            options: [{ }, {
              item_options: [{ }, {
                name: {
                  translations: [{ }, {
                    language_id: true,
                    value: true,
                  }]
                },
                choices: [{ }, {
                  option_choices: [{ }, {
                    name: {
                      translations: [{ }, {
                        language_id: true,
                        value: true,
                      }]
                    },
                  }]
                }]
              }]
            }],
          }],
        }],
      },
    ],
  });
  console.log("response: ", response.restaurant_by_pk?.categories[0].items);
  
  const description = response.restaurant_by_pk?.description?.translations.reduce(
    (previousValue, currentValue) => { 
      previousValue[<Language>currentValue.language_id] = currentValue.value; 
      return previousValue;
    }, 
    <Record<Language, string>>{}
  )
  console.log("description: ", description);
  return <Restaurant>{
    info: {
      name: response.restaurant_by_pk?.name,
    },
    details: {
      description: description
    }
  }
}
