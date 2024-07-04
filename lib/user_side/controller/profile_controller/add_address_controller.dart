import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  var currentPosition =
      LatLng(37.77483, -122.41942).obs; // Default to San Francisco
  var selectedPosition = LatLng(37.77483, -122.41942).obs;
  late GoogleMapController mapController;

  @override
  void onInit() {
    super.onInit();
    _getUserLocation();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _moveToCurrentLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition.value = LatLng(position.latitude, position.longitude);
    selectedPosition.value = LatLng(position.latitude, position.longitude);
    _moveToCurrentLocation();
  }

  void _moveToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newLatLng(currentPosition.value));
  }

  void onMapTap(LatLng position) {
    selectedPosition.value = position;
  }
}
