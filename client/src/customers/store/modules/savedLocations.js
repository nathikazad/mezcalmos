import {
  firebaseDatabase
} from '@/shared/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      locations: {}
    };
  },
  actions: {
    loadLocations(context) {
      let userId = context.rootGetters.userId
      firebaseDatabase().ref(`/users/${userId}/savedLocations`).on('value', async snapshot => {
        let locations = snapshot.val();
        // TODO: if unauthorized or wrong type of order redirect to home page
        context.commit('saveLocations', locations)
      });
      context.commit('saveLogoutCallback', {
        func:function(userId) {
          firebaseDatabase().ref(`/users/${userId}/savedLocations`).off()
        }, 
        args: [userId]
      }, { root: true })
    },
    async saveLocation(context, payload) {
      let userId = context.rootGetters.userId
      let newLocation = {
        name: payload.name,
        lat: payload.lat,
        long: payload.long,
        address: payload.address
      }
      await firebaseDatabase().ref(`/users/${userId}/savedLocations`).push(newLocation);
    },
    async removeLocation(context, payload) {
      let userId = context.rootGetters.userId
      let savedLocationId = payload.savedLocationId
      await firebaseDatabase().ref(`/users/${userId}/savedLocations/${savedLocationId}`).remove();
    },
    async editLocation(context, payload) {
      let userId = context.rootGetters.userId
      let savedLocationId = payload.savedLocationId
      await firebaseDatabase().ref(`/users/${userId}/savedLocations/${savedLocationId}`).set({
        ...payload.newLocation
      });
    }
  },
  mutations: {
    saveLocations(state, payload) {
      state.locations = payload
    }
  },
  getters: {
    locations(state) {
      return state.locations;
    },
    hasLocations(state) {
      return state.locations != null && Object.keys(state.locations).length > 0;
    },
  }
};