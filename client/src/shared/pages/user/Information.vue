<template>
  <div class="userInfo flex space_around">
    <h1
      class="regular txt_center"
      v-html="!editPage?$t('shared.userInfo.title'):$t('shared.userInfo.editInfo')"
    ></h1>
    <div class="information" v-if="!editPage">
      <div class="flex align_center center">
        <avatar class="border" size="10rem" :url="deepFind(userInfo,'photo')+'?height=500'"></avatar>
      </div>

      <h1 class="txt_center t-20">{{ deepFind(userInfo,'displayName') }}</h1>
      <h3 class="txt_center" v-if="deepFind(userInfo,'phone')">
        <fa icon="mobile"></fa>
        &nbsp; {{ userInfo.phone }}
      </h3>
    </div>
    <!-- editable information form -->
    <div class="information" v-else>
      <div class="flex align_center center">
        <!-- hovered image upload -->
        <div class="pointer">
          <avatar
            class="border"
            size="10rem"
            :url="previewImage||require('@/shared/static/img/clickToUpdate.png')"
            @click.native="clickOnUpload"
          ></avatar>
          <input
            accept="image/*"
            type="file"
            v-show="false"
            id="fileUpload"
            @change="receivedImage($event)"
          />
        </div>
      </div>

      <h5 class="txt_center">{{$t('shared.userInfo.editImgMsg')}}</h5>

      <div class="text_field flex align_center space_between t-19">
        <div class="icon_container">
          <fa icon="user-circle"></fa>
        </div>

        <input
          type="text"
          class="input bg_secondary text_blackD"
          :placeholder="$t('shared.placeHolders.displayName')+'...'"
          :value=" deepFind(userInfo,'displayName') "
          @change="paramValueChanged($event,'displayName','required')"
        />
      </div>
    </div>
    <!-- editable information form -->
    <div class="actions fill_width flex center" v-if="editPage">
      <base-button
        @click.native="editProfile"
        :loading="loading"
        class="w-100 elevate_1"
        :mode="{ dark: true, bg_diagonal: true }"
      >
        <fa icon="save"></fa>&nbsp;&nbsp;
        <span class="t-8 regular">{{$t('shared.userInfo.saveBtn')}}</span>
      </base-button>
    </div>
    <!-- Default information Action Btn -->
    <div class="actions fill_width flex space_between" v-else>
      <base-button
        class="w-100 elevate_1"
        :mode="{ dark: true, bg_diagonal: true }"
        link
        to="?edit=true"
      >
        <fa icon="pencil-alt"></fa>&nbsp;&nbsp;
        <span class="t-8 regular">{{$t('shared.userInfo.editBtn')}}</span>
      </base-button>
    </div>
  </div>
</template>
<script>
import { firebaseStorage } from "../../config/firebase";
export default {
  data() {
    return {
      uploadedImage: null,
      previewImage: null,
      editPage: false,
      newProfile: {},
      uploadPercentage: 0,
      loading: false
    };
  },
  computed: {
    userInfo() {
      return this.$store.getters["userInfo"];
    },
    userId() {
      return this.$store.getters["userId"];
    },
    appName() {
      return this.$store.getters.appName;
    }
  },
  watch: {
    $route: {
      deep: true,
      immediate: true,
      handler: function(to) {
        console.log(to);

        this.editPage = to.query.edit == "true";
      }
    }
  },
  methods: {
    paramValueChanged(e, param, required) {
      let newVal = e.target.value;
      if (required) {
        if (newVal) {
          this.newProfile[param] = newVal;
        }
      } else {
        this.newProfile[param] = newVal;
      }
      console.log(this.newProfile);
    },
    clickOnUpload() {
      let imageUploadInput = document.getElementById("fileUpload");

      imageUploadInput.click();
    },
    receivedImage(e) {
      if (e.target.files[0]) {
        this.uploadedImage = e.target.files[0];
        let fileSize = (this.uploadedImage.size / 1024 / 1024).toFixed(4);
        if (fileSize <= 10) {
          const reader = new FileReader();
          reader.readAsDataURL(this.uploadedImage);
          reader.onload = e => {
            this.previewImage = e.target.result;
          };
        } else {
          alert("The image file should be less than 10MB");
        }
      }
    },
    async editProfile() {
      console.log("edit");

      const image = this.uploadedImage;
      this.loading = true;
      if (this.uploadedImage) {
        const storageRef = firebaseStorage()
          .ref(`users/${this.userId}/avatar/${image.name}`)
          .put(image);
        storageRef.on(
          "state_changed",
          snapshot => {
            this.uploadPercentage =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          },
          error => {
            console.log(error.message);
          },
          () => {
            this.uploadPercentage = 100;
            storageRef.snapshot.ref.getDownloadURL().then(async url => {
              this.newProfile["photo"] = url;
              await this.$store.dispatch("editUserProfile", this.newProfile);
              this.loading = false;
              this.$router.go(-1);
            });
          }
        );
      } else {
        await this.$store.dispatch("editUserProfile", this.newProfile);
        this.loading = false;
        this.$router.go(-1);
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.userInfo {
  flex-direction: column;
  .information {
    flex: 0.5;
    h1 {
      margin-top: 3rem;
    }
  }
}
.text_field {
  margin: 0.5rem 0;
  .icon_container {
    width: 3rem;
    display: flex;
    justify-content: center;
  }
  input {
    margin-left: 0.5rem;
    width: calc(100% - 3rem);
  }
}
</style>
