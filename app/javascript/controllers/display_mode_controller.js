import { Controller } from "@hotwired/stimulus"
import Cookies from "js-cookie"

export default class extends Controller {
  static targets = ["container"]
  static values = {
    mode: { type: String, default: "grid" }
  }

  connect() {
    const savedMode = Cookies.get("display_mode")
    if (savedMode && (savedMode === "grid" || savedMode === "list")) {
      this.modeValue = savedMode
    }

    this.updateUI()
    this.toggleIcons()
  }

  toggle(event) {
    event.preventDefault()

    this.modeValue = this.modeValue === "grid" ? "list" : "grid"

    Cookies.set("display_mode", this.modeValue, { expires: 365 })

    this.updateUI()
    this.toggleIcons()
  }

  updateUI() {
    if (this.modeValue === "grid") {
      this.containerTarget.classList.remove("space-y-4")
      this.containerTarget.classList.add("grid", "grid-cols-5", "gap-4")
    } else {
      this.containerTarget.classList.remove("grid", "grid-cols-5", "gap-4")
      this.containerTarget.classList.add("space-y-4")
    }
  }

  toggleIcons() {
    const gridIcon = document.getElementById('grid-icon')
    const listIcon = document.getElementById('list-icon')
    const buttonText = document.getElementById('toggle-display-text')

    gridIcon.classList.toggle('hidden', this.modeValue !== 'list')
    listIcon.classList.toggle('hidden', this.modeValue !== 'grid')

    buttonText.textContent = this.modeValue === 'grid'
      ? 'Switch to List View'
      : 'Switch to Grid View'
  }
}
