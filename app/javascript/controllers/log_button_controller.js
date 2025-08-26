import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="log-button"
export default class extends Controller {
  connect() {
    console.log('aaaa')
  }
}
