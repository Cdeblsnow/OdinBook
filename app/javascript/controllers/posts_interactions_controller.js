import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts-interactions"
export default class extends Controller {
  static targets = ["btn1","btn2"]
  

  async update(event){
    event.preventDefault()

    const clickedBtn = event.currentTarget.closest("[data-url]")
    const url = clickedBtn.dataset.url
    const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content

    const response = await fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
    })

    if(response.ok){
      this.toggleStates()
    }
  }

  toggleStates() {
    this.btn1Target.disabled = !this.btn1Target.disabled
    this.btn2Target.disabled = !this.btn2Target.disabled
  }
}
