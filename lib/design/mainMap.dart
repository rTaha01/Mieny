import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _addMarkers();
    _controller != ScrollController();
  }

  Future<void> _addMarkers() async {
    final Uint8List markerIcon1 = await _getMarkerIcon('assets/Icons/ship.png');
    final Uint8List markerIcon2 = await _getMarkerIcon('assets/Icons/bike.png');
    final Uint8List markerIcon3 = await _getMarkerIcon('assets/Icons/car.png');

    userIcon = await _getMarkerIcon('assets/Icons/location.png');

    _markers.add(
      Marker(
        markerId: const MarkerId('marker1'),
        position: const LatLng(2.682199, 72.938015),
        icon: BitmapDescriptor.fromBytes(markerIcon1),
        infoWindow: const InfoWindow(title: 'Marker 1'),
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('marker2'),
        position: const LatLng(2.453092, 73.049524),
        icon: BitmapDescriptor.fromBytes(markerIcon2),
        infoWindow: const InfoWindow(title: 'Marker 2'),
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('marker3'),
        position: const LatLng(2.977815, 73.508957),
        icon: BitmapDescriptor.fromBytes(markerIcon3),
        infoWindow: const InfoWindow(title: 'Marker 3'),
      ),
    );
  }

  Future<Uint8List> _getMarkerIcon(String path) async {
    final ByteData data = await rootBundle.load(path);
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
            padding: const EdgeInsets.only(top: 50.0,left: 380),
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
                    // Update the selected filter when an option is chosen
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
}
