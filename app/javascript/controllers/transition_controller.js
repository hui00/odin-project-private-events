import { Controller } from "@hotwired/stimulus";
import { useTransition } from 'stimulus-use';

export default class extends Controller {
  static targets = ["content"];

  connect() {
  }
  toggle() {
    // console.log("toggle");
    // this.toggleTransition();
    this.contentTarget.classList.toggle("hidden");
  }
    
}
