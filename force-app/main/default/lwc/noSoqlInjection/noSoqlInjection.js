import { LightningElement, wire } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import REVENUE_FIELD from "@salesforce/schema/Account.AnnualRevenue";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import getFilteredAccounts from "@salesforce/apex/AccountController.getFilteredAccounts";

const COLUMNS = [
  { label: "Account Name", fieldName: NAME_FIELD.fieldApiName, type: "text" },
  {
    label: "Annual Revenue",
    fieldName: REVENUE_FIELD.fieldApiName,
    type: "currency"
  },
  { label: "Industry", fieldName: INDUSTRY_FIELD.fieldApiName, type: "text" }
];

export default class NoSoqlInjection extends LightningElement {
  columns = COLUMNS;
  searchValue = "";

  @wire(getFilteredAccounts, { searchValue: "$searchValue" })
  accounts;

  get errors() {
    return this.accounts.error ? reduceErrors(this.accounts.error) : [];
  }

  handleInputChange(event) {
    this.searchValue = event.target.value;
  }
}
