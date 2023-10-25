const removediv = document.querySelectorAll(".close");

  // Add a click event listener to each "x" icon
  removediv.forEach(function(button) {
    button.addEventListener("click", function() {
      // Remove the parent <div> element when the "x" icon is clicked
      button.parentNode.remove();
    });
  });