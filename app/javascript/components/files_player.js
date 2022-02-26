export const filesPlayer = () =>{
  const player = document.querySelector('.player');
  const audio = document.querySelector('audio');
  const children = audio.children;
  const sound = [];
  const audioBox = document.createElement('div');
  audioBox.classList.add("audio-box");
 
  const instrumental = new Audio();
  instrumental.loop = true;
  instrumental.id = "instrumental";
  instrumental.dataset.order = 0;
  //changes the instrumental in the wineow only
  window.current_audio = instrumental;

  // creating instrumental from first source
  let srcl = document.createElement('source');
  srcl.type = children[0].type;
  srcl.src = children[0].src;
  instrumental.appendChild(srcl);
  // instrumental appended to audioBox
  audioBox.appendChild(instrumental);
  // creating all audio file except instrumental
  for (let i = 1; i < children.length; i++) {
    sound[i - 1] = new Audio();
    let srcl = document.createElement('source');
    srcl.type = children[i].type;
    srcl.src = children[i].src
    sound[i - 1].appendChild(srcl);
    sound[i - 1].dataset.id = children[i].id; 
    sound[i - 1].classList.add('audios');
    // audios appended to audioBox
    audioBox.appendChild(sound[i - 1]);
  }
  // finding motherBox (initial audio location)
  const motherBox = document.querySelector('.audio-mother-box');
  // Clearing motherBox and appending new audio
  motherBox.textContent = "";
  motherBox.appendChild(audioBox);
}
