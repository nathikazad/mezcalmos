<template>
  <div>
    
      <button type="button" @click="submitForm">Sign In With Facebook</button>
    
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoading: false,
      error: null,
    };
  },
  computed: {
  },
  methods: {
    handleError(){
      this.error = null
    },
    async submitForm() {
      this.isLoading = true;
      try {
        console.log("here")
        
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
      this.isLoading = false;
    }
  },
};
</script>