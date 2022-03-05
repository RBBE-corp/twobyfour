import { pause } from "./composition_player";

// import * as flacFactory from 'libflacjs';
// const Flac = flacFactory();

// import { Encoder } from 'libflacjs/lib/encoder';

const karaokePlayer = () => {
  navigator.mediaDevices.getUserMedia({ audio: true })
.then(stream => {
  const subtitles = document.querySelector(".composition-subtitle-list");
  const instrumental = document.getElementById("instrumental");
  const sound = document.querySelectorAll(".audios");
  const mediaRecorder = new MediaRecorder(stream);
  mediaRecorder.addEventListener("stop", () => {
    const audioBlob = new Blob(audioChunks, { 'type' : 'audio/wav; codecs=MS_PCM' });
    const audioUrl = URL.createObjectURL(audioBlob);
    // const audio = new Audio(audioUrl);
    const audio = document.createElement('audio');
    audio.src = audioUrl
    audio.controls = true;
    audio.dataset.type = audioBlob
    // resume.innerHTML += audio
    document.body.appendChild(audio);
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    // const data = new Int32Array(audioBlob);
    const formData = new FormData()
    formData.append("blob", audioBlob)
    console.log(audioBlob);
    fetch("/checker", {
      method: "post",
      headers: {'X-CSRF-Token': csrfToken},
      body: formData
      });
    // console.log("audioBlob buffer " + audioBlob.arrayBuffer())
    // audioBlob.arrayBuffer().then(arrayBuffer => {
      // Do something with arrayBuffer
      // console.log(arrayBuffer);
    // });
  });
  const audioChunks = [];
  mediaRecorder.addEventListener("dataavailable", event => {
    audioChunks.push(event.data);
  });

  instrumental.play();
  let index = parseInt(instrumental.dataset.order);
  const audioPlayer = (index) => {
    let audio = sound[index];
    if ((mediaRecorder.state == "paused") && (index % 2 == 1)) {
      audio.volume = 0;
      mediaRecorder.resume();
    } else if (index == 1) {
      audio.volume = 0;
      mediaRecorder.start();  
    } else if ((mediaRecorder.state == "recording") && (index % 2 == 0)) {
      audio.volume = .8;
      mediaRecorder.pause();
    }
    console.log(audio.offsetLeft)
    subtitles.scrollLeft = document.getElementById(`${audio.dataset.id}`).offsetLeft;
    // location.href = `#${audio.dataset.id}`;
    audio.play();
    audio.onended = function () {
      if (index < sound.length-1 ) {
        index++;
      } else if (index == sound.length - 1) {
        instrumental.loop = false;
        instrumental.pause();
        mediaRecorder.stop();
        index = 0;
        instrumental.currentTime = 0;  
        return
      }
      subtitles.scrollLeft = document.getElementById(`${audio.dataset.id}`).offsetLeft;
      instrumental.dataset.order = index;
      pause(1316);
      audioPlayer(index)
    };
  };
  audioPlayer(index)
  });
}

export { karaokePlayer };