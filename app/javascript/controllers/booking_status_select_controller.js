import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booking-status-select"
export default class extends Controller {
	static targets = ["selectList"];

	connect() {
		console.log("booking-status-select connected!");

		this.display;
	}

	display() {
		console.log("clicked");
		this.selectListTarget.classList.toggle("d-none");
	}
}
