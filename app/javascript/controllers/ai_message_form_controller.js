import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ai-message-form"
export default class extends Controller {
  static targets = ["content"];

  submitOnEnter(event) {
    if (event.keyCode === 13 && !event.shiftKey) {
      event.preventDefault();
      this.element.submit();
    }
  }
}
