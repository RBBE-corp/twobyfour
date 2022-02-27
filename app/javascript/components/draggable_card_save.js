import { csrfToken } from "@rails/ujs";
// import fetch from 'unfetch';

export const savedCards = () => {
  // get the simple form
  const memoryListToSave = document.querySelector('.memory-list-form');
  // get the container holding all the flashcards for the memory list (parent div)
  const memoryListFlashcardsToSave = document.querySelector('#MemoryListFlashcardsBox');
  const FlashcardsHolder = memoryListFlashcardsToSave.children;
  // console.log(memoryListFlashcardsToSave);
  // console.log(FlashcardsHolder);
  let FlashcardsIDHolder = [];
  for (let i=0; i<FlashcardsHolder.length; i++) {
    let child = FlashcardsHolder[i];
    FlashcardsIDHolder.push(child.dataset.id);
    // console.log(child.dataset.id);
  };
  // console.log(FlashcardsIDHolder);
  let formData = new FormData();
  formData.append('FlashcardID', JSON.stringify(FlashcardsIDHolder));
  // console.log(...formData);
  // to see the inside of form data
  // Patch request
  console.log(memoryListToSave.action);
  fetch(memoryListToSave.action, {
    method: 'PATCH',
    headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
    // accept the JSON file, Token is rails authenticity,
    body: formData
  })
};
