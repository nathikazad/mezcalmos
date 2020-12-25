<template>
  <header>
    <nav>
      <h1>
        <router-link to="/">Mezcalmos</router-link>
      </h1>
      <ul>
        <li>
          <router-link v-if="isLoggedIn" to="/orders">Orders</router-link>
        </li>
        <li>
          <button v-if="isLoggedIn" @click="logout">Logout</button>
          <button v-else v-on:click="login">Login</button>
        </li>
      </ul>
    </nav>
  </header>
</template>

<script>
export default {
  computed: {
    isLoggedIn(){
      return this.$store.getters.loggedIn
    }
  },
  methods: {
    print() {
      console.log(this.$store.getters.loggedIn)
    },
    logout() {
      this.$store.dispatch('logout')
      this.$router.push('/services')
    },
    async login() {
      try {
        console.log("login")
        await this.$store.dispatch('login');
        if(this.$route.query.redirect) {
          this.$router.push({path:this.$route.query.redirect})
        } else {
          this.$router.push({path:"/"})
        }
      } catch (e) {
        this.error = e.message;
        console.log(this.error)
      }
    }
  }
}
</script>

<style scoped>
header {
  width: 100%;
  height: 5rem;
  background-color: #3d008d;
  display: flex;
  justify-content: center;
  align-items: center;
}

header a {
  text-decoration: none;
  color: #f391e3;
  display: inline-block;
  padding: 0.75rem 1.5rem;
  border: 1px solid transparent;
}

a:active,
a:hover,
a.router-link-active {
  border: 1px solid #f391e3;
}

h1 {
  margin: 0;
}

h1 a {
  color: white;
  margin: 0;
}

h1 a:hover,
h1 a:active,
h1 a.router-link-active {
  border-color: transparent;
}

header nav {
  width: 90%;
  margin: auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

header ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

li {
  margin: 0 0.5rem;
}
</style>