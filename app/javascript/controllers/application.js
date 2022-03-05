
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// Configuration for sortable js //
// import Sortable from 'sortablejs';

// // Checking if library is loaded
// // document.addEventListener('turbolinks:load', () => {
// //   console.log("Sortable: ", Sortable);
// // })

// // Basic sortable syntax//
// // var el = document.getElementById('memory-list-items');
// // var sortable = Sortable.create(el);

// var A = document.getElementById('A') //Memorylist
// var B = document.getElementById('B') //Instrumentals
// var C = document.getElementById('C') //Memorylist Catcher
// var D = document.getElementById('D') //Instrumentals Catcher
// // A + C memorylist-shared
// // B + D instrumental-shared

// var memorylistinput = document.getElementById('composition_memory_list_id')
// var instrumentalinput = document.getElementById('composition_instrumental_id')

// // Memorylist //
// new Sortable.create(A, {
//   swap: true,
//   swapThreshold: 1,
//   group: {
//     name: "memorylist-shared",
//   },
//   sort: true,
//   onEnd: function (evt) {

//     memorylistinput.value = evt.item.id;
//     console.log([
//       evt.item.id,
//     ]);
//   }
// });

// // Instrumentals //
// new Sortable.create(B, {
//   swap: true,
//   swapThreshold: 1,
//   group: {
//     name: "instrumental-shared",
//   },
//   sort: true,
//   onEnd: function (evt) {
//     instrumentalinput.value = evt.item.id;
//     console.log([
//       evt.item.id,  // dragged HTMLElement
//     ]);
//   }
// });

// // Memorylist Catcher //
// new Sortable.create(C, {
//   swap: true,
//   swapThreshold: 1,
//   group: {
//     name: "memorylist-shared",
//   },
//   sort: true,
//   onEnd: function (evt) {
//     console.log([
//       evt.item.id,
//     ]);
//   }
// });

// // Instrumentals Catcher //
// new Sortable.create(D, {
//   swap: true,
//   swapThreshold: 1,
//   group: {
//     name: "instrumental-shared",
//   },
//   sort: true,
//   onEnd: function (evt) {
//     console.log([
//       evt.item.id,  // dragged HTMLElement
//       //       evt.to,    // target list
//       //       evt.from,  // previous list
//       //       evt.oldIndex,  // element's old index within old parent
//       //       evt.newIndex,  // element's new index within new parent
//       //       evt.oldDraggableIndex, // element's old index within old parent, only counting draggable elements
//       //       evt.newDraggableIndex, // element's new index within new parent, only counting draggable elements
//       //       evt.clone, // the clone element
//       //       evt.pullMode
//     ]);
//   }
// });

// // How it works: JS sortable to fill in a form //
// // 1. Sortable.create makes a sortabls list
// // 2. Each sortable list can be linked to each other using the keyword group: { name: "#"}
// // 3. You can sort cards within the same group
// // 4. There is a eventlistener "onEnd" on the memorylists & instrumentals sortable list
// // 5. When a sortable item is dropped into the catcher(just a given name)list it runs a query
// // 6. The query selects the hidden element id from simple form <input>
// // 7. The <input value="#"> is what retains the user input in the form
// // 8. There are number of unique keywords in sortablejs that lets you retrieve information from the sortable element
// // 9. Here we use evt.item.id, which retrieves the id of the element which we can set to <div id="<%= memorylist.id %>
// // 10. By setting memorylistinput.value = evt.item.id; which runs "onEnd" we can insert our memorylist_id into the form
// // 11. Finally you can use some css to hide sections of the form you don't want the user to see


// // Query Selector Tester for Simple Form
// // const insert = document.querySelector('#insert');
// // insert.addEventListener('click', () => {
// //   console.log("is working");
// //   var memorylistinput = document.getElementById('composition_memory_list_id')
// //   memorylistinput.value = '3';
// // })

// // const instrumental = document.querySelector('#insert');
// // insert.addEventListener('click',() => {
// //   console.log("instrumental insert is working")
// //   var instrumentalinput = document.getElementById('composition_instrumental_id')
// //   instrumentalinput.value = '500';
// // })

// // const insert = document.querySelector('#insert');
// // insert.addEventListener('click', () => {
//   //   // subject is what gets inserted, so it needs to be the memorylist_id
// //   const subject = document.querySelector('#subject');
// //   const positionSelect = document.querySelector('#position');
// //   subject.insertAdjacentHTML(positionSelect.value, '<strong>inserted text</strong>');
// // });
