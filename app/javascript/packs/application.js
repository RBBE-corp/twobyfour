// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { filesPlayer } from '../components/files_player';
import { playPause } from '../components/composition_player';
import { stopButtonClick } from '../components/composition_stop_player';
import { allowDrop, drag, drop } from '../components/draggable_card';
import { savedCards } from '../components/draggable_card_save';
import { sortable } from '../components/composition_new';
// document.addEventListener('turbolinks:load', () => {
// }
import { flashcardCategoryDropdown } from '../components/flashcard_category_dropdown';
import { karaokePlayer } from '../components/karaoke';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const sortablepage = document.querySelector('.master-box-memory-list');
  if (sortablepage) {
    sortable();
  }

  const audio = document.querySelector('.audio-mother-box');
  if ( audio ) {
    filesPlayer();
    const player = document.querySelector('.player');
    // const stopButton = document.querySelector('.stop-player');
    if (player) {
      player.addEventListener('click', (e) => {
        playPause(player)
      });
      stopButtonClick();
    }
    // if (stopButton) {
    // }
    const recorder = document.querySelector('.recorder');
    if (recorder) {
      recorder.addEventListener('click', karaokePlayer);
    }

  }

  // Audio Sampler on Composition New
  // const sampler = document.querySelector('.composition-master-container');
  // if (sampler) {
  const playButtons = document.querySelectorAll('.play-button');
    playButtons.forEach(playButton => {
        playButton.addEventListener('click', (event) => {
          event.preventDefault();
          var instrumental = event.currentTarget.id;
          var audio = event.path[1].children[1].currentSrc
          console.log(event);
          // query selector here for the audio tag
          // selector audio.playing/ audio.pause or paused
          //toggle for both
          new Audio(audio).play()
          console.log("You clicked play button");
      });
    // const stopButton = document.querySelector('.stop-player');
    });


  const submitButton = document.querySelector('.submit-memory-list');
  if (submitButton) {
    console.log('inside submit button');
    submitButton.addEventListener('click', (event) => {
      event.preventDefault();
      savedCards();
    });
  }
  window.allowDrop = allowDrop
  window.drag = drag
  window.drop = drop
  // window is a global object
    // check if the audio is playing

  // if it is playing, stop it.
  // flashcardCategoryDropdown();
});

import "controllers"
