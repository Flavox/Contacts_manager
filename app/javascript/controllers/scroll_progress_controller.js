import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["scrollBar"];

  connect () {
    const height =
      document.documentElement.scrollHeight - document.documentElement.clientHeight;

    window.addEventListener('scroll', () => {
      const scrollTop =
        window.scrollY || document.documentElement.scrollTop;

      this.scrollBarTarget.style.width = `${(scrollTop / height) * 100}%`;
    });
  }
}
