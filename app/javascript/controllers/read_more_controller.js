import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["text", "more", "less"];

  connect() {
    const carLmt = 537;
    const readMoreTxt = ` ...read more <i class="fa-solid fa-angle-down"></i>`;
    const readLessTxt = ` read less <i class="fa-solid fa-angle-up"></i>`;
    let allstr = this.textTarget.innerHTML
    if (allstr.length > carLmt) {
      const firstSet = allstr.substring(0, carLmt);
      const secdHalf = allstr.substring(carLmt, allstr.length);
      const htmlToAdd = `
      ${firstSet}<span data-target="more" class='second-section'>${secdHalf}</span>
      <span data-action='click->read-more#toggle' data-target='more' class='read-more' title='Click to show more'>${readMoreTxt}</span>
      <span data-action='click->read-more#toggle' class='read-less' title='Click to show less'>${readLessTxt}</span>`;
      this.textTarget.innerHTML = htmlToAdd;
    }
  }

  toggle() {
    this.element.classList.toggle("show-less-content");
    this.element.classList.toggle("show-more-content");
  }
}
