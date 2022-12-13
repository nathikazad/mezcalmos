import { Chain } from "../../../hasura/library/src/generated/graphql-zeus";
export function getHasura(){
  return Chain('https://mez-staging.hasura.app/v1/graphql', {
    headers: {
      "x-hasura-admin-secret": "0a2XRBPGpw7obsGPP3NXijEQVJEtF6AZ2Jhj0DgUO7PlMvnXOimr6bHHMGDPxFf9"
    }
  });
}