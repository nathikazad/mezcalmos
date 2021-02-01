export default {
    state() {
        return {
            customerLocation: null,

        };
    },
    getters: {
        customerLocation(state) {
            return state.customerLocation
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


            });

        },

    },
    mutations: {

        setCustomerLocation(state, payload) {
            state.customerLocation = payload
        },

    }
}