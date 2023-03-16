import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
const Home = () => import("../views/osprey/OspreyHome.vue");

const routes: Array<RouteRecordRaw> = [
  {
    path: "/osprey",
    name: "ospreyHome",
    component: Home,
  },
];

const ospreyRouter = createRouter({
  history: createWebHistory('/apps/aviary'),
  routes,
});

export default ospreyRouter;
