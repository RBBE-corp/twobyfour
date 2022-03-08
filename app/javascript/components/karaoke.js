// import { pause } from "./composition_player";
import { lightUpTheScore } from "./karaoke_score_popup.js";
// pause for js since it doesnot have ruby equivalent of sleep. and I don't know how to create white sound of specific length;
function pause(milliseconds) {
  var dt = new Date();
  while ((new Date()) - dt <= milliseconds) { /* Do nothing */ }
}

const karaokePlayer = () => {
  const blobs = [];
  const audioChunks = [];
  const formData = new FormData()
  navigator.mediaDevices.getUserMedia({ audio: true })
.then(stream => {
  const subtitles = document.querySelector(".composition-subtitle-list");
  const instrumental = document.getElementById("instrumental");
  const sound = document.querySelectorAll(".audios");
  let mediaRecorder = new MediaRecorder(stream);
  function onStop(mediaRec) {
    mediaRec.addEventListener("stop", () => {
      console.log("stopping");
      const audioBlob = new Blob(audioChunks, { type: 'audio/flac' });
      // audioChunks = []; reseting length of audio to 0/blank
      audioChunks.length = 0;

      //Creating audio element appending to document 

      const audioUrl = URL.createObjectURL(audioBlob);
      // const audio = new Audio(audioUrl);
      const audio = document.createElement('audio');
      audio.src = audioUrl;
      audio.controls = true;
      audio.dataset.type = audioBlob
      document.body.appendChild(audio);
      
      // formData.append("blob", audioBlob)

      // Making file from audio . Don't need it right now.
      // let file = new File([audioBlob], 'recording.flac');
      // blobs.push(file);
      
      // Multiple files  
      formData.append('files[]', audioBlob);
      console.log(...formData);

      // fetch if only last recording
      if (instrumental.dataset.order == "last") {
        instrumental.dataset.order = 0;
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        console.log(...formData);
        // fetch(`${window.location.href}`, {
        //   method: "post",
        //   headers: {'X-CSRF-Token': csrfToken},
        //   body: formData
        // }).then(response => response.json())
        // .then(data => {
        //   console.log(data)
        //   lightUpTheScore(data);
        // });
      }
    }, false);
  }
  onStop(mediaRecorder);
  const dataAvailable = (mediaRec) => {
    mediaRec.addEventListener("dataavailable", (event) => {
      audioChunks.push(event.data);
    });
  }

  dataAvailable(mediaRecorder);

  instrumental.play();
  let index = parseInt(instrumental.dataset.order);
  // subtitles.style.scrollBehavior = 'auto';
  const audioPlayer = (index) => {
    // pause(1316)
    let audio = sound[index];
    // console.log("sliding huwaaaaaa waaaaaaa iiiiiiiiiiiiiii"); 

    console.log("----------------------------------------------------------------")
    if (index == 1) {
      // subtitles.style.scrollBehavior = 'auto';
      audio.volume = 0;
      mediaRecorder.start();
      // console.log(` first start${index}`)\
      console.log("recording start")  
      console.log("----------------------------------------------------------------")
      // pause(1000);
    }
    if (index > 1 ) {
      
      if ((mediaRecorder.state == "recording")) {
        // subtitles.style.scrollBehavior = 'auto';

        audio.volume = 1;
        // console.log(mediaRecorder.state)
        // pause(1000);
        console.log("recording stopped")  
        mediaRecorder.stop();
        console.log("----------------------------------------------------------------")

      } else if ((mediaRecorder.state == "inactive")) {
        subtitles.style.scrollBehavior = 'smooth';
        audio.volume = 0;
        mediaRecorder.start();
        console.log(`starting ${index}`)
        // pause(1000);
        console.log("----------------------------------------------------------------")

      }
    }
    // if (index < sound.length - 1) {
      //  }
      // location.href = `#${audio.dataset.id}`;
    audio.onended = function () {
      if (index < sound.length - 2) {
        subtitles.scrollLeft = document.getElementById(`${sound[index + 1].dataset.id}`).offsetLeft;
      } else {
        subtitles.scrollLeft = document.getElementById('last-flashcard').offsetLeft;
      }
      
      if (index < sound.length - 1 ) {
        index++;
      } else {
        instrumental.loop = false;
        // mediaRecorder.stop();
        index = 0;
        subtitles.scrollLeft = document.getElementById(`${sound[index].dataset.id}`).offsetLeft;  
        if ((mediaRecorder.state == "recording")) {
          pause(1000);
          // console.log(mediaRecorder.state)
          console.log(`stopping ${index}`)
          instrumental.pause();
          instrumental.dataset.order = "last"
          instrumental.currentTime = 0;
          mediaRecorder.stop();
          // lastFetch(fetcher);
          console.log("----------------------------------------------------------------")
          return
        }
      }
      
      // pause(1000);
      // pause(1316);
      
      instrumental.dataset.order = index;
      audioPlayer(index, mediaRecorder)
    };
    // if (mediaRecorder.state == "recording") pause(1000) ;

    audio.play();
    // subtitles.scrollLeft = document.getElementById(`${sound[index + 1].dataset.id}`).offsetLeft;
  };
  audioPlayer(index, mediaRecorder)
  });
}

export { karaokePlayer };