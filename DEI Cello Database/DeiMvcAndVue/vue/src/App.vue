<template>
  <div id="app">
    <nav>
      <img src="../assets/CriLogo.png" id="navbar-logo" @click="navigateToHomePage" />
      <div class="navbar-toggle" @click="toggleMobileMenu">
        <span class="toggle-icon"></span>
      </div>
      <div class="navbar-links" :class="{ 'show-menu': showMobileMenu }">
        <router-link to="/" class="navbar-link" @click="closeMobileMenu">Home</router-link>
        <router-link to="/pieces" class="navbar-link" @click="closeMobileMenu">Find Repertoire</router-link>
        <router-link to="/about" class="navbar-link" @click="closeMobileMenu">Our Mission</router-link>
        <router-link to="/contact" class="navbar-link" @click="closeMobileMenu">Contribute</router-link>
      </div>
      <div class="search-icon" @click="onSearchClick">
          <i class="fas fa-search"></i>
      </div>
    </nav>
    <div class="search-bar" v-show="showSearchBar">
      <input type="text" placeholder="Search..." />
    </div>
    <router-view></router-view>
    <footer> @2023 Cello Repertoire Initiative.</footer>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      showMobileMenu: false,
      showSearchBar: false // Add data property to control search bar visibility
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
    },
    onSearchClick() {
      this.showSearchBar = !this.showSearchBar; // Toggle search bar visibility
    }
  }
};
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'); /* Add Font Awesome for search icon */

nav {
  background-color: white;
  color: white;
  padding: 5px 10px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

#navbar-logo {
  width: 17%;
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

.search-icon {
  color: black;
  font-size: 20px;
  margin-right: 10%;
  cursor: pointer;
}

.navbar-links {
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-right: 30px;
}

.navbar-link {
  color: black;
  text-decoration: none;
  margin-left: 20px;
  padding: 5px 10px; /* Add some padding to make the links easier to click */
  border-radius: 4px; /* Add rounded corners to the links */
  font-family: 'Poppins', sans-serif; /* Set the font-family to Poppins */
}

.navbar-link:hover {
  background-color: rgba(155, 155, 155, 0.2); /* Add a subtle background color on hover */
}

.search-bar {
  background-color: white;
  padding: 10px;
  display: flex;
  justify-content: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.search-bar input[type="text"] {
  width: 80%;
  padding: 5px 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-family: 'Poppins', sans-serif;
}

  footer {
  background-color: #f9f9f9;
  padding: 10px;
  text-align: center;
}

/* Media queries for mobile responsiveness */
@media screen and (max-width: 600px) {
  .navbar-logo {
    display: none;
    font-size: 18px;
    display: none;
  }

  .navbar-toggle {
    display: flex;
    align-items: center;
  }

  .navbar-links
{
  /*fix this once you've figured out how to make the nav bar appear and disappear*/
    display: none; 
    flex-direction: column;
    background-color: white;
    position: absolute;
    top: 55px;
    left: 0;
    right: 0;
    padding: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a subtle shadow to the mobile menu */
  }

  .show-menu .navbar-links {
    display: flex;
  }

  .navbar-link {
    color: black;
    text-decoration: none;
    margin-left: 0;
    margin-bottom: 10px;
    padding: 5px 10px; /* Add some padding to make the links easier to click */
    border-radius: 4px; /* Add rounded corners to the links */
    width: 100%; /* Make the links span the entire width of the mobile menu */
    text-align: center; /* Center the text within the links */
    font-family: 'Poppins', sans-serif; /* Set the font-family to Poppins */
  }

    .search-bar {
    padding: 5px;
  }

  .search-bar input[type="text"] {
    width: 100%;
  }

  .navbar-link:hover {
    background-color: rgba(255, 255, 255, 0.2); /* Add a subtle background color on hover */
  }

  footer {
  background-color: #f2f2f2;
  padding: 10px;
  text-align: center;
}
}
</style>
