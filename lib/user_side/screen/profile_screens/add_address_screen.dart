import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/controller/profile_controller/add_address_controller.dart';
import 'package:suvastufood/utils/const.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatelessWidget {
  final AddAddressController _locationController =
      Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Add Address'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: TextFormField(
              maxLines: 4,
              minLines: 1,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimary, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: kWhite,
                filled: true,
                isDense: true,
                hintText: "Search Location",
                border: InputBorder.none,
                hintStyle: TextStyle(color: kGrey, fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: Obx(() => GoogleMap(
                  onMapCreated: _locationController.onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _locationController.currentPosition.value,
                    zoom: 14.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: {
                    Marker(
                      markerId: MarkerId('selected-location'),
                      position: _locationController.selectedPosition.value,
                    ),
                  },
                  onTap: _locationController.onMapTap,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: mQ.width * 0.85,
                height: 50,
                child: ResuableButton(
                    text: "Add New Location".tr,
                    onPressed: () {
                      // Handle the location addition logic here
                      print(
                          "Selected Position: ${_locationController.selectedPosition.value}");
                    },
                    color: kSecondaryMain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
