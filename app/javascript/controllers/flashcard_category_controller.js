import { Controller } from "stimulus"
// import Dropdown from "stimulus-dropdown"

export default class extends Controller {
  static targets = ["toggleable"]

  // toggle function will be here
  toggle(event) {
    // console.log(this.toggleableTarget)
    console.log(event)
    // console.log(event.currentTarget)
    // console.log(event.currentTarget.selectedOptions)
  }
}

// export default class extends Controller {

//   // static targets = [""]

//   connect() {
//     console.log("Hello, Stimulus", this.element);
//   }
// }

// export default class extends Dropdown {
//   connect() {
//     super.connect()
//     console.log("Do what you want here.")
//   }

//   toggle(event) {
//     super.toggle()
//   }

//   hide(event) {
//     super.hide(event)
//   }
// }
