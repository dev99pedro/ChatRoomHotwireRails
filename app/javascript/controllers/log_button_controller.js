import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="log-button"
export default class extends Controller {

  static targets = ["openchat"];

  connect() {

  }


  openChat() {
    const displaychat = document.querySelector('.chat-open')
    displaychat.style.display = "block"
    const turboframe = document.getElementById("room_chat")
  }








}
