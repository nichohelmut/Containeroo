import GMaps from 'gmaps/gmaps';
import { autocomplete } from 'components/autocomplete';

var icon = {
    url: "https://image.flaticon.com/icons/svg/603/603401.svg", // url
    scaledSize: new google.maps.Size(40, 40), // scaled size
    origin: new google.maps.Point(0,0), // origin
    anchor: new google.maps.Point(0, 0) // anchor
};

const mapElement = document.getElementById('map');
console.debug(mapElement);
const markers = JSON.parse(mapElement.dataset.markers);
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  console.log(markers);
  markers.forEach(function(marker) {
    map.addMarker({
      lng: marker.lng,
      lat: marker.lat,
      icon: icon
    })
  });

  // var infoWindow = new google.maps.infoWindow({
  //   content: "<h1> Hello</h1>"
  // });

  // markers.addEventListener("click", function() {
  //   infoWindow.open(map, markers);
  // })



  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    //console.log(map.setZoom(14));
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

autocomplete();

