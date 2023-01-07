import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  HEADERS = { ACCEPT: 'application/json' };
  FAVOURITE_PATH = '/api/favourites';

  favourite(e) {
    e.preventDefault();
    if (this.element.dataset.favourited === 'true') {
      this.unFavouriteMaterial();
    } else {
      this.favouriteMaterial();
    }
  }

  favouriteMaterial() {
    const dataset = this.element.dataset;

    let formData = new FormData();
    formData.append('material_id', dataset.materialId);

    fetch(this.FAVOURITE_PATH, {
      method: 'POST',
      headers: this.headers,
      body: formData
    })
      .then(response => response.json())
      .then(data => {
        dataset.favourited = 'true';
        dataset.favouriteId = data.id;
        this.element.setAttribute('fill', dataset.favouritedColour);
    });
  }

  unFavouriteMaterial() {
    const dataset = this.element.dataset;

    fetch(`${this.FAVOURITE_PATH}/${dataset.favouriteId}`, {
      method: 'DELETE',
      headers: this.headers,
    }).then(() => {
        dataset.favourited = 'false';
        dataset.favouriteId = '';
        this.element.setAttribute('fill', 'none');
      });
  }
}
