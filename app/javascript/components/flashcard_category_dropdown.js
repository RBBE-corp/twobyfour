export const flashcardCategoryDropdown = () => {
  document.addEventListener("click", changeCategory);

  var e = document.getElementById("category-dropdown");
  var strUser = e.value;
  console.log(strUser);
}

// add onchange function
const changeCategory = () => {
  console.log("inside change category");
  const flashcard_category = document.getElementsByClassName("dropdown-menu");
}

// changing the dropdown will give access to a selected value
// https://stackoverflow.com/questions/1085801/get-selected-value-in-dropdown-list-using-javascript
// value will loop through flashcard categories
// check each if the value selected and flashcard is equal
// if they are the same then display (do nothing)
// if they are not equal then hide (change the css style)
