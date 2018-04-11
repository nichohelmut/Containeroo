import GMaps from 'gmaps/gmaps';
import { autocomplete } from 'components/autocomplete';


// CONTAINER MARKERS
var icon = {
    url: "https://image.flaticon.com/icons/svg/603/603401.svg", // url
    // url: "https://image.flaticon.com/icons/svg/10/10522.svg",
    scaledSize: new google.maps.Size(40, 40), // scaled size
    origin: new google.maps.Point(0,0), // origin
    anchor: new google.maps.Point(0, 0) // anchor
};

var user_icon = {
    // url: "https://image.flaticon.com/icons/svg/603/603401.svg", // url
    url: "https://image.flaticon.com/icons/svg/10/10522.svg",
    scaledSize: new google.maps.Size(40, 40), // scaled size
    origin: new google.maps.Point(0,0), // origin
    anchor: new google.maps.Point(0, 0) // anchor
};

const mapElement = document.getElementById('map');
console.debug(mapElement);
const markers = JSON.parse(mapElement.dataset.markers);
const user_markers = JSON.parse(mapElement.dataset.user_markers)
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  console.log(markers);
  markers.forEach(function(marker) {
    map.addMarker({
      lng: marker.lng,
      lat: marker.lat,
      icon: icon,
    })
  });




  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    //console.log(map.setZoom(14));
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }




  console.log(user_markers);
  user_markers.forEach(function(marker) {
    map.addMarker({
      lng: marker.lng,
      lat: marker.lat,
      icon: user_icon,
    })
  });


  if (user_markers.length === 0) {
    map.setZoom(2);
  } else if (user_markers.length === 1) {
    map.setCenter(user_markers[0].lat, user_markers[0].lng);
    //console.log(map.setZoom(14));
    map.setZoom(14 );
  } else {
    map.fitLatLngBounds(user_markers);
  }

}


