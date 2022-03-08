// pause for js since it doesnot have ruby equivalent of sleep. and I don't know how to create white sound of specific length;
import { pause } from "./composition_player";
import { lightUpTheScore } from "./karaoke_score_popup.js";


const karaokePlayer = (event) => {
  event.currentTarget.style.color = "red";
  event.currentTarget.style.cursor = "wait";

  const audioChunks = [];
  const formData = new FormData()

  // Asking user for access to microphone.
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

      // const audioUrl = URL.createObjectURL(audioBlob);
      
      /* Use either one of below 2 */
      // // const audio = new Audio(audioUrl);
      // const audio = document.createElement('audio');

      // audio.src = audioUrl;
      // audio.controls = true;
      // audio.dataset.type = audioBlob
      // document.body.appendChild(audio);
      
      // formData.append("blob", audioBlob)

      // Making file from audio . Don't need it for now.
      // let file = new File([audioBlob], 'recording.flac');
      // blobs.push(file);
      
      // appending Multiple files  
      formData.append('files[]', audioBlob);
      console.log(...formData);

      // fetch if only last recording
      if (instrumental.dataset.order == "last") {

        // resetting button and audio to start.
        const recorder = document.querySelector('.recorder');
        recorder.style.color = "initial";
        recorder.style.cursor = "pointer";
        instrumental.dataset.order = 0;
        // Rails csrfToken
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        // console.log(...formData);
        
        // Starting showing karaoke score box and loading effect.
        const scoreContainer = document.querySelector('.karaoke-score-container');
        scoreContainer.classList.remove('score-hidden');
        scoreContainer.classList.add('score-show');
        fetch(`${window.location.href}`, {
          method: "post",
          headers: {'X-CSRF-Token': csrfToken},
          body: formData
        }).then(response => response.json())
        .then(data => {
          console.log(data);
          // do all the appending
          lightUpTheScore(data);
        });
      }
    }, false);
  }

  // Made function out of event Listener 'stop' for mediaRecorder. No need to do this in this case.
  onStop(mediaRecorder);
  const dataAvailable = (mediaRec) => {
    mediaRec.addEventListener("dataavailable", (event) => {
      audioChunks.push(event.data);
    });
  }
  
  // Made function out of event Listener 'dataavailable' for mediaRecorder. No need to do this in this case.
  dataAvailable(mediaRecorder);

  instrumental.play();
  let index = parseInt(instrumental.dataset.order);
  // subtitles.style.scrollBehavior = 'auto';
  const audioPlayer = (index) => {

    //Check with team about below pause line. 
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
        console.log(`starting ${index}`);
        // pause(1000);
        console.log("----------------------------------------------------------------");

      }
    }
    
    // event listener for audio. Fires up after audio finishes playing.
    audio.onended = function () {
      if (mediaRecorder.state == "inactive") {
        pause(1000);
      }
      // Checker if audio is the last one or not.
      if (index < sound.length - 1 ) {
        index++;
        subtitles.scrollLeft = document.getElementById(`${sound[index].dataset.id}`).offsetLeft;
      } else {
        instrumental.loop = false;
        index = 0;
        subtitles.scrollLeft = document.getElementById(`${sound[index].dataset.id}`).offsetLeft;  
        if (mediaRecorder.state == "recording") {
          pause(1000);
          
          // resetting everything and stopping the recorder.
          instrumental.pause();
          instrumental.dataset.order = "last"
          instrumental.currentTime = 0;
          mediaRecorder.stop();
          console.log("----------------------------------------------------------------");
          return
        }
      }
      // Don't need this. Just for reference.
      // pause(1000);
      // pause(1316);

      // Runs if not end
      instrumental.dataset.order = index;
      audioPlayer(index, mediaRecorder)
    };

    // playing the audio
    audio.play();
  };

  // first call for audioPlayer
  audioPlayer(index, mediaRecorder)
  });
}

export { karaokePlayer };