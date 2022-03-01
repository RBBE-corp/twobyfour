
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

// var el = document.getElementById('memory-list-items');
// var sortable = Sortable.create(el);

var A = document.getElementById('A')
var example2Right = document.getElementById('example2-right')
var example2Left = document.getElementById('example2-left')
var example2Middle = document.getElementById('example2-middle')

// Shared list no cloning //
new Sortable(example2Left, {
  group: 'shared', // set both lists to same group
  animation: 150
});

new Sortable(example2Middle, {
  group: 'shared',
  animation: 150
});

new Sortable(example2Right, {
  group: 'shared',
  animation: 150,
  swap: true
});

new Sortable.create(A, {
  swap: true,
  group: {
    name: "shared",
  },
  sort: true,
  onEnd: function (evt) {
    console.log([
      evt.item.id,  // dragged HTMLElement
      //       evt.to,    // target list
      //       evt.from,  // previous list
      //       evt.oldIndex,  // element's old index within old parent
      //       evt.newIndex,  // element's new index within new parent
      //       evt.oldDraggableIndex, // element's old index within old parent, only counting draggable elements
      //       evt.newDraggableIndex, // element's new index within new parent, only counting draggable elements
      //       evt.clone, // the clone element
      //       evt.pullMode
    ]);
  }
});
