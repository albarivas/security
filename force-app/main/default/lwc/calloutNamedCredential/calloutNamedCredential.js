import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import getShowsNamedCredential from "@salesforce/apex/APICalloutController.getShowsNamedCredential";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CalloutNamedCredential extends LightningElement {
  shows;
  handleButtonClick() {
    getShowsNamedCredential()
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
