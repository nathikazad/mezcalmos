import {
    firebaseDatabase
} from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
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
            firebaseDatabase().ref(`places/zonas`).on('value', snapshot => {
                console.log(snapshot.val());
                if (snapshot.val()) {
                    context.commit('loadAreas', snapshot.val())
                } else {
                    context.commit('loadAreas', null)
                }
            })
        },
        async fetchAreasOnce(context) {
            let areas = (await firebaseDatabase().ref(`places/zonas`).once('value')).val()
            context.commit('loadAreas', areas);
        },

        async addArea(_, area) {
            if (area) {
                return await firebaseDatabase().ref(`places/zonas`).push(area)
            }
        },
        async removeArea(_, area) {
            if (area) {
                await firebaseDatabase().ref(`places/zonas/${area.id}`).remove()
            }
        },
        async updateArea(_, area) {
            if (area) {
                await firebaseDatabase().ref(`places/zonas/${area.id}`).set(area)
            }
        },
    },
    mutations: {
        loadAreas(state, payload) {
            state.list = payload;
        }
    }
}