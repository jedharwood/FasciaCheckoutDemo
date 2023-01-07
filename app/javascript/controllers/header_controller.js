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
}
