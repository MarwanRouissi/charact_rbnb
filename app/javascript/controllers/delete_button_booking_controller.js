import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="delete-button-booking"
export default class extends Controller {
	static targets = ["deleteBtn"];
	connect() {
		console.log("delete connected");
	}

	preventPropagation(event) {
		event.stopPropagation();
		const isConfirmed = window.confirm(
			"Are you sure you want to delete this booking?",
		);
		if (!isConfirmed) {
			event.preventDefault();
		}
	}
}
