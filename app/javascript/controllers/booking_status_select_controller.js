import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booking-status-select"
export default class extends Controller {
	static targets = ["selectList", "submit"];

	connect() {
		console.log("booking-status-select connected!");

		this.display;
		this.submitStatus;
	}

	display() {
		console.log("clicked");
		this.selectListTarget.classList.toggle("d-none");
	}

	submitStatus(event) {
		console.log("change");
		event.preventDefault;
		this.submitTarget.requestSubmit();
		this.selectListTarget.classList.toggle("d-none");
	}
}
