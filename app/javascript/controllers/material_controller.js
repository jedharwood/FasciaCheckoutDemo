import { Controller } from '@hotwired/stimulus';
import Swal from 'sweetalert2';

export default class extends Controller {
  static targets = ['lengthInput', 'numberOfMetres', 'materialCost', 'materialTotal'];
  HEADERS = { ACCEPT: 'application/json' };
  BASKET_PATH = '/api/basket';

  showDescription(e) {
    e.preventDefault();
    document.getElementById('modal-trigger').click();
  }

  handleInputChange() {
    this.numberOfMetresTarget.textContent = this.getLength();
    this.materialCostTarget.textContent = this.calculateCost();
    this.materialTotalTarget.textContent = this.calculateCost();
  }

  getLength() {
    return this.lengthInputTarget.value ? this.lengthInputTarget.value : 0;
  }

  calculateCost() {
    const length = this.lengthInputTarget.value;
    const pricePerMetreInCents = parseFloat(this.element.dataset.pricePerMetre.replace(',', ''));
    return length ? pricePerMetreInCents * parseInt(length) : 0;
  }

  addToBasket() {
    if (this.lengthInputTarget.value < 1) {
      Swal.fire({
        text: 'Please tell us how many metres you require',
        icon: 'warning',
        confirmButtonColor: '#f59e0b',
      }); 
      return;
    }

    let formData = new FormData();
    formData.append('material_id', this.element.dataset.materialId);
    formData.append('length', this.lengthInputTarget.value);

    fetch(this.BASKET_PATH, {
      method: 'POST',
      headers: this.headers,
      body: formData
    })
    .then(response => {
      if (response.ok) {
        // emit event to checkout controller
        Swal.fire({
          text: 'Material successfully added to basket',
          icon: 'success',
          confirmButtonColor: '#14b8a6',
        });
      } else {
        Swal.fire({
          text: 'Something went wrong, please try again',
          icon: 'error',
          confirmButtonColor: '#f43f5e',
        });
      }
    });
  }
}
