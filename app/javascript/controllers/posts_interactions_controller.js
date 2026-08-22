import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="posts-interactions"
export default class extends Controller {
  static targets = ["btn1","btn2"]
  static values = {id:Number}

  async update(event){
    const clickedBtn = event.currentTarget
    
  }
}
