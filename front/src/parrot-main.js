import { createApp } from "vue";
import ParrotApp from "./ParrotApp.vue";
import router from "./router/parrot-index";
import './index.css';

import { store } from "./store/parrot-store";

const app = createApp(App);

app.use(store);
app.use(router);
app.mount("#parrotApp");
