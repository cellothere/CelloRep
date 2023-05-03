import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    favoritesInitialState: [],
    favorites: [],
    currentItineraryInfo: {
      itineraryTitle: null,
      itineratyDate: null,
      itineraryStartingTime: null,
    },
    currentItineraryDestinations: [],
    currentLatitude: 41.5038033, //hard-coded temporarily
    currentLongitude: -81.6419466 //hard-coded temporarily,
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SAVE_FAVORITE(state, destination) {
      state.favorites.push(destination)
    },
    ADD_TO_FAVORITES(state, destination) {
      state.favorites.push(destination);
    },
    REMOVE_FROM_FAVORITES(state, destination) {
      const index = state.favorites.indexOf(destination);
      if (index !== -1) {
        state.favorites.splice(index, 1);
      }
    },
      ADD_Itinerary(state, itinerary) {
        state.itineraries.unshift(itinerary);
      }
    }
})
