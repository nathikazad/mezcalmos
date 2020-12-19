<template>
  <div>
    <h4> Add New Item </h4>
    <label>Name</label>
    <input type="text" v-model="name" />
    <label>Notes</label>
    <input type="text" v-model="notes" />
    <button @click="addItem">Add Item</button>
  </div>
</template>

<script>
export default {
  props: ["location"],
  data() {
    return { name: "", notes: "" };
  },
  methods: {
    async addItem() {
      this.$emit("new-item", { name: this.name, notes: this.notes });
      this.name = "";
      this.notes = "";
    },
  },
};
</script>