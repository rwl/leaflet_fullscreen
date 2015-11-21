library leaflet.fullscreen;

import 'dart:js';
import 'package:leaflet/leaflet.dart';

class Fullscreen implements Control {
  final JsObject control;

  factory Fullscreen({String position, String title, String fullscreenTitle}) {
    var config = {};
    if (position != null) config['position'] = position;
    if (title != null || fullscreenTitle != null) config['title'] = {};
    if (title != null) config['title']['false'] = title;
    if (fullscreenTitle != null) config['title']['true'] = fullscreenTitle;
    var _config = new JsObject.jsify(config);
    var control =
        new JsObject(context['L']['Control']['Fullscreen'], [_config]);
    return new Fullscreen._(control);
  }

  Fullscreen._(this.control);

  bool isFullscreen() {
    JsObject map = control['_map'];
    if (map == null) return false;
    return map.callMethod('isFullscreen');
  }

  void toggleFullscreen() {
    JsObject map = control['_map'];
    if (map == null) return;
    map.callMethod('toggleFullscreen');
  }
}
