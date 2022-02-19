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
import { filesPlayer } from '../components/files_player';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { RangeSliderController } from '..components/range_slider';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const audio = document.querySelector('audio');
  if ( audio ) {
    filesPlayer();
  }
  // const volumeChange = document.querySelector('');
  // if (volumeChange) {
  //   RangeSliderController();
  // }

});


import "controllers"
