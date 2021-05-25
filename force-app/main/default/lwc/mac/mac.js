import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import macHMAC512 from "@salesforce/apex/Encryption.macHMAC512";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class Mac extends LightningElement {
  mac;
  handleButtonClick() {
    macHMAC512()
      .then((data) => {
        this.mac = data;
      })
      .catch((error) => {
        const toastEvent = new ShowToastEvent({
          title: "Error generating mac",
          message: "Error: " + reduceErrors(error).join(","),
          variant: "error"
        });
        this.dispatchEvent(toastEvent);
      });
  }
}
