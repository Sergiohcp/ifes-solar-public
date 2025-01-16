import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ifes_solar/controllers/simulation_controller.dart';
import 'package:ifes_solar/models/coordinates.dart';
import 'package:ifes_solar/utils/location.dart';
import 'package:ifes_solar/widgets/custom_button_widget.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_scaffold_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';
import 'package:ifes_solar/widgets/search_text_field_widget.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final SimulationController simulationController =
      Get.find<SimulationController>();

  Timer? _debounce;

  // GEOCODING
  Geolocator geolocator = Geolocator();

  var isLoadingSearch = false;
  var isLoadingCurrentPosition = true;

  var selectedAddress = '';

  onSearchChanged(String address) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      findCoordinates(address);
    });
  }

  findCoordinates(String address) async {
    setState(() {
      isLoadingSearch = true;
    });
    final Coordinates? coordinates = await getCoordinatesFromAddress(address);
    setState(() {
      isLoadingSearch = false;
    });
    gotToPosition(
        coordinates?.latitude as double, coordinates?.longitude as double);
  }

  // GOOGLE MAPS
  Completer<GoogleMapController> mapController = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(-20.3110973, -40.3185824),
    zoom: 15,
  );

  Future<void> gotToPosition(double latitude, double longitude) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15,
    )));
    final markerId = 'position';
    final marker = Marker(
      markerId: MarkerId(markerId),
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    setState(() {
      markers[MarkerId(markerId)] = marker;
    });
    final address = await getAddressFromCoordinates(latitude, longitude);
    simulationController.setSelectedLocation(address as String);
    simulationController.setSelectedCoordinates(Coordinates.createCoordinates(
        {'latitude': latitude, 'longitude': longitude}));
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition().then((position) {
      setState(() {
        isLoadingCurrentPosition = false;
      });
      gotToPosition(position.latitude, position.longitude);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Localização",
        withArrow: true,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SearchTextField(
                          onChanged: onSearchChanged,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      isLoadingCurrentPosition
                          ? CustomLoading()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: GoogleMap(
                                      initialCameraPosition:
                                          initialCameraPosition,
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        mapController.complete(controller);
                                      },
                                      markers: markers.values.toSet(),
                                      onTap: (value) {
                                        gotToPosition(
                                            value.latitude, value.longitude);
                                      },
                                      myLocationButtonEnabled: false,
                                    )),
                                SizedBox(
                                  height: 16,
                                ),
                                Obx(() => Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: CustomText(
                                        simulationController.selectedLocation,
                                        variant:
                                            CustomTextVariant.paragraphSmall,
                                        color: "gray.dark",
                                      ),
                                    ))
                              ],
                            )
                    ],
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    text: "Próximo",
                    onPressed: () => {Get.toNamed('/Area')},
                    disabled:
                        !simulationController.selectedCoordinates.isValid(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
