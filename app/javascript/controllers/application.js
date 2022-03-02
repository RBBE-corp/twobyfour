
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

// Query Selector for Simple Form For //
// Now we need to set two boxes that will catch the ids and "insert value" on drop //
// Catcher list should only accept one sortable element
// Memorylist sortable list and its catcher should be shared list 1 => output to simple form query
// Instrumentals sortable list and its catcher should be shared list 2 => output to simple form query



// The #insert should be div for catcher //
// Use the drop event to triger the selector for id:
// https://developer.mozilla.org/en-US/docs/Web/API/Document/drop_event

const insert = document.querySelector('#insert');
insert.addEventListener('click', () => {
  console.log("is working");
  var memorylistinput = document.getElementById('composition_memory_list_id')
  memorylistinput.value = '3';
})

const instrumental = document.querySelector('#insert');
insert.addEventListener('click',() => {
  console.log("instrumental insert is working")
  var instrumentalinput = document.getElementById('composition_instrumental_id')
  instrumentalinput.value = '500';
})

// const insert = document.querySelector('#insert');
// insert.addEventListener('click', () => {
  //   // subject is what gets inserted, so it needs to be the memorylist_id
//   const subject = document.querySelector('#subject');
//   const positionSelect = document.querySelector('#position');
//   subject.insertAdjacentHTML(positionSelect.value, '<strong>inserted text</strong>');
// });

// const reset = document.querySelector('#reset');
// reset.addEventListener('click', () => {
//   document.location.reload();
// });

// const reset = document.querySelector('#reset');
// reset.addEventListener('click', () => {
//   document.location.reload();
// });
