import { LightningElement } from "lwc";

export default class LwcDOMManipulation extends LightningElement {
  demographics = [
    {
      state: "Washington",
      population: 7100000
    },
    {
      state: "California",
      population: 270000000
    },
    {
      state: "Florida",
      population: "<b>21000000</b>"
    }
  ];
}
