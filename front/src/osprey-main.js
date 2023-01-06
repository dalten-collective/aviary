import { createApp } from "vue";
import './index.css';

const OspreyApp = () => import("./OspreyApp.vue");
const ospreyRouter = () => import("./router/osprey-router");
const ospreyStore = () => import({ ospreyStore },  "./store/osprey-store");

const app = createApp(OspreyApp);

app.use(ospreyStore);
app.use(ospreyRouter);
app.mount("#ospreyApp");
