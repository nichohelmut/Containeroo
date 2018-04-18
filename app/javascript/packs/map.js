import GMaps from 'gmaps/gmaps';
import { autocomplete } from 'components/autocomplete';


// CONTAINER MARKERS
// var icon = {
//     urlicon: "https://image.flaticon.com/icons/svg/603/603401.svg", // url
//     // url: "https://image.flaticon.com/icons/svg/10/10522.svg",
//     scaledSize: new google.maps.Size(40, 40), // scaled size
//     origin: new google.maps.Point(0,0), // origin
//     anchor: new google.maps.Point(0, 0) // anchor
//   };

//   var user_icon = {
//     // url: "https://image.flaticon.com/icons/svg/603/603401.svg", // url
//     urlicon: "https://image.flaticon.com/icons/svg/10/10522.svg",
//     scaledSize: new google.maps.Size(40, 40), // scaled size
//     origin: new google.maps.Point(0,0), // origin
//     anchor: new google.maps.Point(0, 0) // anchor
//   };

  const mapElement = document.getElementById('map');
  // console.debug(mapElement);



if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });


  const markers = JSON.parse(mapElement.dataset.markers);
   map.addMarkers(markers);
   // map.addMarker(icon);

map.markers.forEach(function(marker) {
  // map.addMarker({
  //   lng: marker.lng,
  //   lat: marker.lat,
  //   icon: icon,
  // });
  marker.addListener('click', function() {
      //standard command to open the url according to the markers url for example: url: "/locals/events/1"
    window.location.href = marker.url;
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
// };

// if (mapElement) { // don't try to build a map if there's no div#map to inject in
//   const map = new GMaps({ el: '#map', lat: 0, lng: 0 });

  const usermarkers = JSON.parse(mapElement.dataset.usermarkers);
    map.addMarkers(usermarkers);
  console.log(usermarkers);

  map.usermarkers.forEach(function(usermarker) {
    // map.addMarker({
    //   lng: usermarkerr.lng,
    //   lat: usermarkerr.lat,
    //   icon: user_icon,
    // });
    usermarker.addListener('click', function() {
      //standard command to open the url according to the usermarkers url for example: url: "/locals/events/1"
    window.location.href = usermarker.url;
  });
  });

  if (usermarkers.length === 0) {
    map.setZoom(2);
  } else if (usermarkers.length === 1) {
    map.setCenter(usermarkers[0].lat, usermarkers[0].lng);
    //console.log(map.setZoom(14));
    map.setZoom(14 );
  } else {
    map.fitLatLngBounds(usermarkers);
  }
};







