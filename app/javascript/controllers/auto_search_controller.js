import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "list" ];

  connect() {
    this.element.addEventListener('submit', this.update.bind(this));
  }

  update(event) {
    event.preventDefault()

    const url = `${window.location.href}?query=${this.inputTarget.value}`;

    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
