function onPlaceChanged() {
  var place = this.getPlace();

  var containerAddress = document.getElementById('container_address');

  var userAddress = document.getElementById('user_address');
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

document.addEventListener("DOMContentLoaded", function() {
  var userAddress = document.getElementById('user_address');

  if (userAddress) {
    var autocomplete = new google.maps.places.Autocomplete(userAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(userAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

export {onPlaceChanged}
