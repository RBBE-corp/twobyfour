
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['range', 'play']

  connect() {
    console.log('Hello, Stimulus!')
  }

  updateValue(){
    window.current_audio.volume = this.rangeTarget.value
    console.log(window.current_audio)
  }

}
