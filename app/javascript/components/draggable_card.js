function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev, el) {
  // console.log(ev);
  // console.log(el.id);
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  el.appendChild(document.getElementById(data));
  if (el.id == "MemoryListFlashcardsBox") {
    // if the card is going into the memory list, remove the class
    document.getElementById(data).classList.remove("flashcard-not-selected");
  } else {
    // if the card is going out of the memory list, add a class
    document.getElementById(data).classList.add("flashcard-not-selected");
  }
}

export { allowDrop, drag, drop }
