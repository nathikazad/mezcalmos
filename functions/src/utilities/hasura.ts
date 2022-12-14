import * as functions from "firebase-functions";
import { Chain } from "../../../hasura/library/src/generated/graphql-zeus";
export function getHasura(){
  if (process.env.FUNCTIONS_EMULATOR === "true") {
  return Chain('http://localhost:8080/v1/graphql', {
    headers: {
      "x-hasura-admin-secret": "0a2XRBPGpw7obsGPP3NXijEQVJEtF6AZ2Jhj0DgUO7PlMvnXOimr6bHHMGDPxFf9"
    }
  });
  } else {
    return Chain(functions.config().hasura.endpoint, {
      headers: {
        "x-hasura-admin-secret": functions.config().hasura.secret
      }
    });
  }
}