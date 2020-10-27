<template>
    <li>
        <h3> {{fullName}} </h3>
        <h4> {{hourlyRate}}/hour </h4>
        <div>
            <base-badge v-for="area in areas" :key="area" :type="area" :title="area"> {{area}} </base-badge>
        </div>
    </li>
    <div class="actions">
        <base-button link mode="outline" :to="coachLink">View Details</base-button>
        <base-button link :to="contactCoachLink">Contact</base-button>
    </div>
    
</template>

<script>
export default {
    props:["id", "firstName", "lastName", "description", "areas", "hourlyRate"],
    computed:{
        coachLink() {
            return "/coaches/"+this.id;
        },
        contactCoachLink() {
            return "/coaches/"+this.id+"/contact";
        },
        fullName() {
            return this.firstName+" "+this.lastName
        }
    }
}
</script>

<style scoped>
li {
  margin: 1rem 0;
  border: 1px solid #424242;
  border-radius: 12px;
  padding: 1rem;
}

h3 {
  font-size: 1.5rem;
}

h3,
h4 {
  margin: 0.5rem 0;
}

div {
  margin: 0.5rem 0;
}

.actions {
  display: flex;
  justify-content: flex-end;
}
</style>