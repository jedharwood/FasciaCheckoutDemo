import { Controller } from '@hotwired/stimulus';
import Swal from 'sweetalert2';

export default class extends Controller {
  proceedToCheckout() {
    Swal.fire({
        text: 'You have reached the end of the free demo',
        icon: 'success',
        confirmButtonColor: '#14b8a6',
    });
  }
}