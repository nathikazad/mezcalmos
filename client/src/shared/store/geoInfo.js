import {
  firebaseDatabase
} from '@/shared/config/firebase'
import { getApolloClient } from '@/shared/config/apollo'
import gql from 'graphql-tag'
export default {
  namespaced: true,

  state() {
    return {
      currentArea: null,
      list: [],

    };
  },
  getters: {
    areasList(state) {
      return state.list;
    }
  },
  actions: {
    fetchAreas(context) {
      firebaseDatabase().ref(`geoInfo/areas`).on('value', snapshot => {
        console.log(snapshot.val());
        if (snapshot.val()) {
          context.commit('loadAreas', snapshot.val())
        } else {
          context.commit('loadAreas', null)
        }
      })
    },
    async fetchAreasOnce(context) {
      let areas = (await firebaseDatabase().ref(`geoInfo/areas`).once('value')).val()
      context.commit('loadAreas', areas);
    },

    async addArea(_, area) {
      if (area) {
        return await firebaseDatabase().ref(`geoInfo/areas`).push(area)
      }
    },
    async removeArea(_, area) {
      if (area) {
        await firebaseDatabase().ref(`geoInfo/areas/${area.id}`).remove()
      }
    },
    async updateArea(_, area) {
      if (area) {
        await firebaseDatabase().ref(`geoInfo/areas/${area.id}`).set(area)
      }
    },
    async addQuery(_, query) {
      if (query) {
        return await firebaseDatabase().ref(`geoInfo/queries/${query}`).transaction(function (value) {
          return (value || 0) + 1;
        });
      }
    },
    async searchPlaces(_, payload) {
      let apolloClient = getApolloClient();
      const { data } = await apolloClient.query({
        query: gql`
        query SearchQuery {
          search_places(args: {search: "${payload.query}"}) {
            coordinates
            name
          }
        }
        
          ` })
      console.log("search places query");
      console.log(data.search_places)
    },
    async addPlace(_, payload) {
      let apolloClient = getApolloClient();
      const { data } = await apolloClient.mutate({
        mutation: gql`
        mutation MyMutation {
          insert_places_one(object: {coordinates: {type: "Point", coordinates: [${payload.lng}, ${payload.lat}]}, name: "${payload.name}"}) {
            id
          }
        }
          ` })
      console.log("add places query");
      console.log(data)
    }
  },
  mutations: {
    loadAreas(state, payload) {
      state.list = payload;
    }
  }
}