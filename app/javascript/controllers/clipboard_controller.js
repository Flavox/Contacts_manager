import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source", "notice", "btn" ]

  copy(event) {
    event.preventDefault();

    const textContentArray = this.sourceTargets.map(target => target.innerText);
    const concatenatedText = textContentArray.join('\n\n');

    console.log(concatenatedText);
    navigator.clipboard.writeText(concatenatedText);
    this.noticeTarget.innerHTML = "Copied !";
    this.noticeTarget.disabled = 'true';
  }
}
