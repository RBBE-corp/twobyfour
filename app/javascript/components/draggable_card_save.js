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
  let memoryListNameInput = memoryListToSave.querySelector("input[type='text']");
  // console.log(memoryListNameInput);
  formData.append(memoryListNameInput.name, memoryListNameInput.value);
  // console.log(...formData);
  // to see the inside of form data
  // Patch request
  // console.log(memoryListToSave.action);
  fetch(memoryListToSave.action, {
    method: 'POST',
    // method: 'PATCH', THIS IS FOR WHEN WE WANT TO EDIT LATER
    // accept the JSON file, Token is rails authenticity,
    // headers: { "Accept": "application/JSON", 'X-CSRF-Token': csrfToken() },
    headers: { 'X-CSRF-Token': csrfToken() },
    body: formData
  }).then(response => {
    console.log(response)
    if (response.redirected) {
        window.location.href = response.url
    } else {
      return response.json();
    }
  })
  .then(data =>{    
      console.log(data);
      document.querySelector(".error-messages.text-center").innerHTML = `Memory list name ${data.name[0]}`;
  });
};
