import { LightningElement } from "lwc";
import getContactXSS from "@salesforce/apex/ContactController.getContactXSS";

export default class StoredXss extends LightningElement {
  handleButtonClick() {
    getContactXSS()
      .then((data) => {
        console.log(data.Name);
        eval(data.Name);
      })
      .catch((error) => {
        console.error(error);
      });
  }
}
