// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../stylesheets/application'

// TODO: Move this into separate file
document.addEventListener('turbolinks:load', () => {

  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  if ($navbarBurgers.length > 0) {

    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        const target = el.dataset.target;
        const $target = document.getElementById(target);

        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }

  // Get all "navbar-burger" elements
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
});


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
