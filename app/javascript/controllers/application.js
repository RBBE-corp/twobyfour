
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


// Configuration for sortable js //
import Sortable from 'sortablejs';

// Checking if library is loaded
document.addEventListener('turbolinks:load', () => {
  console.log("Sortable: ", Sortable);
})

// Basic sortable //

var el = document.getElementById('memory-list-items');
var sortable = Sortable.create(el);
