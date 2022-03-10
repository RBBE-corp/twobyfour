export const lightUpTheScore = (data) => {
  const wordsBox = document.querySelector('.words-box');
  const updateScore = document.querySelector('.update-score');

  // loop through data.infoes
  const infoes = data.infoes;
  console.log(infoes);
  let newContent = "";
  // if info.matched if false , have red background
    // if info.matched is true , have green background
  infoes.forEach((result) => {
    newContent += `<div
      class="word-container side-by-side matched-${result.matched}">
                    <div class="transcript-word word-box">${result.english_word}</div>
                    <i class="fas fa-arrows-alt-h"></i>
                    <div class="furigana-word word-box">${result.transcript}</div>
                  </div>` ;
    console.log(wordsBox);
  });


  // replace the wordsBox's innerHtml with to result
  wordsBox.innerHTML = newContent;


  // updating score
  updateScore.innerHTML = `${data.score} / ${infoes.length}`

}
