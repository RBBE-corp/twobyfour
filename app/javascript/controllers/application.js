
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


// Configuration for sortable js //
import Sortable from 'sortablejs';

// Checking if library is loaded
// document.addEventListener('turbolinks:load', () => {
//   console.log("Sortable: ", Sortable);
// })

// Basic sortable //
// var el = document.getElementById('memory-list-items');
// var sortable = Sortable.create(el);

var A = document.getElementById('A')
var B = document.getElementById('B')
var C = document.getElementById('C')
var D = document.getElementById('D')

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


new Sortable.create(B, {
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



new Sortable.create(C, {
  swap: true,
  group: {
    name: "shared",
  },
  sort: true,
  onEnd: function (evt) {
    console.log([
      // evt.item.id,  // dragged HTMLElement
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

new Sortable.create(D, {
  swap: true,
  group: {
    name: "shared",
  },
  sort: true,
  onEnd: function (evt) {
    console.log([
      // evt.item.id,  // dragged HTMLElement
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
