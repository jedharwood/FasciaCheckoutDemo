import { Controller } from '@hotwired/stimulus';
import { toggle } from 'el-transition';

export default class extends Controller {
  static targets = ['openMenu'];

  connect() {
    this.openMenuTarget.addEventListener('click', this.toggleDropDownMenu);
  }

  toggleDropDownMenu() {
    toggle(document.getElementById('menu-dropdown-items'));
  }

  updateBasketIcon() {
    fetch('/api/basket/basket_material_count')
      .then(response => response.json())
      .then(count => {
        if (count > 0) {
          this.setTrolleyIconColour();
          this.setTrolleyCounter(count);
        }
      }
    );
  }

  setTrolleyIconColour() {
    const trolleyIcon = document.getElementById('trolley-icon');
    trolleyIcon.setAttribute('fill', trolleyIcon.dataset.populatedColour);
  }

  setTrolleyCounter(count) {
    const trolleyCounter = document.getElementById('trolley-counter');
    trolleyCounter.textContent = count;
  }
}
