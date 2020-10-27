let timer
export default {
  state() {
    return {
      userId: null,
      authToken: null
    };
  },
  getters: {
    userId(state) {
      return state.userId;
    },
    authToken(state) {
      return state.authToken;
    },
    loggedIn(state) {
      return !!state.authToken;
    }
  },
  actions: {
    async login(context, payload) {
      return context.dispatch('authenticate', {
        ...payload,
        mode: 'login'
      });
    },
    async signUp(context, payload) {
      return context.dispatch('authenticate', {
        ...payload,
        mode: 'signup'
      });
    },
    async authenticate(context, payload) {
      let url = `https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDrzrm45K_KXvbzgtginqRLGabrgYTaWWs`
      if (payload.mode == "signup") {
        url = `https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDrzrm45K_KXvbzgtginqRLGabrgYTaWWs`
      }
      const response = await fetch(url
        , {
          method: 'POST',
          body: JSON.stringify({
            email: payload.email,
            password: payload.password,
            returnSecureToken: true
          })
        });
      const responseData = await response.json()
      if (!response.ok) {
        let error = new Error(responseData.error.message || 'Sign Up error')
        throw error
      }

      const expiresIn = +responseData.expiresIn * 1000;
      const expirationDate = new Date().getTime() + expiresIn;

      localStorage.setItem('token', responseData.idToken);
      localStorage.setItem('userId', responseData.localId);
      localStorage.setItem('tokenExpiration', expirationDate);

      timer = setTimeout(() => {
        context.dispatch('logout')
      }, expiresIn)

      context.commit('saveAuthData', {
        userId: responseData.localId,
        authToken: responseData.idToken
      })
    },
    logout(context) {
      clearTimeout(timer)
      context.commit('saveAuthData', {
        userId: null,
        authToken: null
      })
    },
    tryLogin(context) {
      
      const token = localStorage.getItem('token');
      const userId = localStorage.getItem('userId');
      const tokenExpiration = localStorage.getItem('tokenExpiration');

      const expiresIn = +tokenExpiration - new Date().getTime();
      if (expiresIn < 0) {
        return;
      }
      timer = setTimeout(function () {
        context.dispatch('logout');
      }, expiresIn);

      if (token && userId) {
        context.commit('saveAuthData', {
          authToken: token,
          userId: userId
        });
      }
    },
  },
  mutations: {
    saveAuthData(state, payload) {
      state.userId = payload.userId;
      state.authToken = payload.authToken;
    }
  }
}