import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["bubble"]
  static values = {number: Number}
  
 
  numberValueChanged(number){
    
    if (number > 0) {
      this.bubbleTarget.classList.remove("hidden")
    } else {
      this.bubbleTarget.classList.add("hidden")
    }
  }
}
