import 'package:leaflet/leaflet.dart';
import 'package:leaflet_fullscreen/leaflet_fullscreen.dart';

main() {
  var map = new LeafletMap.selector('map', new MapOptions()
    ..center = new LatLng(25.6586, -80.3568)
    ..zoom = 13
    ..layers = [osmLayer]);

  var fs = new Fullscreen();
  map.addControl(fs);

  map.on('fullscreenchange').listen((_) {
    if (fs.isFullscreen()) {
      print('entered fullscreen');
    } else {
      print('exited fullscreen');
    }
  });
}
