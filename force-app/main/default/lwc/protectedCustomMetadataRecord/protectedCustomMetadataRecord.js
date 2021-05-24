import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import useProtectedCustomMetadataRecord from "@salesforce/apex/CallManagedPackageController.useProtectedCustomMetadataRecord";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class ProtectedCustomMetadataRecord extends LightningElement {
  handleButtonClick() {
    useProtectedCustomMetadataRecord()
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
