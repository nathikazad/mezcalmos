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
      return {
        lat: 15.8720,
        long: -97.0767
      }
    }
  },
  actions: {
    async loadUserLocation(context) {
      let navigatorWatchId = navigator.geolocation.watchPosition(async function (position) {
        let newPosition = {
          lat: position.coords.latitude,
          long: position.coords.longitude
        }
        context.commit('setUserLocation', newPosition)
        context.state.watchPositionCallbacks.forEach(cb => cb.func(...cb.args));
        context.commit('setLocationEnabled', true)
      }, async function () {
        context.commit('setLocationEnabled', false)
      });

      context.commit('saveLogoutCallback', {
        func: function (navigatorWatchId) {
          navigator.geolocation.clearWatch(navigatorWatchId);
        },
        args: [navigatorWatchId]
      }, { root: true })
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