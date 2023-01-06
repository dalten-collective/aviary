import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";

const ParrotHome = () => import("../views/ParrotHome.vue");
const OspreyHome = () => import("../views/OspreyHome.vue");
const Aviary = () => import("../HandlerApp.vue");

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "aviary",
    component: Aviary,
  },
  {
    path: "/parrot",
    name: "parrotHome",
    component: ParrotHome,
  },
  {
    path: "/osprey",
    name: "ospreyHome",
    component: OspreyHome,
  },
];

const router = createRouter({
  history: createWebHistory('/apps/aviary'),
  routes,
});

export default router;
