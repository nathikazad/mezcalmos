import { InMemoryCache } from "apollo-cache-inmemory";
import ApolloClient from "apollo-client";
import { setContext } from "apollo-link-context";
import { createHttpLink } from "apollo-link-http";

let _apolloClient;
let httpLink;
export const initializeApolloClient = function (hasuraAuthToken) {
  let authLink = setContext((_, { headers }) => {
    let returnValue = {
      headers: {
        ...headers
      }
    };
    if (process.env.VUE_APP_EMULATE == "true") {
      var jwt = require('jsonwebtoken');
      var decodedObject = jwt.verify(hasuraAuthToken)
      returnValue.headers.authorization = `Bearer ${jwt.sign(decodedObject, process.env.VUE_APP_JWT_KEY)}`
    } else {
      returnValue.headers.authorization = `Bearer ${hasuraAuthToken}`
    }


    return returnValue;
  });

  _apolloClient = new ApolloClient({
    link: authLink.concat(httpLink),
    cache,
  });
};

if (process.env.VUE_APP_EMULATE == "true") {
  httpLink = createHttpLink({
    uri: `https://testing-mezc.hasura.app/v1/graphql`
  });
} else if (process.env.VUE_APP_TEST_DB == "true") {
  httpLink = createHttpLink({
    uri: `https://staging-mezc.hasura.app/v1/graphql`
  });
} else {
  httpLink = createHttpLink({
    uri: `https://mezcalmos.hasura.app/v1/graphql`,
  });
}





const cache = new InMemoryCache();



// Create the apollo client
export const getApolloClient = function () {
  return _apolloClient;
};