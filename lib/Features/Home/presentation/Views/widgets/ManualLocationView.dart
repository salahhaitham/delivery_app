import 'package:delivery_app/Features/Home/Domain/Services/LocationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:latlong2/latlong.dart';
import '../../../Domain/model/UserLocation1.dart';

class ManualLocationView extends StatefulWidget {
  const ManualLocationView({super.key});

  @override
  State<ManualLocationView> createState() => _ManualLocationViewState();
}

class _ManualLocationViewState extends State<ManualLocationView> {
  LatLng _selectedLocation = LatLng(30.0444, 31.2357);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: _selectedLocation,
              zoom: 13,
              onTap: (tapPosition, point) {
                setState(() {
                  _selectedLocation = point;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _selectedLocation,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              )

            ],
          ),

          // Confirm Button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async{
                final userLocation = UserLocation1(
                  lat: _selectedLocation.latitude,
                  lng: _selectedLocation.longitude, name: 'null',
                );
                final tempPosition = Position(
                  latitude: userLocation.lat,
                  longitude: userLocation.lng,
                  timestamp: DateTime.now(),
                  accuracy: 0,
                  altitude: 0,
                  heading: 0,
                  speed: 0,
                  speedAccuracy: 0, altitudeAccuracy: 0.0,
                  headingAccuracy: 0.0,

                );
                final locationName = await LocationService().getLocationName(
                    tempPosition
                );
                final finalUserLocation = UserLocation1(
                  lat: userLocation.lat,
                  lng: userLocation.lng,
                  name: locationName,
                );
                Navigator.pop(context, finalUserLocation);
              },
              child: const Text('Confirm Location'),
            ),
          )
        ],
      ),
    );
  }
}
