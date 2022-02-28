export const startOver = (instrumental, player, subtitles, firstSoundId) => {
  instrumental.dataset.order = 0;
  instrumental.pause();
  player.dataset.status = "paused";
  instrumental.currentTime = 0;
  player.style.color = 'initial';
  player.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
  subtitles.scrollLeft = document.getElementById(firstSoundId).offsetLeft;
}

const stopPlayer = () => {
  const subtitles = document.querySelector(".composition-subtitle-list");
  const instrumental = document.querySelector('#instrumental');
  const sound = document.querySelectorAll(".audios");
  const player = document.querySelector('.player');  
  if (player.dataset.status == "playing") {
    sound.forEach((sou) => {
        sou.pause();
    });
  }
  // location.href = `#${sound[0].dataset.id}`;
  startOver(instrumental, player, subtitles, sound[0].dataset.id);
}

export const stopButtonClick = () => {
  const stopButton = document.querySelector('.stop-player');  
  stopButton.addEventListener('click', ()=> {
    stopPlayer();
  });
}