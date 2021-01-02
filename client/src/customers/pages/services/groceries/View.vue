<template>
  <div>
    <h1>Groceries</h1>
    <h3 class="bold flex space_between">
      <span>Orders</span>
      <span class="regular">3 Items</span>
    </h3>
    <panel
      :color="`bg_${orderDetails.orderType}`"
      v-for="(order, orderId) in orderDetails.items"
      :key="orderId"
    >
      <span slot="name" class="t-10">{{ order.name }}</span>
    </panel>
    <div class="field" id="note">
      <h3 class="bold flex space_between">
        <span>Notes</span>
      </h3>
      <input
        type="text"
        class="input bg_secondary text_blackD"
        v-model="orderDetails.notes"
        disabled
      />
    </div>
    <div class="field" id="delveredTo">
      <h3 class="bold flex space_between">
        <span>Delivered To</span>
      </h3>
      <input
        type="text"
        class="input bg_secondary text_blackD"
        v-model="orderDetails.to.address"
        disabled
      />
    </div>
    <!-- Searching fo Someone  Status-->
    <div v-if="orderDetails.status=='lookingForDriver'">
      <div class="field flex center">
        <div class="circle flex center align_center">
          <logo :light="true" class="logo"></logo>
        </div>
      </div>
      <div class="flex center">
        <h3 class="regular text_grey t-15">loading...</h3>
      </div>
    </div>
    <!-- Found Someone  Status-->
    <div v-else-if="orderDetails.status=='onTheWay'">
      <div class="field user_info flex align_center space_between bg_secondary border">
        <div class="flex">
          <avatar
            size="2.4rem"
            url="https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
          ></avatar>
          <div class="user_name">
            <h3 class="text_violet">Yassine</h3>
            <h5 class="bold">Is Buying Your Items.</h5>
          </div>
        </div>
        <div class="flex end">
          <base-button
            :mode="{
            small: true,
          }"
            class="nav-btn text_grey ml-2 bg_white elevate_1"
            :link="true"
          >
            <fa icon="envelope" />
          </base-button>
        </div>
      </div>
      <div class="field">
        <div class="map">
          <img src="@/shared/static/img/Map.png" alt />
        </div>
      </div>
    </div>
    <!-- delivered  Status-->
    <div v-else>
      <div class="field user_info flex align_center space_between bg_secondary border">
        <div class="flex">
          <avatar
            size="2.4rem"
            url="https://scontent.ftun11-1.fna.fbcdn.net/v/t1.0-9/107473085_10220372571378093_8626273449961856030_n.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=jN2qfU0I-z0AX-BsJ9G&_nc_ht=scontent.ftun11-1.fna&oh=c1ee5219e203f447022a8037b899cfc4&oe=60050203"
          ></avatar>
          <div class="user_name">
            <h3 class="text_violet">Yassine</h3>
            <h5 class="bold">Has delivered your items.</h5>
          </div>
        </div>
        <div class="flex end">
          <base-button
            :mode="{
            small: true,
          }"
            class="nav-btn text_grey ml-2 bg_white elevate_1"
            :link="true"
          >
            <fa icon="envelope" />
          </base-button>
          <span slot="param" class="t-8 flex align_center wrap ml-2 end">
            <div class="w-60">
              <fa icon="calendar-alt"></fa>
              &nbsp;{{
              orderDetails.deliveryTime | moment("l")
              }}
            </div>
            <div class="w-60">
              <fa icon="clock"></fa>
              &nbsp;
              {{ orderDetails.deliveryTime | moment("LT") }}
            </div>
          </span>
        </div>
      </div>
      <div class="field">
        <div class="map">
          <img src="@/shared/static/img/Map.png" alt />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    orderDetails() {
      return this.$store.getters["taxis/value"];
    },
    isLoaded() {
      return (
        this.$store.getters["taxis/value"] != null &&
        Object.keys(this.$store.getters["taxis/value"]).length > 0
      );
    },
    messageLink() {
      return `/messages/${this.$route.params.orderId}`;
    }
  },
  async beforeCreate() {
    this.$store.dispatch("taxis/loadTaxi", {
      orderId: this.$route.params.orderId
    });
  },
  async beforeUnmount() {
    console.log("before unmount");
    await this.$store.dispatch("taxis/unloadTaxi");
  }
};
</script>
<style lang="scss"  scoped>
.pill {
  border-radius: 6px !important;
  padding: 0.4rem 0.5rem;
}
.field {
  margin-top: 2rem !important;
}
.circle {
  width: 7.25rem;
  height: 7.25rem;
  background: map-get($gradients, diagonal);
  border-radius: 50%;
  margin: 1rem auto;

  .logo {
    width: 4.25rem;
    height: auto;
    animation: rotation 1s infinite ease-in-out;
  }
}
.user_info {
  height: 4.75rem;
  padding: 0.5rem;
  margin: 0 -1rem;
  .user_name {
    margin-left: 1rem;
    > * {
      margin: 2.5px 0;
    }
  }
}
.map {
  width: 100%;
  height: 13rem;
  img {
    height: 100%;
    width: 100%;
  }
}
@keyframes rotation {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(359deg);
  }
}
@keyframes scale {
  from {
    transform: scale(0.8);
  }
  to {
    transform: scale(1.1);
  }
}
</style>