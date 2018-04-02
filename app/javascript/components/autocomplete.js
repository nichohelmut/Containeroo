function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var containerAddress = document.getElementById("address");

    if (containerAddress) {
      var autocomplete = new google.maps.places.Autocomplete(containerAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(containerAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}
// debugger
export {autocomplete};

