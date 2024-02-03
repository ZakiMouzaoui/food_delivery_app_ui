import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_app_bar.dart';
import 'package:food_delivery_app_ui/common_widgets/custom_text_field.dart';
import 'package:food_delivery_app_ui/constants/colors.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:location/location.dart';


class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  Location location = Location();
  LocationData? currentLocation;
  CameraPosition? position;
  GoogleMapController? _mapController;

  @override
  void initState(){
    super.initState();
    _checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h), child: const CustomAppBar(
            title: "Change Address",
            hasReturnBtn: true,
            hasCart: false,
          ),),

          Expanded(flex: 3, child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(0.0, 0.0), // Initial position, you can set it to any default location
              zoom: 10.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            mapType: MapType.normal,
            markers: currentLocation != null
                ? {
              Marker(
                markerId: const MarkerId("userLocation"),
                position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                //infoWindow: const InfoWindow(title: "Your Location"),
              ),
            }
                : <Marker>{},
          )),
          Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h), child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomTextField(hint: "Search Location", prefixIcon: Icons.search,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.star, color: AppColors.primaryColor,),
                      ),
                      SizedBox(width: 10.w,),
                      Text("Choose a saved place", style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryTextColor,)
                ],
              ),
            ],
          ))),
        ],
      ),
    ));
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check location permission
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        Get.back();
      }
    }
    currentLocation = await location.getLocation();
    if (_mapController != null && currentLocation != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 15.0,
          ),
        ),
      );
    }
  }
}
