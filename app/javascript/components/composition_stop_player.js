const stopPlayer = () => {
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
  instrumental.dataset.order = 0;
  instrumental.currentTime = 0;
  player.style.color = 'initial';
}

export const stopButtonClick = () => {
  const stopButton = document.querySelector('.stop-player');  
  stopButton.addEventListener('click', ()=> {
    stopPlayer();
  });
}