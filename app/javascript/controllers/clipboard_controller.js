import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source", "button", "notice" ];

  resetCopiedState() {
    const elementsWithCopiedClass = document.querySelectorAll("[data-clipboard-target='button']");
    const noticeTarget = document.querySelector("[data-clipboard-target='notice']");

    elementsWithCopiedClass.forEach(element => {
      element.innerHTML = "<i class='fa-regular fa-clipboard'></i>";
    });

    noticeTarget.innerHTML = "Copy <i class='fa-regular fa-clipboard'></i>";
  }

  copy(event) {
    event.preventDefault();
    this.resetCopiedState();

    const textContentArray = this.sourceTargets.map(target => target.innerText);
    let concatenatedText = textContentArray.join('\n\n');
    const specificText = " read less";
    concatenatedText = concatenatedText.replace(new RegExp(specificText + "$"), "");

    console.log(concatenatedText);
    navigator.clipboard.writeText(concatenatedText);

    if (this.hasButtonTarget) {
      this.buttonTarget.innerHTML = "<i class='fa-regular fa-circle-check'></i>";
    }

    if (this.hasNoticeTarget) {
      this.noticeTarget.innerHTML = "Copied ! <i class='fa-regular fa-circle-check'></i>";
    }
  }
}
