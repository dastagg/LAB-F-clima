import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {

  late final double? latitude;
  late final double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (e) {
      debugPrint(e.toString());
    }
  }
}