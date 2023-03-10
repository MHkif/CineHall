import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import ReservationsView from "../views/ReservationsView.vue";
import MovieView from "../views/MovieView.vue";
import Register from "../views/RegisterView.vue";
import Login from "../views/LoginView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/myreservations",
    name: "myreservations",
    component: ReservationsView,
  },
  {
    path: "/movie",
    name: "movie",
    component: MovieView,
    // props: true,
    // props: (route) => ({ id: route.query.test }),
  },
  {
    path: "/signup",
    name: "signup",
    component: Register,
  },

  {
    path: "/login",
    name: "login",
    component: Login,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
