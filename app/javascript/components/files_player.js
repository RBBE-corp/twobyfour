export const filesPlayer = () =>{ 
  const player = document.querySelector('.player');
  console.log(player);
  const working = () => {console.log("working");
  const audio = document.querySelector('audio');
  const children = audio.children;
  console.log(children);
  const sound = [];
  for (let i = 0; i < children.length; i++) {
    console.log(i);
    sound[i] = new Audio();
    let srcl = document.createElement('source');
    srcl.type = children[i].type;
    console.log(children[i].src);
    srcl.src = children[i].src;
    console.log(srcl.src);
    sound[i].appendChild(srcl);
    console.log(sound[i]);
    // sound
  }
  console.log(sound);
  sound[0].play();
  sound.forEach((sou) => {
    console.log(sou);
    sou.play();
  })}
  player.addEventListener('click', working);
}