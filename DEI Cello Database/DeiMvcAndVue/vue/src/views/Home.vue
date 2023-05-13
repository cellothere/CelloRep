<template>
  <div class="landing-page">
    <div class="content">
      <div class="image" :style="`background-image: url(${currentImage})`" :class="{ 'fade-in': fadeIn, 'slide-out': slideOut, 'slide-in': slideIn }"></div> <!-- Grid area for the image -->
    </div>
    <div class="welcomeContent">
      <h2>Welcome to the Cello Repertoire Initiative</h2>
      <br>
      <h3>
        <router-link to="/pieces" class="routerLinkToPieces">Find music for your students</router-link>
        <br>
        <br>
        <router-link to="/pieces" class="routerLinkToPieces">Browse our catalogue</router-link>
        <br>
        <br>
        <router-link to="/composers" class="routerLinkToPieces">Discover composers</router-link>
      </h3>
      <router-link to="/composers"></router-link>
      </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      images: [
        require('../../assets/smithImg.jpg'),
        require('../../assets/walkerImg.jpg'),
        require('../../assets/priceImg.jpg'),
        require('../../assets/mooreImg.jpg'),
        require('../../assets/bakerImg.jpg'),
        // Add more image paths as needed
      ],
      currentImageIndex: 0,
      currentImage: '',
      fadeIn: false,
      slideOut: false,
      slideIn: false
    };
  },
  mounted() {
    this.startSlideshow();
  },
  beforeDestroy() {
    this.stopSlideshow();
  },
  methods: {
    startSlideshow() {
      this.currentImage = this.images[this.currentImageIndex];
      this.intervalId = setInterval(this.changeImage, 10000);
    },
    stopSlideshow() {
      clearInterval(this.intervalId);
    },
    changeImage() {
      this.fadeIn = true; // Apply the fade-in transition
      this.slideOut = true; // Apply the slide-out transition
      setTimeout(() => {
        this.slideIn = true; // Apply the slide-in transition
        setTimeout(() => {
          this.currentImageIndex = (this.currentImageIndex + 1) % this.images.length;
          this.currentImage = this.images[this.currentImageIndex];
          this.fadeIn = false; // Remove the fade-in transition
          this.slideOut = false; // Remove the slide-out transition
          this.slideIn = false; // Remove the slide-in transition
        }, 100); // Wait for .1 second before changing the image
      }, 1000); // Wait for 1 second before starting the slide-in transition
    }
  }
};
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
.landing-page {
  display: grid;
  grid-template-rows: 1fr auto;
  min-height: 100vh;
  grid-template-columns: .4fr .6fr; /* Split the page into two equal columns */
  grid-template-areas: "content welcomeContent";
}

.content {
  display: grid;
  grid-template-areas: "image"; /* Define the grid areas */
  grid-area: content; /* Add this line */
}

.image {
  grid-area: image; /* Place the image in the "image" grid area */
  background-size: cover;
  background-position: center;
  margin-top: 1%;
  transition: opacity 0.5s ease-in-out, transform 1s ease-in-out; /* Apply transitions to the opacity and transform properties */
  opacity: 1; /* Initially set the opacity to 1 */
  transform: translateX(0); /* Initially set the translateX value to 0 */
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.fade-in {
  opacity: 0; /* Set the opacity to 0 during the transition */
}

.slide-out {
  transform: translateX(-100%); /* Slide the image to the left */
}

.slide-in {
  transform: translateX(0); /* Reset the translateX value for the next image */
}


.text {
  grid-area: text; /* Place the text in the "text" grid area */

}
h2 {
  font-size: 2.1rem;
}
.welcomeContent {
  display: flex;
  font-family: Poppins;
  text-align: center;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.footer {
  background-color: #f2f2f2;
  padding: 10px;
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  display: grid;
  place-items: center;
  font-family: Poppins;
}
.router-link h3 {
  size: 10rem;
  color: black;
  font-family: Poppins;
}

.routerLinkToPieces,
.routerLinkToPieces:visited {
  color: black;
  text-decoration: none;
  font-size: 1.2rem;
  position: relative; /* Add this for positioning the pseudo-element */
}

.routerLinkToPieces::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 2px; /* Set the height of the underline */
  bottom: -4px;
  left: 0; /* Start from the left */
  background-color: black;
  transform: scaleX(0); /* Initially set the scale to 0 */
  transform-origin: left center; /* Set the transform origin to the left center */
  transition: transform 0.3s ease; /* Add a smooth transition for transform property */
}

.routerLinkToPieces:hover::before {
  transform: scaleX(1); /* Scale the underline to 1 */
}



@media (max-width: 600px) {
  .landing-page {
    grid-template-columns: 1fr; /* Switch to a single column layout */
    grid-template-areas: "content" "welcomeContent"; /* Update grid areas */
  }

  .image {
    height: auto;
  }
}
</style>