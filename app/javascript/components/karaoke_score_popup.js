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
    newContent +=  `<div class="word-container matched-${result.matched} side-by-side">
                      <div class="furigana-word word-box">
                        <div class="inner-furigana-word">
                          <div class="front-furigana">
                            ${result.english_word}
                          </div>
                          <div class="back-furigana">
                            ${result.japanese_word}
                          </div>
                        </div>
                      </div>
                      <i class="fas fa-arrows-alt-h"></i>
                      <div class="transcript-word word-box">
                        ${result.transcript}
                      </div>
                    </div>` ;
    console.log(wordsBox);
  });


  // replace the wordsBox's innerHtml with to result
  wordsBox.innerHTML = newContent;


  // updating score
  updateScore.innerHTML = `${data.score} / ${infoes.length}`

}
