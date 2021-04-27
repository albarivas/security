import { LightningElement } from "lwc";

export default class ManualDOMManipulation extends LightningElement {
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
      population: 21000000
    }
  ];
  renderedCallback() {
    const el = this.template.querySelector(".myList");
    this.demographics.forEach((d) => {
      const li = document.createElement("li");
      li.innerHTML = `${d.state} (pop: ${d.population})`;
      el.appendChild(li);
    });
  }
}
