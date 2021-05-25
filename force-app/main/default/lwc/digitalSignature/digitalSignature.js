import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import digitalSignature from "@salesforce/apex/Encryption.digitalSignature";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class DigitalSignature extends LightningElement {
  digitalSignature;
  handleButtonClick() {
    digitalSignature()
      .then((data) => {
        this.digitalSignature = data;
      })
      .catch((error) => {
        const toastEvent = new ShowToastEvent({
          title: "Error generating digital signature",
          message: "Error: " + reduceErrors(error).join(","),
          variant: "error"
        });
        this.dispatchEvent(toastEvent);
      });
  }
}
