import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = ['closeButton'];

  connect() {
    document.getElementById('modal-wrapper').addEventListener('click', (event) => {
      const modalPanelClicked = document.getElementById('modal-panel').contains(event.target);
      if (!modalPanelClicked) {
        this.hideModal();
      }
    });

    this.closeButtonTarget.addEventListener('click', () => {
      this.hideModal();
    });
  }

  showModal() {
    enter(document.getElementById('modal-wrapper'));
    enter(document.getElementById('modal-backdrop'));
    enter(document.getElementById('modal-panel'));
  }

  hideModal() {
    leave(document.getElementById('modal-wrapper'));
    leave(document.getElementById('modal-backdrop'));
    leave(document.getElementById('modal-panel'));
  }
}