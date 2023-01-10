import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  static targets = ['closeButton'];

  connect() {
    document.getElementById('modal-wrapper').addEventListener('click', (event) => {
      this.closeModal(event);
    });

    this.closeButtonTarget.addEventListener('click', () => {
      this.leaveModal();
    });
  }

  closeModal(event) {
    const modalPanelClicked = document.getElementById('modal-panel').contains(event.target);

    if (!modalPanelClicked) {
      this.leaveModal();
    }
  }

  showModal() {
    enter(document.getElementById('modal-wrapper'));
    enter(document.getElementById('modal-backdrop'));
    enter(document.getElementById('modal-panel'));
  }

  leaveModal() {
    leave(document.getElementById('modal-wrapper'));
    leave(document.getElementById('modal-backdrop'));
    leave(document.getElementById('modal-panel'));
  }
}
