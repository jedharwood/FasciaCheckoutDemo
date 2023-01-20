import { Controller } from '@hotwired/stimulus';
import { get } from '@rails/request.js';

export default class extends Controller {
  static targets = ['lengthInput', 'price'];
  HEADERS = { ACCEPT: 'application/json' };
  BASKET_PATH = '/api/basket';

  connect() {
    this.updateTotalPrice()
  }

  showDescription() {
    const event = new CustomEvent("show-description-modal");
    window.dispatchEvent(event);
  }

  updateTotalPrice() {
    get(`/basket_materials/update_total_price?length=${this.getLength()}&price=${this.getPricePerMetre()}`, {responseKind: 'turbo-stream'});
  }

  getLength() {
    return this.lengthInputTarget.value ? this.lengthInputTarget.value : 0;
  }

  getPricePerMetre() {
    return this.element.dataset.pricePerMetre
  }
}
