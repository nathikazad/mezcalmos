import { Chain } from "../../../hasura/library/src/generated/graphql-zeus";
export function getHasura() {
  return Chain('http://localhost:8080/v1/graphql', {
    headers: {
      "x-hasura-admin-secret": "myadminsecretkey"
    }
  });
}