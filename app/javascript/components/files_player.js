var audiosprite = require('audiosprite')

export const filesPlayer = () =>{ 
  const player = document.querySelector('.player');
  const audio = document.querySelector('audio');
  const children = audio.children;
  const sound = [];

  // instrumental 
  const instrumental = new Audio();
  instrumental.loop = true;
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


  const playPause = () => {
    if (player.dataset.status == "paused") {
      player.dataset.status = "playing";
      player.textContent = "Playing..";
      instrumental.play();
      let index = 0;
      console.log(sound.length);
      const audioPlayer = (index) => {
        let audio = sound[index];
        audio.play();
        audio.onended = function () {
          console.log(index);
          if (index < sound.length-1 ) {
            index++;
          } else if (index == sound.length - 1) {
            index = 0;
            console.log(index)
          }
          audioPlayer(index);
        };
      };
      audioPlayer(index);
      
      console.log("instrumental played");
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
      sound.forEach((sou) => {
         sou.pause();
      });
    }
  }
  player.addEventListener('click', playPause);
}