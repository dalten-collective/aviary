import UrbitInterface from "@urbit/http-api"; // for typescript
import connector from "@urbit/http-api";

const urbitAPI: UrbitInterface = new connector("", "");
urbitAPI.ship = window.ship;

export default urbitAPI;
