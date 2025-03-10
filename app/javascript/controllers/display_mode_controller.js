import { Controller } from "@hotwired/stimulus"
import Cookies from "js-cookie"

export default class extends Controller {
  static targets = ["container", "listIcon", "gridIcon", "toggleDisplayText"]
  static values = {
    mode: { type: String, default: "grid" },
    listClasses: { type: Array, default: ["space-y-4"] },
    gridClasses: { type: Array, default: ["grid", "grid-cols-5", "gap-4"] }
  }

  connect() {
    const preferredMode = Cookies.get("display_mode")

    if (preferredMode && (preferredMode === "grid" || preferredMode === "list")) {
      this.modeValue = preferredMode
    }

    this.refreshUI()
  }

  toggle(event) {
    event.preventDefault()

    this.modeValue = this.modeValue === "grid" ? "list" : "grid"

    Cookies.set("display_mode", this.modeValue, { expires: 365 })
  }

  modeValueChanged() {
    this.refreshUI()
  }

  refreshUI() {
    if (this.modeValue === "grid") {
      this.containerTarget.classList.remove(...this.listClassesValue)
      this.containerTarget.classList.add(...this.gridClassesValue)
    } else {
      this.containerTarget.classList.remove(...this.gridClassesValue)
      this.containerTarget.classList.add(...this.listClassesValue)
    }

    this.listIconTarget.classList.toggle('hidden', this.modeValue !== 'grid')
    this.gridIconTarget.classList.toggle('hidden', this.modeValue !== 'list')

    this.toggleDisplayTextTarget.textContent = `Switch to ${this.modeValue === "grid" ? "list" : "grid"} view`
  }
}
