import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ai-message-form"
export default class extends Controller {
  connect() {
    const textarea = this.element.querySelector("textarea");

    textarea.addEventListener("keydown", (event) => {
      if (event.keyCode === 13 && !event.shiftKey) {
        event.preventDefault();
        this.element.querySelector("input[type='submit']").click();
      }
    });
  }
}
