import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/utils/constants_key.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final appData = GetStorage();
  RxBool isNoInternet = false.obs;
  TextEditingController searchController = TextEditingController();

  //location data
  RxBool locationLoader = false.obs;
  double? lat;
  double? lng;
  RxString currentPostCode = 'Set Location'.obs;
  var apiKey = Constants.googleMapsApiKey; // Google Maps Services Api key

  ///Get current location
  Future<void> getCurrentLocation(bool isFromSetLocation) async {
    try {
      if (!kIsWeb) {
        Future.delayed(const Duration(milliseconds: 200)).then((val) {
          locationLoader.value = true;
        });
      }

      // Check if location services are already enabled
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
      } else if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        locationLoader.value = false;

        if (!kIsWeb) {
          if (isFromSetLocation == true)
            ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
              SnackBar(
                content: TextButton(
                  child: Text(
                    "Alert! Location permission denied. Click here to open setting"
                        .tr,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Geolocator.openAppSettings();
                  },
                ),
              ),
            );
        }
        locationLoader.value = false;
      } else if (permission == LocationPermission.denied) {
        if (!kIsWeb) {
          if (isFromSetLocation == true)
            ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
              SnackBar(
                content: TextButton(
                  child: Text(
                    "Alert! Location permission denied. Click here to open setting"
                        .tr,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Geolocator.openAppSettings();
                  },
                ),
              ),
            );
        }

        // Request permission to access the device's location
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          locationLoader.value = false;
        }
        locationLoader.value = false;
      } else {
        if (permission == LocationPermission.denied) {
          locationLoader.value = false;
        }
        permission = await Geolocator.requestPermission();
        locationLoader.value = false;
      }

      // Get the current position (latitude and longitude)
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      lat = position.latitude;
      lng = position.longitude;

      if (!kIsWeb) {
        // Use reverse geocoding to get the postal code from the coordinates
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);

        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          String postalCode = placemark.postalCode!;

          if (postalCode.isEmpty) {
            final url =
                '${Constants.googleMapsApiKey}${position.latitude},${position.longitude}&key=$apiKey';
            final response = await http.get(Uri.parse(url));
            String formattedAddress = '';

            if (response.statusCode == 200) {
              final decodedData = geocodingResponseFromJson(response.body);
              if (decodedData['results'] != null &&
                  decodedData['results'].isNotEmpty) {
                formattedAddress =
                    decodedData['results'][0]['formatted_address'];
              }
            }
            // Use formattedAddress when postalCode is empty
            currentPostCode.value = formattedAddress;
          } else {
            currentPostCode.value = postalCode;
          }
          appData.write('postcode', currentPostCode.value);

          locationLoader.value = false;

          // You can use the postalCode variable as needed in your app
        } else {
          currentPostCode.value = 'Set Location';
          locationLoader.value = false;
        }
      } else {
        final url =
            '${Constants.googleGeoCodingApi}${position.latitude},${position.longitude}&key=$apiKey';

        final response = await http.get(Uri.parse(url));
        var formattedAddress;

        if (response.statusCode == 200) {
          final decodedData = geocodingResponseFromJson(response.body);
          if (decodedData['results'] != null &&
              decodedData['results'].isNotEmpty) {
            formattedAddress = decodedData['results'][0]['formatted_address'];
            currentPostCode.value = formattedAddress;
          }
          locationLoader.value = false;
        }
        appData.write('postcode', currentPostCode.value);

        locationLoader.value = false;
      }
      locationLoader.value = false;
    } catch (e) {
      currentPostCode.value = 'Set Location';

      locationLoader.value = false;
    }
  }

  Map<String, dynamic> geocodingResponseFromJson(String str) {
    final Map<String, dynamic> jsonData =
        Map<String, dynamic>.from(json.decode(str));
    return jsonData;
  }
}
