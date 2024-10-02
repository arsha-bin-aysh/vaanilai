import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {}
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> requestPermission() async {
    final permission = Permission.location;

    if (await permission.isDenied) {
      await permission.request();
    }
  }

  Future<bool> checkPermissionStatus() async {
    final permission = Permission.location;

    return await permission.status.isGranted;
  }

  Future<bool> shouldShowRequestRationale() async {
    final permission = Permission.location;

    return await permission.shouldShowRequestRationale;
  }
}
