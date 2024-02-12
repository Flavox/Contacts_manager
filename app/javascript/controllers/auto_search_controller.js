import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "list", "hidden" ];

  connect() {
    this.element.addEventListener('submit', this.update.bind(this));
  }

  update(event) {
    event.preventDefault()

    const query = this.inputTarget.value;
    const url = `${window.location.href}?query=${query}`;

    if (query.trim().toLowerCase() === 'curriculum') {
      this.hiddenTarget.classList.remove('d-none');
    } else {
      this.hiddenTarget.classList.add('d-none');
      fetch(url, { headers: { 'Accept': 'text/plain' } })
        .then(response => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data;
        });
    }
  }
}
