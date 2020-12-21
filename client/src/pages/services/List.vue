<template>
  <div>
    <h1 class="regular">All Services</h1>
    <section class=" flex wrap">
      <div class="panel flex align_center center fill_width wrap" id="taxi">
        <taxi class="icon"></taxi>
        <h4>Taxi</h4>
      </div>
      <div
        class="panel flex align_center center fill_width wrap"
        id="groceries"
      >
        <groceries class="icon"></groceries>
        <h4>Groceries</h4>
      </div>
    </section>
  </div>
</template>

<script>
import taxi from "../../components/SVG/taxi";
import groceries from "../../components/SVG/groceries";
export default {
  components: {
    taxi,
    groceries,
  },
  data() {
    return {
      isLoading: false,
      error: null,
    };
  },
  computed: {
    requestTaxi() {
      return "/services/taxi/request";
    },
    requestGrocery() {
      return "/services/grocery/request";
    },
  },
};
</script>

<style lang="scss" scoped>
.panel {
  height: 8rem;
  border-radius: 12px;
  margin: 1.5rem 0;
  cursor: pointer;
  flex-direction: column;
  justify-content: center;
  h4 {
    width: 100%;
    text-align: center;
  }
  .icon {
    height: 3rem;
    width: auto;
  }
}
#taxi {
  background: rgba(252, 234, 77, 0.25);
}
#groceries {
  background: #d4fff6;
}
</style>
