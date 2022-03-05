export const flashcardCategoryDropdown = () => {
  const flashcards = document.querySelectorAll(".dropdown-item")
  // document.addEventListener("click", changeCategory);

  flashcards.forEach(flashcard => {
    flashcard.addEventListener("click", changeCategory);
  })

  // var e = document.getElementById("category-dropdown");
  // var strUser = e.value;
  // console.log(strUser);
}

// add onchange function
const changeCategory = (e) => {
  e.preventDefault();
  console.log("inside change category");
  console.log(e.currentTarget.id);
  var flashcard_category = e.currentTarget.id
  // document.getElementById("dropdown-category");
  // console.log(flashcard_category);
  var flashcards = document.querySelectorAll(".flashcard-not-selected");
  // var selectedCards = document.getElementsByClassName("memory-list-card");
  flashcards.forEach(flashcard => {
    console.log(flashcard.className);
    console.log(flashcard_category);
    if (!flashcard.className.includes("memory-list-card")) {
        if (flashcard_category == "all") {
          flashcard.classList.remove("d-none");
        }
        else if (flashcard.className.includes(flashcard_category)) {
          if (flashcard.className.includes("d-none")) {
            flashcard.classList.remove("d-none");
          }
        } else if (!flashcard.className.includes("d-none")) {
          flashcard.classList.add("d-none");
        }
    }
  });
}

$(function () {

  $(".dropdown-menu").on('click', 'a', function () {
    $(".btn:first-child").text($(this).text());
    $(".btn:first-child").val($(this).text());
  });

});

// changing the dropdown will give access to a selected value
// https://stackoverflow.com/questions/1085801/get-selected-value-in-dropdown-list-using-javascript
// value will loop through flashcard categories
// check each if the value selected and flashcard is equal
// if they are the same then display (do nothing)
// if they are not equal then hide (change the css style)

// find all the card-flashcard querySelectorAll
// already have the ID
// querySelectorAll for card category
// display hidden

// add a class and remove a class when moving cards to memory box
