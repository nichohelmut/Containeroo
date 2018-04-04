function onPlaceChanged() {
  var place = this.getPlace();

  var containerAddress = document.getElementById('container_address');
  containerAddress.blur();
}

document.addEventListener("DOMContentLoaded", function() {
  var containerAddress = document.getElementById('container_address');

  if (containerAddress) {
    var autocomplete = new google.maps.places.Autocomplete(containerAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(containerAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

export {onPlaceChanged}
