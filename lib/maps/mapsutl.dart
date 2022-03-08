import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class MApUtils {
  MApUtils._();

  static void launchMapFromSourceToDestination(
      sourceLat, sourceLng, destinationLat, destinationLng) async {
    String mapOptions = [
      'saddr=$sourceLat, $sourceLng',
      'daddr=$destinationLat,$destinationLng',
      'dir_action=navigate'
    ].join('&');

    final mapUrl = 'https://www.google.com/maps?$mapOptions';

    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      throw "could not launch $mapUrl";
    }
  }
}
