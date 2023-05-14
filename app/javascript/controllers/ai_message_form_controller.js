import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ai-message-form"
export default class extends Controller {
  static targets = ["button"]

  reset() {
    this.element.reset()
    this.buttonTarget.disabled = false
  }
}
