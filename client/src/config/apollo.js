import { InMemoryCache } from "apollo-cache-inmemory";
import ApolloClient from "apollo-client";
import { setContext } from "apollo-link-context";
import { createHttpLink } from "apollo-link-http";
import store from '../store/store'
// HELP: figure out a way to make this async which you can do in react
// let token = null
const authLink = setContext((_, { headers }) => {
  let returnValue = {
    headers: {
      ...headers
    }
  }; 
  if (store.getters.authToken) {
    returnValue.headers.authorization = `Bearer ${store.getters.authToken}`
  } 
  return returnValue;
});


const httpLink = createHttpLink({
  uri: `https://mezcalmos.hasura.app/v1/graphql`,
});

const cache = new InMemoryCache();

// Create the apollo client
export const apolloClient = new ApolloClient({
  link: authLink.concat(httpLink),
  cache,
});