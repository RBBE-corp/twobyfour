export const filesPlayer = () =>{
  const player = document.querySelector('.player');
  console.log(player);
  console.log("working");
  const audio = document.querySelector('audio');
  const children = audio.children;
  console.log(children);
  const sound = [];
  for (let i = 0; i < children.length; i++) {
    console.log(i);
    sound[i] = new Audio();
    sound[i].loop = true;
    let srcl = document.createElement('source');
    srcl.type = children[i].type;
    console.log(children[i].src);
    srcl.src = children[i].src;
    console.log(srcl.src);
    sound[i].appendChild(srcl);
    console.log(sound[i]);
    // sound
  }
  const playPause = () => {
    if (player.dataset.status == "paused") {
      player.dataset.status = "playing";
      player.textContent = "Playing..";
      sound.forEach((sou) => {
        sou.play();
      });
    } else {
      player.dataset.status = "paused";
      player.textContent = "Paused";
      sound.forEach((sou) => {
         sou.pause();
      });
    }
  }
  player.addEventListener('click', playPause);
}
