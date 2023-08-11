import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['source', 'copyButton']

  copy() {
    navigator.clipboard.writeText(this.sourceTarget.value)
    this.copyButtonTarget.innerHTML = 'コピーしました'
  }
}
