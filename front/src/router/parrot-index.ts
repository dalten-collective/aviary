import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
// import Home from "../views/Home.vue";
const Home = () => import('../views/Home.vue');

const routes: Array<RouteRecordRaw> = [
  {
    path: "/parrot",
    name: "home",
    component: Home,
  }
];

const router = createRouter({
  history: createWebHistory('/apps/aviary'),
  routes,
});

export default router;
