<template>
  <div id="app">
    <nav>
      <div class="navbar-logo" @click="navigateToHomePage">Welcome to Cello Rep Finder!</div>
      <div class="navbar-toggle" @click="toggleMobileMenu">
        <span class="toggle-icon"></span>
      </div>
      <div class="navbar-links" :class="{ 'show-menu': showMobileMenu }">
        <router-link to="/" class="navbar-link" @click="closeMobileMenu">Home</router-link>
        <router-link to="/pieces" class="navbar-link" @click="closeMobileMenu">Find Repertoire</router-link>
        <router-link to="/about" class="navbar-link" @click="closeMobileMenu">Our Mission</router-link>
        <router-link to="/contact" class="navbar-link" @click="closeMobileMenu">Contribute</router-link>
      </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      showMobileMenu: false
    };
  },
  methods: {
    navigateToHomePage() {
      if (this.$route.path !== '/') {
        this.$router.push('/');
        this.showMobileMenu = false; // Close mobile menu after navigation
      }
    },
    toggleMobileMenu() {
      this.showMobileMenu = !this.showMobileMenu;
    },
    closeMobileMenu() {
      this.showMobileMenu = false;
    }
  }
};
</script>

<style>
nav {
  background-color: #1a1f71;
  color: white;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a subtle shadow to the navigation bar */
}

.navbar-logo {
  font-size: 24px;
  font-weight: bold;
  margin-right: 20px;
  cursor: pointer;
}

.navbar-toggle {
  display: none;
  cursor: pointer;
}

.toggle-icon {
  display: block;
  width: 25px;
  height: 3px;
  background-color: white;
  margin-bottom: 5px;
  border-radius: 2px; /* Add rounded corners to the toggle icon */
}

.navbar-links {
  display: flex;
  align-items: center;
}

.navbar-link {
  color: white;
  text-decoration: none;
  margin-left: 20px;
  padding: 5px 10px; /* Add some padding to make the links easier to click */
  border-radius: 4px; /* Add rounded corners to the links */
}

.navbar-link:hover {
  background-color: rgba(255, 255, 255, 0.2); /* Add a subtle background color on hover */
}

/* Media queries for mobile responsiveness */
@media screen and (max-width: 600px) {
  .navbar-logo {
    font-size: 18px;
  }

  .navbar-toggle {
    display: flex;
    align-items: center;
  }

  .navbar-links {
    display: none;
    flex-direction: column;
    background-color: #1a1f71;
    position: absolute;
    top: 55px;
    left: 0;
    right: 0;
    padding: 10px;
    box-shadow: 0 2
px 4px rgba(0, 0, 0, 0.2); /* Add a subtle shadow to the mobile menu */
}

.show-menu .navbar-links {
display: flex;
}

.navbar-link {
color: white;
text-decoration: none;
margin-left: 0;
margin-bottom: 10px;
padding: 5px 10px; /* Add some padding to make the links easier to click /
border-radius: 4px; / Add rounded corners to the links /
width: 100%; / Make the links span the entire width of the mobile menu /
text-align: center; / Center the text within the links */
}

.navbar-link:hover {
background-color: rgba(255, 255, 255, 0.2); /* Add a subtle background color on hover */
}
}
</style>
