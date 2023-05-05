import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import CelloComposers from '../views/CelloComposers.vue'
import CelloPieces from '../views/CelloPieces.vue'
import IndividualComposer from "../views/IndividualComposerPage.vue";
import CelloPieceOverview from "../views/CelloPieceOverview"
import store from '../store/index'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {

      path: "/composers",
      name: "Cello Composers",
      component: CelloComposers,
      meta: {
        requiresAuth: false
      }
    },

    {
      path: "/composers/:id",
      name: "composer",
      component: IndividualComposer,
    },

    {
      path: "/pieces",
      name: "pieces",
      component: CelloPieces,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/pieces/:id",
      name: "pieceOverview",
      component: CelloPieceOverview,
      meta: {
        requiresAuth: false
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
