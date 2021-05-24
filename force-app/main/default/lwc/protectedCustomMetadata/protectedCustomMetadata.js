import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import useProtectedCustomMetadata from "@salesforce/apex/CallManagedPackageController.useProtectedCustomMetadata";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ProtectedCustomMetadata extends LightningElement {
  handleButtonClick() {
    useProtectedCustomMetadata()
      .then((data) => {
        const toastEvent = new ShowToastEvent({
          title: "Stored pwd is:",
          message: data,
          variant: "success"
        });
        this.dispatchEvent(toastEvent);
      })
      .catch((error) => {
        const toastEvent = new ShowToastEvent({
          title: "Error retrieving shows",
          message: "Error: " + reduceErrors(error).join(","),
          variant: "error"
        });
        this.dispatchEvent(toastEvent);
      });
  }
}
