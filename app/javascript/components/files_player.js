
export const filesPlayer = () =>{
  const player = document.querySelector('.player');
  const audio = document.querySelector('audio');
  const children = audio.children;
  const sound = [];

  // instrumental
  const instrumental = new Audio();
  instrumental.loop = true;
  //changes the instrumental in the wineow only
  window.current_audio = instrumental;

  let srcl = document.createElement('source');
  srcl.type = children[0].type;
  srcl.src = children[0].src;
  instrumental.appendChild(srcl);

  // all audio file except instrumental
  for (let i = 1; i < children.length; i++) {
    sound[i - 1] = new Audio();
    // sound[i - 1].loop = true;
    let srcl = document.createElement('source');
    srcl.type = children[i].type;
    srcl.src = children[i].src;
    sound[i - 1].appendChild(srcl);
    // sound
  }

  function pause(milliseconds) {
    var dt = new Date();
    while ((new Date()) - dt <= milliseconds) { /* Do nothing */ }
  }


  const playPause = () => {
    // find the sound

    // find the instrumental

    // pause/play
    // if it is paused, start


    // else if it is playing, pause
    let timeOutId = [];
    if (player.dataset.status == "paused") {
      player.dataset.status = "playing";
      player.textContent = "Playing..";
      instrumental.play();
      let index = 0;
      const audioPlayer = (index) => {
        if (index == 0) {
          pause(658);
        }
        let audio = sound[index];
        audio.play();
        audio.onended = function () {
          if (index < sound.length-1 ) {
            index++;
          } else if (index == sound.length - 1) {
            index = 0;
          };
          pause(1316);
          audioPlayer(index)
        };
      };
      audioPlayer(index)



      // for (let i = 0; i < sound.length; i++) {
      //   console.log(i);
      //   // if (i >= 1) {
      //     // return;
      //   // }
      //   sound[i].play();
      //   sound[i].onended = () => {
      //     next;
      //   }
      // }
    } else {
      player.dataset.status = "paused";
      player.textContent = "Paused";
      instrumental.pause();
      // console.log(timeOutId);
      // timeOutId.forEach((bob) => {
      //   clearTimeout(bob);
      // });
      sound.forEach((sou) => {
         sou.pause();
        //  clearTimeout();
      });
    }
  }
  player.addEventListener('click', playPause);
}
