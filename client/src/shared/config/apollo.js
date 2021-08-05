import { InMemoryCache } from "apollo-cache-inmemory";
import ApolloClient from "apollo-client";
import { setContext } from "apollo-link-context";
import { createHttpLink } from "apollo-link-http";

let _apolloClient;

export const initializeApolloClient = function (hasuraAuthToken) {
  let authLink = setContext((_, { headers }) => {
    let returnValue = {
      headers: {
        ...headers
      }
    };

    returnValue.headers.authorization = `Bearer ${hasuraAuthToken}`
    return returnValue;
  });

  _apolloClient = new ApolloClient({
    link: authLink.concat(httpLink),
    cache,
  });
};

const httpLink = createHttpLink({
  uri: `https://mezcalmos.hasura.app/v1/graphql`,
});

const cache = new InMemoryCache();



// Create the apollo client
export const getApolloClient = function () {
  return _apolloClient;
};