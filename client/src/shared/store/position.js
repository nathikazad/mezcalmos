export default {
    state() {
        return {
            customerLocation: null,
            locationEnabled: false
        };
    },
    getters: {
        customerLocation(state) {
            return state.customerLocation
        },
        locationEnabled(state) {
            return state.locationEnabled
        }
    },
    actions: {
        async loadCustomerLocation(context) {
            navigator.geolocation.watchPosition(async function (position) {
                let newPosition = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                }
                context.commit('setCustomerLocation', newPosition)
                context.commit('setLocationEnabled', true)
            }, async function () {
                context.commit('setLocationEnabled', false)
            });

        },

    },
    mutations: {
        setCustomerLocation(state, payload) {
            state.customerLocation = payload
        },
        setLocationEnabled(state, payload) {
            console.log("Location Enabled, ", payload)
            state.locationEnabled = payload
        }
    }
}