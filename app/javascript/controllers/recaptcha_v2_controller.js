import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { siteKey: String }

  initialize() {
    debugger
    grecaptcha.render("recaptchaV2", { sitekey: this.siteKeyValue } )
  }
}
