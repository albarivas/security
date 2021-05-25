import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import getShowsNamedCredentialFields from "@salesforce/apex/APICalloutController.getShowsNamedCredentialFields";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CalloutNamedCredentialFields extends LightningElement {
  shows;
  handleButtonClick() {
    getShowsNamedCredentialFields()
      .then((data) => {
        this.shows = JSON.parse(data);
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
