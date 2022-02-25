
// pause for js since it doesnot have ruby equivalent of sleep. and I don't know how to create white sound of specific length;
function pause(milliseconds) {
  var dt = new Date();
  while ((new Date()) - dt <= milliseconds) { /* Do nothing */ }
}

export const playPause = (player) => {
  // retrieving audios and instrumental
  const instrumental = document.getElementById("instrumental");
  const sound = document.querySelectorAll(".audios");
  if (player.dataset.status == "paused") {
    player.dataset.status = "playing";
    player.textContent = "Playing..";
    instrumental.play();
    let index = parseInt(instrumental.dataset.order);
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
        instrumental.dataset.order = index;
        pause(1316);
        audioPlayer(index)
      };
    };
    audioPlayer(index)
  } else {
    player.dataset.status = "paused";
    player.textContent = "Paused";
    instrumental.pause();
    sound.forEach((sou) => {
        sou.pause();
    });
  }
}
