import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? userLocation;
  Uint8List? userIcon;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(2.671783, 72.891455),
    zoom: 14,
  );

  final List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _addMarkers();
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
        15.0,
      ));
    } catch (e) {
      Get.snackbar("Error!", "Error fetching location: $e");
      print('Error fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
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
        ],
      ),
    );
  }
}
