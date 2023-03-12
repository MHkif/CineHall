import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import "./assets/tailwind.css";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import VueSweetalert2 from "vue-sweetalert2";
import 'sweetalert2/dist/sweetalert2.min.css';

createApp(App)
  .component("font-awesome-icon", FontAwesomeIcon)
  .use(VueSweetalert2)
  .use(store)
  .use(router)
  .mount("#app");
