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
        async fetchAreas(context) {
            console.log('areas');

            await firebaseDatabase().ref(`areas/puerto`).on('value', snapshot => {
                console.log(snapshot.val());
                if (snapshot.val()) {


                    context.commit('loadAreas', snapshot.val())
                } else {
                    context.commit('loadAreas', null)
                }
            })
        },
        async fetchAreasOnce(context) {


            let areas = (await firebaseDatabase().ref(`areas/puerto`).once('value')).val()
            context.commit('loadAreas', areas);
        },

        async addArea(_, area) {
            if (area) {
                return await firebaseDatabase().ref(`areas/puerto`).push(area)
            }
        },
        async removeArea(_, area) {
            if (area) {
                await firebaseDatabase().ref(`areas/puerto/${area.id}`).remove()
            }
        },
        async updateArea(_, area) {
            if (area) {
                await firebaseDatabase().ref(`areas/puerto/${area.id}`).set(area)
            }
        },
    },
    mutations: {
        loadAreas(state, payload) {
            state.list = payload;
        }
    }
}