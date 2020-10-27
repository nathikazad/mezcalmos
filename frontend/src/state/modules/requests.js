export default {
    namespaced: true,
    state() {
      return {
        list: []
      };
    },
    actions: {
      async submit(context, payload) {
        let userId = context.rootGetters.userId
        let coachId = payload.coachId
        payload.coachId = null
        const response = await fetch(`https://vue-test-7606e.firebaseio.com/requests/${coachId}.json`,{
          method: 'POST',
          body: JSON.stringify(payload)
        });
        const responseData = await response.json()
        if(!response.ok) {
            let error = new Error(responseData.message || 'Submitting Request error')
            throw error
        }
        payload.id = responseData.name;
        if(coachId === userId){
          context.commit('submitRequest', payload)
        }
        
      },
      async loadRequests(context) {
        let token = context.rootGetters.authToken
        let userId = context.rootGetters.userId
        console.log(token)
        const response = await fetch(`https://vue-test-7606e.firebaseio.com/requests/${userId}.json?auth=${token}`)
        const responseData = await response.json()
        if(!response.ok) {
          let error = new Error(responseData.message || 'Loading error')
          throw error
        }
        
        let requests = []
        for (let key in responseData) {
            responseData[key].id = key
            requests.push(responseData[key])
        }
        context.commit('loadRequests', requests)
      }
    },
    mutations: {
      submitRequest(state, payload) {
        state.list.push(payload)
      },
      loadRequests(state, payload){
        state.list = payload
      }
    },
    getters: {
      list(state) {
        return state.list;
      },
      hasRequests(state) {
        return state.list && state.list.length > 0
      }
    }
  };