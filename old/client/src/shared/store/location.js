import {
  puertoCoords
} from '@/shared/mixins/mapFunctions'

export default {
  state() {
    return {
      userLocation: null,
      lastLocationUpdateTime: null,
      locationEnabled: false,
      watchPositionCallbacks: []
    };
  },
  getters: {
    userLocation(state) {
      return state.userLocation
    },
    lastLocationUpdateTime(state) {
      return state.lastLocationUpdateTime
    },
    locationEnabled(state) {
      return state.locationEnabled
    },
    getUserDefaultLocation() {
      return puertoCoords
    }
  },
  actions: {
    async loadUserLocation(context) {
      let navigatorWatchId = navigator.geolocation.watchPosition(async function (position) {
        let newPosition = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        }
        context.commit('setUserLocation', newPosition)
        context.state.watchPositionCallbacks.forEach(cb => cb.func(...cb.args));
        context.commit('setLocationEnabled', true)
        // console.log('success ', position);

      }, async function (err) {
        console.log('errror ', err);
        context.commit('setLocationEnabled', false)
      });

      context.commit('saveLogoutCallback', {
        func: function (navigatorWatchId) {
          navigator.geolocation.clearWatch(navigatorWatchId);
        },
        args: [navigatorWatchId]
      }, {
        root: true
      })
    },
    saveWatchPositionCallback(context, payload) {
      context.commit('saveWatchPositionCallback', payload)
    }
  },
  mutations: {
    setUserLocation(state, payload) {
      state.userLocation = payload
      state.lastLocationUpdateTime = new Date()
    },
    setLocationEnabled(state, payload) {
      state.locationEnabled = payload
    },
    saveWatchPositionCallback(state, payload) {
      state.watchPositionCallbacks.push(payload)
    }

  }
}