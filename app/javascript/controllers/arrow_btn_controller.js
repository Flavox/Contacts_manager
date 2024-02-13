import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "toggleButton" ];

  animate() {
    this.toggleButtonTarget.classList.toggle('clicked');
  }
}
