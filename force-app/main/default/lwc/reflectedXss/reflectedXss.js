import { LightningElement } from "lwc";
import getContactXSS from "@salesforce/apex/ContactController.getContactXSS";

export default class ReflectedXss extends LightningElement {
  handleInputChange(event) {
    eval(event.detail.value);
  }
}
