import {
    firebaseDatabase
} from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
    namespaced: true,

    state() {
        return {
            list: [],

        };
    },
    getters: {
        searchQueryList(state) {
            return state.list;
        }
    },

    mutations: {
        loadQuery(state, payload) {
            state.list = payload;
        }
    },
    actions: {

        async fetchQueryList(context) {


            let query = (await firebaseDatabase().ref(`searchQuery`).once('value')).val()
            context.commit('loadAreas', query);
        },

        async addQuery(_, query) {
            if (query) {
                return await firebaseDatabase().ref(`searchQuery/${query}`).transaction(function (value) {
                    return (value || 0) + 1;
                });
            }
        },

    }
}