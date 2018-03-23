// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <input data-action="keyup->hello#greet" data-target="hello.name" type="text">
//   <span data-target="hello.output"></span>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  greet() {
    if (this.nameTarget.value) {
      this.outputTarget.textContent = `Hello, ${this.nameTarget.value}!`;
    } else {
      this.outputTarget.textContent = "";
    }
  }
}
