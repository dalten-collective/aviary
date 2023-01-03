import urbitAPI from "./urbitAPI";
import * as airlock from "./airlock";
import * as parrotAPI from "./parrotAPI";

export default {
  ...urbitAPI,
  ...airlock,
  ...parrotAPI,
};
