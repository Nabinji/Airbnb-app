import 'package:airbnb_app_ui/model/place_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapFlutter extends StatefulWidget {
  final Place place;
  const GoogleMapFlutter({super.key, required this.place});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  // Initial location for the map's camera position (latitude and longitude)
  // LatLng myCurrentLocation = const LatLng(w, 85.3240);
  // LatLng myCurrentLocation = const LatLng(28.578382, 81.63359);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      markers: {
        Marker(
          markerId: MarkerId(widget.place.address),
          position: LatLng(
            widget.place.latitude,
            widget.place.longitude,
          ),
        )
      },

      // Initial camera position of the map
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.place.latitude,
          widget.place.longitude,
        ),
        zoom: 13,
      ),
    );
  }
}
