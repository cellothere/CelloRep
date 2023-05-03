<template>
  <div class="explore" :class="{ 'has-favorites': hasFavorites }">
    <favorites-side-bar v-show="showSidebar == true" v-if="hasFavorites" />
    <div class="banner">
      <img class="banner-image" src="https://images.rawpixel.com/image_1000/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGQxOS0zLTEyODE2dS5qcGc.jpg" alt="Downtown Cleveland">
      <img class="cleveland-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Destination_Cleveland_logo.svg/512px-Destination_Cleveland_logo.svg.png?20211216160402" alt="Script Cleveland"/>
    </div>
    <h2>Discover Cleveland - Explore popular destinations - Select favorites to begin building your day!</h2>
    <br>
    <div class='suggestions'>
      <destination-list />
    </div>
  </div>
</template>

<script>
import destinationList from '../components/DestinationList.vue';
import FavoritesSideBar from '../components/FavoritesSideBar.vue'

export default {
  components: { 
    destinationList,
    FavoritesSideBar
    },
  name: "explore",
  data() {
    return {
      showSidebar: true
    }
  },
  computed: {
    hasFavorites() {
      return this.$store.state.favorites.length > 0;
    },
  },
};

</script>

<style>

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

.explore {
  text-align: center;
}

.suggestions {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.banner {
  display: flex;
  flex-direction: column;
  position: relative;
  top: 0;
  left: 0;
  margin-top: 18px;
  margin-right: 10px;
}

.banner-image {
  position: relative;
  margin-top: 2.5%;
  top: 0px;
  left: 0px;
  height: 400px;
  width: 100%;
  object-fit: cover;
}

.cleveland-logo {
  position: absolute;
  top: 40px;
  left: 0px;
  height: 375px;
  width: 100%;
  object-fit: contain;
  filter: invert(100%);
}

template {
  background-color: bisque;
}

.has-favorites .suggestions {
  margin-right: 11%;
}

@media (max-width: 768px) {
  .favorites-side-bar {
    display: none;
  }
  .has-favorites .suggestions {
    margin-right: 0%;
}
}

</style>
