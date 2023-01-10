import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['lengthInput', 'numberOfMetres', 'materialCost', 'materialTotal'];

  showDescription(e) {
    e.preventDefault();
    document.getElementById('modal-trigger').click();
  }

  handleInputChange() {
    this.numberOfMetresTarget.textContent = this.lengthInputTarget.value;
    this.materialCostTarget.textContent = this.calculateCost();
    this.materialTotalTarget.textContent = this.calculateCost();
  }

  calculateCost() {
    const length = this.lengthInputTarget.value;
    const pricePerMetreInCents = parseFloat(this.element.dataset.pricePerMetre.replace(',', ''));
    return length ? pricePerMetreInCents * parseInt(length) : 0;
  }
}
