import { LightningElement } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import getShows from "@salesforce/apex/APICalloutController.getShows";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CalloutHardcoded extends LightningElement {
  shows;
  handleButtonClick() {
    getShows()
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
