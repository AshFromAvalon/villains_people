import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/thomas-le-bihan/ckhp0jfxi2chi19qqanap7jrf'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const userPic = document.createElement('div');
      userPic.className = 'marker';
      userPic.style.backgroundImage = `url('${marker.image_url}')`;
      userPic.style.backgroundSize = 'contain';
      userPic.style.width = '50px';
      userPic.style.height = '50px';
      userPic.style.borderRadius = '50%';
      userPic.style.border = '1px solid #bca664';
      userPic.style.boxShadow = "0px 0px 20px #F44336";

      new mapboxgl.Marker(userPic)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
