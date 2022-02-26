const stopPlayer = () => {
  const subtitles = document.querySelector(".composition-subtitle-list");
  const instrumental = document.querySelector('#instrumental');
  const sound = document.querySelectorAll(".audios");
  const player = document.querySelector('.player');  
  if (player.dataset.status == "playing") {
    player.dataset.status = "paused";
    // player.textContent = "Paused";
    player.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
    instrumental.pause();
    sound.forEach((sou) => {
        sou.pause();
    });
  }
  // location.href = `#${sound[0].dataset.id}`;
  instrumental.dataset.order = 0;
  instrumental.currentTime = 0;
  player.style.color = 'initial';
  subtitles.scrollLeft = document.getElementById(`${sound[0].dataset.id}`).offsetLeft;

}

export const stopButtonClick = () => {
  const stopButton = document.querySelector('.stop-player');  
  stopButton.addEventListener('click', ()=> {
    stopPlayer();
  });
}