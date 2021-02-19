<template>
  <div>
    <h4>{{$t('shared.addItem.title')}}</h4>
    <label>{{$t('shared.addItem.name')}}</label>
    <input type="text" v-model="name" />
    <label>{{$tc('shared.addItem.note',2)}}</label>
    <input type="text" v-model="notes" />
    <button @click="addItem">{{$t('shared.addItem.addItemBtn')}}</button>
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
    }
  }
};
</script>