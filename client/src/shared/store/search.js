import {
    firebaseDatabase
} from '@/shared/config/firebase'

export default {
    namespaced: true,
    actions: {
        async addQuery(_, query) {
            if (query) {
                return await firebaseDatabase().ref(`places/queries/${query}`).transaction(function (value) {
                    return (value || 0) + 1;
                });
            }
        },

    }
}