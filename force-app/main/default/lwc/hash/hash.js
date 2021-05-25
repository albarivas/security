import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import hashSHA512 from "@salesforce/apex/Encryption.hashSHA512";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class Hash extends LightningElement {
  hash;
  handleButtonClick() {
    hashSHA512()
      .then((data) => {
        this.hash = data;
      })
      .catch((error) => {
        const toastEvent = new ShowToastEvent({
          title: "Error generating hash",
          message: "Error: " + reduceErrors(error).join(","),
          variant: "error"
        });
        this.dispatchEvent(toastEvent);
      });
  }
}
