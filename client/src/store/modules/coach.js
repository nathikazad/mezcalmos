export default {
  namespaced: true,
  state() {
    return {
      list: []
    };
  },
  actions: {
    async register(context, payload) {
      const token = context.rootGetters.authToken
      payload.id = context.rootGetters.userId
      const response = await fetch(`https://mezcalmos-31f1c-default-rtdb.firebaseio.com/coaches/${payload.id}.json?auth=${token}`,{
        method: 'PUT',
        body: JSON.stringify(payload)
      });
      const responseData = await response.json()
      if(!response.ok) {
        let error = new Error(responseData.message || 'Loading error')
        throw error
      }
      context.commit('register', payload)
    },
    async loadCoaches(context) {
      console.log("loading coaches")
      const response = await fetch(`https://mezcalmos-31f1c-default-rtdb.firebaseio.com/coaches.json`)
      const responseData = await response.json()
      if(!response.ok) {
        let error = new Error(responseData.message || 'Loading error')
        throw error
      }
      
      let coaches = []
      for (let key in responseData) {
        coaches.push(responseData[key])
      }
      context.commit('loadCoaches', coaches)
    }
  },
  mutations: {
    register(state, payload) {
      state.list.push(payload)
    },
    loadCoaches(state, payload){
      state.list = payload
    }
  },
  getters: {
    list(state) {
      return state.list;
    },
    coach: (state) => (id) => {
      return state.list.find(coach => coach.id === id)
    },
    hasCoaches(state) {
      return state.list && state.list.length > 0
    },
    isActive(_, getters, _2, rootGetters){
      const coaches = getters.list;
      const userid = rootGetters.userId
      return coaches.some(coach => coach.id === userid)
    }
  }
};