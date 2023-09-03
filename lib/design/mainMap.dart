import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Constans.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  ScrollController? _controller;
  GoogleMapController? mapController;
  LatLng? userLocation;
  Uint8List? userIcon;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(2.671783, 72.891455),
    zoom: 16,
  );

  final List<Marker> _markers = <Marker>[];
  String selectedFilter = 'All Vehicles';

  void _updateFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  Future<void> _addMarkers() async {
    try {
      final Uint8List markerIcon1 = await _getMarkerIcon(
          'assets/Icons/ship.png');
      final Uint8List markerIcon2 = await _getMarkerIcon(
          'assets/Icons/bike.png');
      final Uint8List markerIcon3 = await _getMarkerIcon(
          'assets/Icons/car.png');

      userIcon = await _getMarkerIcon('assets/Icons/location.png');

      _markers.add(
        Marker(
          markerId: const MarkerId('marker1'),
          position: const LatLng(2.682199, 72.938015),
          icon: BitmapDescriptor.fromBytes(markerIcon1),
          onTap: () {
            _showMarkerDialog();
          },
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId('marker2'),
          position: const LatLng(2.453092, 73.049524),
          icon: BitmapDescriptor.fromBytes(markerIcon2),
          onTap: () {
            _showMarkerDialog();
          },
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId('marker3'),
          position: const LatLng(2.977815, 73.508957),
          icon: BitmapDescriptor.fromBytes(markerIcon3),
          onTap: () {
            _showMarkerDialog();
          },
        ),
      );
    } catch(e){
      print('Error loading marker icons: $e');
    }
  }

  Future<Uint8List> _getMarkerIcon(String path) async {
    final ByteData data = await rootBundle.load(path);
    print('Asset path: $path');
    print('ByteData length: ${data.lengthInBytes}');
    return data.buffer.asUint8List();
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        userLocation = LatLng(position.latitude, position.longitude);
      });

      mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        userLocation!,
        14.0,
      ));
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _addMarkers();
    _controller != ScrollController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            child: GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition: _kGooglePlex,
              markers: userLocation != null
                  ? {
                      Marker(
                        markerId: const MarkerId('user_location'),
                        position: userLocation!,
                        icon: BitmapDescriptor.fromBytes(userIcon!),
                        infoWindow: const InfoWindow(title: 'Your Location'),
                      ),
                      ..._markers,
                    }
                  : {},
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 380),
            child: IconButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    MediaQuery.of(context).size.width - 50,
                    kToolbarHeight,
                    0,
                    0,
                  ),
                  items: [
                    const PopupMenuItem(
                      value: 'All Vehicles',
                      child: Text('All Vehicles'),
                    ),
                    const PopupMenuItem(
                      value: 'Favorite Vehicles',
                      child: Text('Favorite Vehicles'),
                    ),
                    const PopupMenuItem(
                      value: 'Other Option',
                      child: Text('Other Option'),
                    ),
                  ],
                ).then((selectedValue) {
                  if (selectedValue != null) {
                    _updateFilter(selectedValue);
                  }
                });
              },
              icon: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
    );
  }

  void _showMarkerDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Align(
              alignment: Alignment.center,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: SizedBox(
                  height: 250,
                  width: 330,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Tracking Route",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: (){
                          largerDetails();
                        },
                        child: Text("Show more details",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: primaryColor)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Male",
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: Colors.grey.shade400)),
                              const Text("09:00",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      color: Colors.black)),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 1.5,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 1.5,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("Fuvahmulah",
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: Colors.grey.shade400)),
                              const Text("23:00",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Tracking",
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: Colors.grey.shade400)),
                              const Text("Car",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      color: Colors.black)),
                            ],
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          Container(
                            height: 50,
                            width: 1.5,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            width: 19,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Active",
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: Colors.grey.shade400)),
                              const Text("01",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      color: Colors.black)),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 50,
                            width: 1.5,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("Arrival",
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Inter",
                                      color: Colors.grey.shade400)),
                              const Text("10 min",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
  void largerDetails() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: SizedBox(
                  height: 600,
                  width: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Jane",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Located on the school grounds",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Inter",
                              color: Colors.grey.shade500)),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Text("Show previous tracking",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                color: primaryColor)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 75,
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: Offset(2 ,2 ),
                                ),
                              ]
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset("assets/Icons/pocess-icon.png"),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tracking Completed",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            color: Colors.black)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("17 min until the end",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            color: Colors.grey.shade500)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 40,
                                width: 1.4,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset("assets/Icons/grey_process.png"),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tracking Started",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: Colors.grey.shade500)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("10:30 -",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: Colors.grey.shade500)),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 40,
                                width: 1.4,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset("assets/Icons/remain.png"),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Driver Stopped",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: Colors.grey.shade500)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("46 min before the start",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: Colors.grey.shade500)),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 40,
                                width: 1.4,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset("assets/Icons/remain.png"),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Driver Stopped",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: Colors.grey.shade500)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("120 min before the start",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Inter",
                                          color: Colors.grey.shade500)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
