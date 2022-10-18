import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "propertySets" ]

  connect() {
    debugger;

    const $propertySetLinks = Array.prototype.slice.call(document.querySelectorAll('.property-set-link'), 0);

    if ($propertySetLinks.length > 0) {

      $propertySetLinks.forEach( el => {
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        $target.style.display = "none"

        el.addEventListener('click', (event) => {
          event.preventDefault()

          $target.style.display = "block"
          el.style.display = "none"
        });
      });
    }
  }
}
