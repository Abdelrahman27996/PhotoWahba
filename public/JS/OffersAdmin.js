document.addEventListener("DOMContentLoaded", function () {
    const openFormBtn = document.getElementById("openFormBtn");
    const offerForm = document.getElementById("offerForm");
    const closeFormBtn = document.getElementById("closeFormBtn");
    const saveOfferBtn = document.getElementById("saveOfferBtn");

    // Initialize the offer number
    let offerNumber = 1;

    openFormBtn.addEventListener("click", () => {
        offerForm.style.display = "block";
    });

    closeFormBtn.addEventListener("click", () => {
        offerForm.style.display = "none";
    });

    saveOfferBtn.addEventListener("click", () => {
        // Get the input values
        const offerTitle = document.getElementById("offerTitle").value;

        // Create and display the offer inside the table
        const offerTableBody = document.getElementById("offerTableBody");
        const newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td class="offer-number">${offerNumber}</td>
            <td>${offerTitle}</td>
            <td><a href="#" class="edit-offer"><span class="glyphicon glyphicon-edit"></span></a></td>
            <td><a href="#" class="delete-offer"><span class="glyphicon glyphicon-trash"></span></a></td>
        `;
        offerTableBody.appendChild(newRow);

        // Clear the input field
        document.getElementById("offerTitle").value = "";
        
        offerForm.style.display = "none";


        // Increment the offer number
        offerNumber++;

        // Check if there are any offers in the table
        const offers = offerTableBody.querySelectorAll("tr");
        const noOffersText = document.getElementById("noOffersText");
        const icon = document.getElementById("icon");

        // If there are offers, hide the "No Offers" text and icon
        if (offers.length > 0) {
            noOffersText.style.display = "none";
            icon.style.display = "none";
        } else {
            // If no offers, display the "No Offers" text and icon
            noOffersText.style.display = "block";
            icon.style.display = "block";
        }
        
        // Attach event listeners for the dynamically created buttons
        newRow.querySelector(".delete-offer").addEventListener("click", () => {
            // Handle delete button click here
            newRow.remove(); // Remove the offer row
            updateOfferNumbers();
        });

        newRow.querySelector(".edit-offer").addEventListener("click", () => {
            // Handle edit button click here
            // You can access the corresponding offer data for editing
            const offerTitle = newRow.querySelector("td:nth-child(2)").textContent;
            // Implement your edit functionality here
            alert("COMING SOON!");

        });
        updateOfferNumbers();
    });

    // Function to update offer numbers
    function updateOfferNumbers() {
        const offerRows = offerTableBody.querySelectorAll("tr");
        offerRows.forEach((row, index) => {
            row.querySelector(".offer-number").textContent = index + 1;
        });
    }
});
    
