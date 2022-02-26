import { Controller } from "@hotwired/stimulus"
import { Modal } from 'bootstrap';
// Connects to data-controller="modal"
export default class extends Controller {

  static targets = ['instance']
  connect() {
     if (this.instanceTarget.getAttribute('data-open-modal') === 'true' ) {

    const myModal = new Modal(this.instanceTarget);
    myModal.show();
  }

  }
}
