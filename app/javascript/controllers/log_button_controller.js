import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="log-button"
export default class extends Controller {

  static targets = ["openchat", "input"];
  static values = {
    currentUser: String,
    input: String
  }

  connect() {
    this.observeChatUpdates()
    this.highlightUserMessages()
  }


  observeChatUpdates() {
    const chatContainer = document.querySelector("#room_chat")

    const observer = new MutationObserver(() => {
      this.highlightUserMessages()
    })

    observer.observe(chatContainer, {
      childList: true,
      subtree: true
    })
  }


  openChat() {
    const displaychat = document.querySelector('.chat-open')
    displaychat.style.display = "flex"
  }

  closeChat() {
    const displaychat = document.querySelector('.chat-open')

    if (displaychat.style.display === "flex") {
      displaychat.style.display = "none"
    }
  }


  scrollToBottom() {
    const displaychat = document.querySelector('.chat-open')
    displaychat.scrollTop = displaychat.scrollHeight;
  
    
  }

  highlightUserMessages() {
    const useranwser = document.querySelectorAll('.user-anwser')
    useranwser.forEach((el) => {
      
      if (el.getAttribute('userlogged') === this.currentUserValue) {
        el.style.background = '#0BA6DF'
        this.inputTarget.value =  ""
      }
    })
  }


}
