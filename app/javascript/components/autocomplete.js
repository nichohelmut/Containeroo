function onPlaceChanged() {
    const place = this.getPlace();

    const containerAddress = document.getElementById('container_address');

    const userAddress = document.getElementById('user_address');
}

document.addEventListener("DOMContentLoaded", function() {
    const containerAddress = document.getElementById('container_address');

    if (containerAddress) {
      const autocomplete = new google.maps.places.Autocomplete(containerAddress, {types: ['geocode']});
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(containerAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

document.addEventListener("DOMContentLoaded", function() {
    const userAddress = document.getElementById('user_address');

    if (userAddress) {
      const autocomplete = new google.maps.places.Autocomplete(userAddress, {types: ['geocode']});
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(userAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

export {onPlaceChanged}
