export const lightUpTheScore = (data) => {
  const wordsBox = document.querySelector('.words-box');
  const updateScore = document.querySelector('.update-score');
  
  console.log(scoreContainer);
  // Show the scoreContainer 
  

  // loop through data.infoes
  const infoes = data.infoes;
  let newContent = "";
  // if info.matched if false , have red background
    // if info.matched is true , have green background
  infoes.forEach((result) => {
      wordsBox.innerHTML += `<div
       class="word-container side-by-side matched-${result.matched}">
                      <div class="transcript-word word-box no-info">${result.word}</div>
                      <=>
                      <div class="furigana-word word-box no-info">${result.transcript}</div>
                    </div>` ;   
  });

  
  // replace the wordsBox's innerHtml with to result
  wordsBox.innerHTML = newContent;


  // updating score
  updateScore.innerHTML = `${data.score} / ${data.infoes.length}`

}