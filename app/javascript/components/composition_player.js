import {startOver} from '../components/composition_stop_player'
// pause for js since it doesnot have ruby equivalent of sleep. and I don't know how to create white sound of specific length;
function pause(milliseconds) {
  var dt = new Date();
  while ((new Date()) - dt <= milliseconds) { /* Do nothing */ }
}

const playPause = (player) => {
  // retrieving audios and instrumental
  const subtitles = document.querySelector(".composition-subtitle-list");
  const instrumental = document.getElementById("instrumental");
  const sound = document.querySelectorAll(".audios");
  if (player.dataset.status == "paused") {
    player.dataset.status = "playing";
    player.innerHTML = '<i class="fa fa-pause" aria-hidden="true"></i>';
    player.style.color = 'red';
    instrumental.play();
    let index = parseInt(instrumental.dataset.order);
    const audioPlayer = (index) => {
      if (index == 0) {
        pause(658);
      }
      let audio = sound[index];
      console.log(audio.offsetLeft)
      subtitles.scrollLeft = document.getElementById(`${audio.dataset.id}`).offsetLeft;
      // location.href = `#${audio.dataset.id}`;
      audio.play();
      audio.onended = function () {
        if (index < sound.length-1 ) {
          index++;
        } else if ((index == sound.length - 1) && loop.checked) {
          index = 0;
          // subtitles.scrollLeft = document.getElementById(`${sound[0].dataset.id}`).offsetLeft;
          // console.log(audio.offsetLeft);
        } else {
          startOver(instrumental, player, subtitles, sound[0].dataset.id);
          return;
        }
        subtitles.scrollLeft = document.getElementById(`${audio.dataset.id}`).offsetLeft;
        instrumental.dataset.order = index;
        pause(1316);
        audioPlayer(index)
      };
    };
    audioPlayer(index)
  } else {
    player.dataset.status = "paused";
    // player.textContent = "Paused";
    // location.href = "";
    player.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
    instrumental.pause();
    sound.forEach((sou) => {
        sou.pause();
    });
  }
}

export { pause, playPause }