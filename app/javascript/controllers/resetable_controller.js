import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="resetable"
export default class extends Controller {
  connect() {
    console.info(this.element)
    this.element.value = "";
    this.element.focus();
  }
}
