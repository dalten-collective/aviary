import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";

const Aviary = () => import("../HandlerApp.vue");

const ParrotHome = () => import("../views/ParrotHome.vue");

const OspreyHome = () => import("../views/osprey/OspreyHome.vue");
const OspreyNav = () => import("../views/osprey/Nav.vue");

const OspreyArchive = () => import("../views/osprey/Archive.vue");
const BootNDoom = () => import("../views/osprey/BootNDoom.vue");

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "aviary",
    component: Aviary,
  },

  {
    path: "/parrot",
    name: "parrotHome",
    components: {
      parrot: ParrotHome,
    }
  },

  {
    path: "/osprey",
    name: "ospreyHome",
    components: {
      osprey: OspreyHome,
      ospreyNav: OspreyNav,
    }
  },
  {
    path: "/osprey/archive",
    name: "archive",
    components: {
      osprey: OspreyArchive,
      ospreyNav: OspreyNav,
    }
  },
  {
    path: "/osprey/bootndoom",
    name: "bootNDoom",
    components: {
      osprey: BootNDoom,
      ospreyNav: OspreyNav,
    }
  },
];

const router = createRouter({
  history: createWebHistory('/apps/aviary'),
  routes,
});

export default router;
